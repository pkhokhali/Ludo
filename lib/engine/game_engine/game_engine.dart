import 'dart:math';

import 'package:ludo_arena/engine/rule_engine/rule_engine_facade.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_action.dart';
import 'package:ludo_arena/models/game_event.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/models/rule_config.dart';
import 'package:ludo_arena/models/token.dart';

export 'game_state_factory.dart';

/// Result of applying one [GameAction].
class EngineResult {
  const EngineResult({
    required this.state,
    required this.events,
    this.error,
  });

  final GameState state;
  final List<GameEvent> events;
  final String? error;

  bool get isOk => error == null;
}

/// Optional hook for auto-save (wired in Module 10).
typedef GameSaveHook = Future<void> Function(GameState state);

/// Game Engine — turn loop, dice authority, move application, events.
/// Pure Dart. Reads rules only via [RuleEngine].
class GameEngine {
  GameEngine({
    required RuleConfig config,
    Random? random,
    this.onStateChanged,
  })  : rules = RuleEngine(config),
        _random = random ?? Random();

  final RuleEngine rules;
  final Random _random;
  final GameSaveHook? onStateChanged;

  EngineResult apply(GameState state, GameAction action) {
    final result = action.map(
      rollDice: (a) => _rollDice(state, a),
      moveToken: (a) => _moveToken(state, a),
      usePower: (a) => _usePower(state, a),
      endTurn: (a) => _endTurn(state, a),
      forfeit: (a) => _forfeit(state, a),
    );

    if (result.isOk && onStateChanged != null) {
      onStateChanged!(result.state);
    }
    return result;
  }

  EngineResult _rollDice(GameState state, RollDiceAction action) {
    final can = rules.canRoll(state);
    if (!can.isValid) {
      return EngineResult(state: state, events: const [], error: can.reason);
    }

    final player = state.players[state.currentPlayerIndex];
    if (action.playerId != null && action.playerId != player.id) {
      return EngineResult(
        state: state,
        events: const [],
        error: 'Not this player\'s turn',
      );
    }

    final value = action.forcedValue ?? (_random.nextInt(6) + 1);
    final events = <GameEvent>[
      GameEvent.diceRolled(playerId: player.id, value: value),
    ];

    if (value == rules.config.classic.unlockRoll) {
      events.add(GameEvent.sixRolled(playerId: player.id));
    }

    if (rules.isThreeSixesPenalty(state, value)) {
      events.add(GameEvent.threeSixesPenalty(playerId: player.id));
      final next = _advanceTurn(
        state.copyWith(
          lastDiceValue: value,
          consecutiveSixes: 0,
          awaitingMove: false,
          extraTurnPending: false,
          phase: GamePhase.rolling,
          updatedAt: DateTime.now().toUtc(),
        ),
      );
      events.add(
        GameEvent.turnChanged(
          playerId: next.players[next.currentPlayerIndex].id,
        ),
      );
      return EngineResult(state: next, events: events);
    }

    final consecutive = value == rules.config.classic.unlockRoll
        ? state.consecutiveSixes + 1
        : 0;

    final legal = rules.getLegalMoves(state, value);
    if (legal.isEmpty) {
      final extra = value == rules.config.classic.unlockRoll &&
          rules.config.classic.extraTurnOnSix;
      if (extra) {
        return EngineResult(
          state: state.copyWith(
            lastDiceValue: value,
            consecutiveSixes: consecutive,
            awaitingMove: false,
            extraTurnPending: true,
            phase: GamePhase.rolling,
            updatedAt: DateTime.now().toUtc(),
          ),
          events: events,
        );
      }
      final next = _advanceTurn(
        state.copyWith(
          lastDiceValue: value,
          consecutiveSixes: 0,
          awaitingMove: false,
          phase: GamePhase.rolling,
          updatedAt: DateTime.now().toUtc(),
        ),
      );
      events.add(
        GameEvent.turnChanged(
          playerId: next.players[next.currentPlayerIndex].id,
        ),
      );
      return EngineResult(state: next, events: events);
    }

    return EngineResult(
      state: state.copyWith(
        lastDiceValue: value,
        consecutiveSixes: consecutive,
        awaitingMove: true,
        extraTurnPending: value == rules.config.classic.unlockRoll &&
            rules.config.classic.extraTurnOnSix,
        phase: GamePhase.selectingToken,
        updatedAt: DateTime.now().toUtc(),
      ),
      events: events,
    );
  }

