import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/engine/ai_engine/ai_engine.dart';
import 'package:ludo_arena/engine/game_engine/game_engine.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_providers.dart';
import 'package:ludo_arena/engine/rule_engine/validation_result.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_action.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_event.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/rule_config.dart';

class GameSession {
  const GameSession({
    required this.state,
    required this.config,
    required this.ruleConfig,
    this.lastEvents = const [],
    this.lastError,
    this.diceRolling = false,
    this.pendingDiceFace,
  });

  final GameState state;
  final GameConfig config;
  final RuleConfig ruleConfig;
  final List<GameEvent> lastEvents;
  final String? lastError;
  final bool diceRolling;
  final int? pendingDiceFace;

  GameSession copyWith({
    GameState? state,
    List<GameEvent>? lastEvents,
    String? lastError,
    bool clearError = false,
    bool? diceRolling,
    int? pendingDiceFace,
    bool clearPendingDice = false,
  }) {
    return GameSession(
      state: state ?? this.state,
      config: config,
      ruleConfig: ruleConfig,
      lastEvents: lastEvents ?? this.lastEvents,
      lastError: clearError ? null : (lastError ?? this.lastError),
      diceRolling: diceRolling ?? this.diceRolling,
      pendingDiceFace:
          clearPendingDice ? null : (pendingDiceFace ?? this.pendingDiceFace),
    );
  }
}

class GameController extends StateNotifier<GameSession?> {
  GameController(this._ref) : super(null);

  final Ref _ref;
  GameEngine? _engine;
  AiEngine? _ai;
  Timer? _aiTimer;

  Future<void> start(GameConfig gameConfig) async {
    final rules = await _ref.read(ruleConfigRepositoryProvider).load();
    final effective = gameConfig.ruleOverrides ?? rules;
    _engine = GameEngine(
      config: effective,
      onStateChanged: (s) => _ref.read(gameSnapshotRepositoryProvider).save(s),
    );
    _ai = AiEngine(rules: _engine!.rules);

    final initial = GameStateFactory.create(config: gameConfig);
    await _ref.read(gameSnapshotRepositoryProvider).save(initial);
    state = GameSession(
      state: initial,
      config: gameConfig,
      ruleConfig: effective,
    );
    _scheduleAiIfNeeded();
  }

  Future<bool> resume() async {
    final snap = _ref.read(gameSnapshotRepositoryProvider).load();
    if (snap == null || snap.isFinished) return false;
    final rules = await _ref.read(ruleConfigRepositoryProvider).load();
    final effective = snap.config.ruleOverrides ?? rules;
    _engine = GameEngine(
      config: effective,
      onStateChanged: (s) => _ref.read(gameSnapshotRepositoryProvider).save(s),
    );
    _ai = AiEngine(rules: _engine!.rules);
    state = GameSession(
      state: snap,
      config: snap.config,
      ruleConfig: effective,
    );
    _scheduleAiIfNeeded();
    return true;
  }

  List<LegalMove> legalMoves() {
    final s = state;
    final eng = _engine;
    if (s == null || eng == null || s.state.lastDiceValue == null) {
      return const [];
    }
    return eng.rules.getLegalMoves(s.state, s.state.lastDiceValue!);
  }

  Future<void> requestRoll() async {
    final s = state;
    final eng = _engine;
    if (s == null || eng == null) return;
    if (s.state.phase != GamePhase.rolling || s.state.awaitingMove) return;

    final player = s.state.players[s.state.currentPlayerIndex];
    if (player.type != PlayerType.human) return;

    final result = eng.apply(s.state, GameAction.rollDice(playerId: player.id));
    if (!result.isOk) {
      state = s.copyWith(lastError: result.error);
      return;
    }

    await _ref.read(animationEngineProvider).handle(result.events);

    final face = result.events
        .map(
          (e) => e.maybeMap(diceRolled: (d) => d.value, orElse: () => null),
        )
        .whereType<int>();
    final faceValue = face.isEmpty ? null : face.first;
    state = s.copyWith(
      state: result.state,
      lastEvents: result.events,
      clearError: true,
      diceRolling: true,
      pendingDiceFace: faceValue,
    );
    await _maybeFinish(result.state);
  }

  void finishDiceAnimation() {
    final s = state;
    if (s == null) return;
    state = s.copyWith(diceRolling: false, clearPendingDice: true);
    _scheduleAiIfNeeded();
  }

  Future<void> moveToken(String tokenId) async {
    final s = state;
    final eng = _engine;
    if (s == null || eng == null) return;
    final player = s.state.players[s.state.currentPlayerIndex];
    if (player.type != PlayerType.human) return;

    final result = eng.apply(
      s.state,
      GameAction.moveToken(tokenId: tokenId, playerId: player.id),
    );
    if (!result.isOk) {
      state = s.copyWith(lastError: result.error);
      return;
    }
    await _ref.read(animationEngineProvider).handle(result.events);
    state = s.copyWith(
      state: result.state,
      lastEvents: result.events,
      clearError: true,
    );
    await _maybeFinish(result.state);
    if (!result.state.isFinished) _scheduleAiIfNeeded();
  }

  Future<void> _maybeFinish(GameState next) async {
    if (!next.isFinished) return;
    await _ref.read(gameSnapshotRepositoryProvider).clear();

    final human = next.players.where((p) => p.type == PlayerType.human);
    final won = human.any((p) => p.id == next.winnerPlayerId) ||
        (human.isNotEmpty && next.finishOrder.contains(human.first.id));
    final captures = human.fold<int>(0, (a, p) => a + p.captures);
    final momentum = next.players.fold<int>(0, (a, p) => a + p.momentum);

    final stats = await _ref.read(statisticsRepositoryProvider).recordMatch(
          won: won,
          captures: captures,
          momentumUsed: momentum,
        );
    await _ref.read(profileRepositoryProvider).addXp(won ? 50 : 15);
    await _ref.read(profileRepositoryProvider).addCoins(won ? 100 : 25);
    await _ref.read(achievementsRepositoryProvider).evaluate(
          wins: stats.wins,
          captures: stats.captures,
          streak: stats.currentWinningStreak,
          momentumUsage: stats.momentumUsage,
        );

    final prefs = _ref.read(preferencesServiceProvider);
    await prefs.incrementMatchesSinceLastAd();
  }

  void _scheduleAiIfNeeded() {
    _aiTimer?.cancel();
    final s = state;
    final eng = _engine;
    final ai = _ai;
    if (s == null || eng == null || ai == null || s.state.isFinished) return;

    final player = s.state.players[s.state.currentPlayerIndex];
    if (player.type != PlayerType.ai) return;

    final difficulty = player.aiDifficulty ?? AiDifficulty.medium;
    _aiTimer = Timer(const Duration(milliseconds: 700), () async {
      final current = state;
      if (current == null) return;
      final action = ai.decide(current.state, difficulty);
      if (action == null) return;
      final result = eng.apply(current.state, action);
      if (!result.isOk) return;
      await _ref.read(animationEngineProvider).handle(result.events);
      state = current.copyWith(
        state: result.state,
        lastEvents: result.events,
        clearError: true,
      );
      await _maybeFinish(result.state);
      if (!result.state.isFinished) {
        _scheduleAiIfNeeded();
      }
    });
  }

  @override
  void dispose() {
    _aiTimer?.cancel();
    super.dispose();
  }
}

final gameControllerProvider =
    StateNotifierProvider<GameController, GameSession?>((ref) {
  return GameController(ref);
});
