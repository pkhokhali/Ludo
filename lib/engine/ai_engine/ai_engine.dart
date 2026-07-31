import 'dart:math';

import 'package:ludo_arena/engine/rule_engine/rule_engine_facade.dart';
import 'package:ludo_arena/engine/rule_engine/validation_result.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_action.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/rule_config.dart';

/// Weights that scale with [AiDifficulty].
class AiWeights {
  const AiWeights({
    required this.capture,
    required this.finish,
    required this.unlock,
    required this.safeLanding,
    required this.progress,
    required this.riskAvoid,
    required this.powerUse,
    required this.noise,
  });

  final double capture;
  final double finish;
  final double unlock;
  final double safeLanding;
  final double progress;
  final double riskAvoid;
  final double powerUse;

  /// Random jitter 0..noise added to scores (higher = more mistakes).
  final double noise;

  static AiWeights forDifficulty(AiDifficulty d) => switch (d) {
        AiDifficulty.easy => const AiWeights(
            capture: 8,
            finish: 12,
            unlock: 6,
            safeLanding: 2,
            progress: 1,
            riskAvoid: 0.5,
            powerUse: 1,
            noise: 14,
          ),
        AiDifficulty.medium => const AiWeights(
            capture: 16,
            finish: 20,
            unlock: 10,
            safeLanding: 6,
            progress: 2,
            riskAvoid: 4,
            powerUse: 4,
            noise: 7,
          ),
        AiDifficulty.hard => const AiWeights(
            capture: 28,
            finish: 32,
            unlock: 14,
            safeLanding: 12,
            progress: 3,
            riskAvoid: 10,
            powerUse: 8,
            noise: 2.5,
          ),
        AiDifficulty.expert => const AiWeights(
            capture: 40,
            finish: 45,
            unlock: 18,
            safeLanding: 18,
            progress: 4,
            riskAvoid: 16,
            powerUse: 12,
            noise: 0.4,
          ),
      };
}

/// AI Engine — picks [GameAction]s using RuleEngine legal moves only.
class AiEngine {
  AiEngine({
    required this.rules,
    Random? random,
  }) : _random = random ?? Random();

  final RuleEngine rules;
  final Random _random;

  factory AiEngine.fromConfig(RuleConfig config, {Random? random}) {
    return AiEngine(rules: RuleEngine(config), random: random);
  }

  /// Decide next action for the current AI player.
  GameAction? decide(GameState state, AiDifficulty difficulty) {
    final player = state.players[state.currentPlayerIndex];
    if (player.type != PlayerType.ai) return null;
    if (state.isFinished) return null;

    final weights = AiWeights.forDifficulty(difficulty);

    if (state.phase == GamePhase.rolling && !state.awaitingMove) {
      final power = _maybeUsePowerBeforeRoll(state, player.id, weights);
      if (power != null) return power;
      return GameAction.rollDice(playerId: player.id);
    }

    if (state.awaitingMove && state.lastDiceValue != null) {
      final move = _pickMove(state, state.lastDiceValue!, weights);
      if (move != null) {
        return GameAction.moveToken(
          tokenId: move.token.id,
          playerId: player.id,
        );
      }
      return GameAction.endTurn(playerId: player.id);
    }

    return null;
  }

  LegalMove? _pickMove(GameState state, int dice, AiWeights w) {
    final moves = rules.getLegalMoves(state, dice);
    if (moves.isEmpty) return null;

    LegalMove? best;
    var bestScore = double.negativeInfinity;

    for (final m in moves) {
      final score = _scoreMove(state, m, w) + _random.nextDouble() * w.noise;
      if (score > bestScore) {
        bestScore = score;
        best = m;
      }
    }
    return best;
  }

  double _scoreMove(GameState state, LegalMove m, AiWeights w) {
    var score = 0.0;

    if (m.capturesTokenId != null) score += w.capture;
    if (m.finishes) score += w.finish;
    if (m.unlocks) score += w.unlock;
    if (m.entersHomeStretch) score += w.finish * 0.4;

    score += m.pathProgress * w.progress;
    score += m.homeProgress * w.progress * 2;

    if (rules.classic.geometry.isSafeCell(m.toPosition)) {
      score += w.safeLanding;
    }

    // Risk: landing where an opponent could capture next turn (approx).
    score -= _threatScore(state, m) * w.riskAvoid;

    return score;
  }

  double _threatScore(GameState state, LegalMove m) {
    if (m.toStatus != TokenStatus.onBoard) return 0;
    if (rules.classic.geometry.isSafeCell(m.toPosition)) return 0;

    var threat = 0.0;
    final opponents = state.tokens.where(
      (t) =>
          t.seat != m.token.seat &&
          t.status == TokenStatus.onBoard,
    );
    for (final opp in opponents) {
      final dist = (m.toPosition - opp.position + 52) % 52;
      if (dist >= 1 && dist <= 6) threat += 1.0 / dist;
    }
    return threat;
  }

  GameAction? _maybeUsePowerBeforeRoll(
    GameState state,
    String playerId,
    AiWeights w,
  ) {
    if (!rules.config.power.enabled) return null;
    if (w.powerUse < 3) return null; // Easy/low rarely uses powers
    if (_random.nextDouble() > (w.powerUse / 20)) return null;

    final player = state.players.firstWhere((p) => p.id == playerId);

    // Prefer shield on a vulnerable advanced token.
    if (player.momentum >= rules.config.power.spend.shield) {
      final candidates = state.tokens.where(
        (t) =>
            t.seat == player.seat &&
            t.status == TokenStatus.onBoard &&
            !t.hasShield &&
            t.pathProgress > 10,
      );
      if (candidates.isNotEmpty) {
        final token = candidates.reduce(
          (a, b) => a.pathProgress >= b.pathProgress ? a : b,
        );
        final check = rules.canUsePower(
          state,
          playerId,
          PowerType.shield,
          tokenId: token.id,
        );
        if (check.isValid) {
          return GameAction.usePower(
            power: PowerType.shield,
            playerId: playerId,
            tokenId: token.id,
          );
        }
      }
    }

    if (player.momentum >= rules.config.power.spend.goldenDice) {
      final check = rules.canUsePower(state, playerId, PowerType.goldenDice);
      if (check.isValid && w.powerUse >= 8) {
        return GameAction.usePower(
          power: PowerType.goldenDice,
          playerId: playerId,
        );
      }
    }

    return null;
  }
}
