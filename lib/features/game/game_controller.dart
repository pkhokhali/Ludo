import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    _engine = GameEngine(config: effective);
    _ai = AiEngine(rules: _engine!.rules);

    final initial = GameStateFactory.create(config: gameConfig);
    state = GameSession(
      state: initial,
      config: gameConfig,
      ruleConfig: effective,
    );
    _scheduleAiIfNeeded();
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

    // Preview roll with forced path: apply engine roll, then expose face for animation.
    final result = eng.apply(s.state, GameAction.rollDice(playerId: player.id));
    if (!result.isOk) {
      state = s.copyWith(lastError: result.error);
      return;
    }

    final face = result.events
        .map(
          (e) => e.maybeMap(diceRolled: (d) => d.value, orElse: () => null),
        )
        .whereType<int>()
        .cast<int>();
    final faceValue = face.isEmpty ? null : face.first;
    state = s.copyWith(
      state: result.state,
      lastEvents: result.events,
      clearError: true,
      diceRolling: true,
      pendingDiceFace: faceValue,
    );
  }

  void finishDiceAnimation() {
    final s = state;
    if (s == null) return;
    state = s.copyWith(diceRolling: false, clearPendingDice: true);
    _scheduleAiIfNeeded();
  }

  void moveToken(String tokenId) {
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
    state = s.copyWith(
      state: result.state,
      lastEvents: result.events,
      clearError: true,
    );
    _scheduleAiIfNeeded();
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
    _aiTimer = Timer(const Duration(milliseconds: 700), () {
      final current = state;
      if (current == null) return;
      final action = ai.decide(current.state, difficulty);
      if (action == null) return;
      final result = eng.apply(current.state, action);
      if (!result.isOk) return;
      state = current.copyWith(
        state: result.state,
        lastEvents: result.events,
        clearError: true,
      );
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