  EngineResult _moveToken(GameState state, MoveTokenAction action) {
    final dice = state.lastDiceValue;
    if (dice == null || !state.awaitingMove) {
      return EngineResult(
        state: state,
        events: const [],
        error: 'No pending dice move',
      );
    }

    final validation = rules.validateMove(state, action.tokenId, dice);
    if (!validation.isValid) {
      return EngineResult(
        state: state,
        events: const [],
        error: validation.reason,
      );
    }

    final legal = rules.getLegalMoves(state, dice).firstWhere(
          (m) => m.token.id == action.tokenId,
        );

    final events = <GameEvent>[];
    var tokens = List<Token>.from(state.tokens);
    var players = List<Player>.from(state.players);
    final player = players[state.currentPlayerIndex];

    if (legal.unlocks) {
      events.add(GameEvent.tokenUnlocked(tokenId: legal.token.id));
    }

    events.add(
      GameEvent.tokenMoved(
        tokenId: legal.token.id,
        from: legal.fromPosition,
        to: legal.toPosition,
      ),
    );

    tokens = [
      for (final t in tokens)
        if (t.id == legal.token.id)
          t.copyWith(
            status: legal.toStatus,
            position: legal.toPosition,
            pathProgress: legal.pathProgress,
            homeProgress: legal.homeProgress,
          )
        else
          t,
    ];

    if (legal.capturesTokenId != null) {
      final victim = tokens.firstWhere((t) => t.id == legal.capturesTokenId);
      final destroyedShield = victim.hasShield;
      events.add(
        GameEvent.captured(
          attackerTokenId: legal.token.id,
          victimTokenId: victim.id,
        ),
      );
      tokens = [
        for (final t in tokens)
          if (t.id == victim.id)
            t.copyWith(
              status: TokenStatus.yard,
              position: -1,
              pathProgress: 0,
              homeProgress: 0,
              hasShield: false,
            )
          else
            t,
      ];

      if (rules.config.power.enabled && rules.config.power.features.momentum) {
        final gain = rules.power.momentumForCapture(
          destroyedShield: destroyedShield,
        );
        players = _addMomentum(players, player.id, gain, events);
      }

      players = [
        for (final p in players)
          if (p.id == player.id) p.copyWith(captures: p.captures + 1) else p,
      ];
    }

    if (legal.finishes) {
      if (rules.config.power.enabled && rules.config.power.features.momentum) {
        players = _addMomentum(
          players,
          player.id,
          rules.power.earnForReachHome(),
          events,
        );
      }
      players = [
        for (final p in players)
          if (p.id == player.id)
            p.copyWith(tokensFinished: p.tokensFinished + 1)
          else
            p,
      ];
    } else if (legal.toStatus == TokenStatus.onBoard &&
        rules.config.power.enabled &&
        rules.config.power.features.momentum) {
      final star = rules.power.momentumForLanding(legal.toPosition);
      if (star > 0) {
        players = _addMomentum(players, player.id, star, events);
      }
    }

    var next = state.copyWith(
      tokens: tokens,
      players: players,
      awaitingMove: false,
      lastDiceValue: null,
      phase: GamePhase.rolling,
      updatedAt: DateTime.now().toUtc(),
    );

    if (rules.hasPlayerWon(next, player.id)) {
      events.add(GameEvent.playerWon(playerId: player.id));
      final order = [...next.finishOrder, player.id];
      players = [
        for (final p in players)
          if (p.id == player.id) p.copyWith(hasWon: true) else p,
      ];
      next = next.copyWith(
        players: players,
        finishOrder: order,
        isFinished: order.length >= next.players.length - 1 ||
            next.players.length == 2,
        winnerPlayerId: next.winnerPlayerId ?? player.id,
        phase: GamePhase.finished,
      );
      if (next.isFinished) {
        return EngineResult(state: next, events: events);
      }
    }

    if (state.extraTurnPending) {
      return EngineResult(
        state: next.copyWith(
          consecutiveSixes: state.consecutiveSixes,
          extraTurnPending: false,
          phase: GamePhase.rolling,
        ),
        events: events,
      );
    }

    next = _advanceTurn(next.copyWith(consecutiveSixes: 0));
    events.add(
      GameEvent.turnChanged(
        playerId: next.players[next.currentPlayerIndex].id,
      ),
    );
    return EngineResult(state: next, events: events);
  }

  EngineResult _usePower(GameState state, UsePowerAction action) {
    final playerId =
        action.playerId ?? state.players[state.currentPlayerIndex].id;
    final check = rules.canUsePower(
      state,
      playerId,
      action.power,
      tokenId: action.tokenId,
    );
    if (!check.isValid) {
      return EngineResult(state: state, events: const [], error: check.reason);
    }

    final cost = rules.config.power.spend.costOf(action.power);
    var players = List<Player>.from(state.players);
    var tokens = List<Token>.from(state.tokens);
    final events = <GameEvent>[
      GameEvent.powerUsed(playerId: playerId, power: action.power),
    ];

    players = _addMomentum(players, playerId, -cost, events);

    switch (action.power) {
      case PowerType.shield:
        tokens = rules.power.applyShield(tokens, action.tokenId!);
      case PowerType.reverseMove:
        tokens = [
          for (final t in tokens)
            if (t.id == action.tokenId) rules.power.applyReverse(t) else t,
        ];
      case PowerType.momentumBoost:
        players = _addMomentum(players, playerId, 2, events);
      case PowerType.reRoll:
      case PowerType.goldenDice:
        return EngineResult(
          state: state.copyWith(
            players: players,
            tokens: tokens,
            phase: GamePhase.rolling,
            awaitingMove: false,
            lastDiceValue: null,
            updatedAt: DateTime.now().toUtc(),
          ),
          events: events,
        );
      case PowerType.portal:
      case PowerType.breakBlockade:
      case PowerType.doubleMove:
      case PowerType.safeLanding:
        break;
    }

    return EngineResult(
      state: state.copyWith(
        players: players,
        tokens: tokens,
        updatedAt: DateTime.now().toUtc(),
      ),
      events: events,
    );
  }

  EngineResult _endTurn(GameState state, EndTurnAction action) {
    final next = _advanceTurn(
      state.copyWith(
        awaitingMove: false,
        lastDiceValue: null,
        consecutiveSixes: 0,
        extraTurnPending: false,
        phase: GamePhase.rolling,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    return EngineResult(
      state: next,
      events: [
        GameEvent.turnChanged(
          playerId: next.players[next.currentPlayerIndex].id,
        ),
      ],
    );
  }

  EngineResult _forfeit(GameState state, ForfeitAction action) {
    final players = [
      for (final p in state.players)
        if (p.id == action.playerId) p.copyWith(hasWon: false) else p,
    ];
    final remaining =
        players.where((p) => p.id != action.playerId && !p.hasWon).toList();
    if (remaining.length == 1) {
      return EngineResult(
        state: state.copyWith(
          players: [
            for (final p in players)
              if (p.id == remaining.first.id) p.copyWith(hasWon: true) else p,
          ],
          isFinished: true,
          winnerPlayerId: remaining.first.id,
          phase: GamePhase.finished,
          finishOrder: [...state.finishOrder, remaining.first.id],
        ),
        events: [GameEvent.playerWon(playerId: remaining.first.id)],
      );
    }
    final next = _advanceTurn(
      state.copyWith(players: players, updatedAt: DateTime.now().toUtc()),
    );
    return EngineResult(state: next, events: const []);
  }

  GameState _advanceTurn(GameState state) {
    if (state.isFinished) return state;
    var idx = state.currentPlayerIndex;
    for (var i = 0; i < state.players.length; i++) {
      idx = (idx + 1) % state.players.length;
      final candidate = state.players[idx];
      if (!candidate.hasWon) {
        return state.copyWith(
          currentPlayerIndex: idx,
          phase: GamePhase.rolling,
          awaitingMove: false,
          lastDiceValue: null,
        );
      }
    }
    return state.copyWith(isFinished: true, phase: GamePhase.finished);
  }

  List<Player> _addMomentum(
    List<Player> players,
    String playerId,
    int delta,
    List<GameEvent> events,
  ) {
    return [
      for (final p in players)
        if (p.id == playerId)
          () {
            final total = rules.power.clampMomentum(p.momentum + delta);
            events.add(
              GameEvent.momentumChanged(
                playerId: playerId,
                delta: delta,
                total: total,
              ),
            );
            return p.copyWith(momentum: total);
          }()
        else
          p,
    ];
  }
}
