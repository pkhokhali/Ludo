import 'package:ludo_arena/engine/rule_engine/board_geometry.dart';
import 'package:ludo_arena/engine/rule_engine/classic_rule_engine.dart';
import 'package:ludo_arena/engine/rule_engine/validation_result.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/models/rule_config.dart';
import 'package:ludo_arena/models/token.dart';

/// Power Mode + Momentum — extends Classic via RuleConfig.power toggles.
class PowerRuleEngine {
  PowerRuleEngine(this.config) : classic = ClassicRuleEngine(config);

  final RuleConfig config;
  final ClassicRuleEngine classic;

  PowerRules get power => config.power;
  BoardGeometry get geometry => classic.geometry;

  bool get isPowerActive => power.enabled;

  /// Clamp momentum into [0, momentumMax].
  int clampMomentum(int value) =>
      value.clamp(0, power.momentumMax);

  int earnForCapture() => power.earn.capture;
  int earnForReachHome() => power.earn.reachHome;
  int earnForCompleteLap() => power.earn.completeLap;
  int earnForSafeStar() => power.earn.safeStar;
  int earnForDestroyShield() => power.earn.destroyShield;

  ValidationResult canUsePower(
    GameState state,
    String playerId,
    PowerType type, {
    String? tokenId,
  }) {
    if (!isPowerActive) {
      return const ValidationResult.invalid('Power mode disabled');
    }
    if (!power.features.isEnabled(type)) {
      return ValidationResult.invalid('${type.name} is disabled');
    }
    if (!power.features.momentum && type != PowerType.portal) {
      return const ValidationResult.invalid('Momentum system disabled');
    }

    final player = state.players.firstWhere((p) => p.id == playerId);
    if (state.players[state.currentPlayerIndex].id != playerId) {
      return const ValidationResult.invalid('Not your turn');
    }

    final cost = power.spend.costOf(type);
    if (player.momentum < cost) {
      return ValidationResult.invalid(
        'Need $cost momentum (have ${player.momentum})',
      );
    }

    return switch (type) {
      PowerType.shield => _canShield(state, player, tokenId),
      PowerType.goldenDice => const ValidationResult.ok(),
      PowerType.reRoll => const ValidationResult.ok(),
      PowerType.reverseMove => _canReverse(state, player, tokenId),
      PowerType.breakBlockade => _canBreakBlockade(state, player, tokenId),
      PowerType.doubleMove => _canDoubleMove(state, player),
      PowerType.safeLanding => _canSafeLanding(state, player, tokenId),
      PowerType.momentumBoost => const ValidationResult.ok(),
      PowerType.portal => _canPortal(state, player, tokenId),
    };
  }

  ValidationResult _canShield(
    GameState state,
    Player player,
    String? tokenId,
  ) {
    if (tokenId == null) {
      return const ValidationResult.invalid('Select a token for shield');
    }
    final token = state.tokens.firstWhere((t) => t.id == tokenId);
    if (token.seat != player.seat) {
      return const ValidationResult.invalid('Token not yours');
    }
    if (token.status != TokenStatus.onBoard) {
      return const ValidationResult.invalid('Token must be on board');
    }
    if (token.hasShield) {
      return const ValidationResult.invalid('Already shielded');
    }
    return const ValidationResult.ok();
  }

  ValidationResult _canReverse(
    GameState state,
    Player player,
    String? tokenId,
  ) {
    if (tokenId == null) {
      return const ValidationResult.invalid('Select a token to reverse');
    }
    final token = state.tokens.firstWhere((t) => t.id == tokenId);
    if (token.seat != player.seat || token.status != TokenStatus.onBoard) {
      return const ValidationResult.invalid('Token must be on board');
    }
    if (token.pathProgress <= 0) {
      return const ValidationResult.invalid('Cannot reverse further');
    }
    return const ValidationResult.ok();
  }

  ValidationResult _canBreakBlockade(
    GameState state,
    Player player,
    String? tokenId,
  ) {
    if (tokenId == null) {
      return const ValidationResult.invalid('Select attacking token');
    }
    final dice = state.lastDiceValue;
    if (dice == null) {
      return const ValidationResult.invalid('Roll dice first');
    }
    final token = state.tokens.firstWhere((t) => t.id == tokenId);
    if (token.seat != player.seat || token.status != TokenStatus.onBoard) {
      return const ValidationResult.invalid('Token must be on board');
    }
    final nextProgress = token.pathProgress + dice;
    if (nextProgress >= classic.classic.mainPathLength) {
      return const ValidationResult.invalid('No blockade ahead');
    }
    final toPos = geometry.absoluteFromProgress(token.seat, nextProgress);
    final stack = state.tokens
        .where(
          (t) =>
              t.seat != player.seat &&
              t.status == TokenStatus.onBoard &&
              t.position == toPos,
        )
        .length;
    if (stack < 2) {
      return const ValidationResult.invalid('Destination is not blockaded');
    }
    return const ValidationResult.ok();
  }

  ValidationResult _canDoubleMove(GameState state, Player player) {
    if (state.lastDiceValue == null) {
      return const ValidationResult.invalid('Roll dice first');
    }
    return const ValidationResult.ok();
  }

  ValidationResult _canSafeLanding(
    GameState state,
    Player player,
    String? tokenId,
  ) {
    if (tokenId == null || state.lastDiceValue == null) {
      return const ValidationResult.invalid('Need token and dice');
    }
    final moves = classic.getLegalMoves(state, state.lastDiceValue!);
    final match = moves.where((m) => m.token.id == tokenId);
    if (match.isEmpty) {
      return const ValidationResult.invalid('Illegal landing');
    }
    return const ValidationResult.ok();
  }

  ValidationResult _canPortal(
    GameState state,
    Player player,
    String? tokenId,
  ) {
    if (tokenId == null) {
      return const ValidationResult.invalid('Select token for portal');
    }
    final token = state.tokens.firstWhere((t) => t.id == tokenId);
    if (token.seat != player.seat || token.status != TokenStatus.onBoard) {
      return const ValidationResult.invalid('Token must be on board');
    }
    return const ValidationResult.ok();
  }

  /// Apply shield to token (returns updated tokens list).
  List<Token> applyShield(List<Token> tokens, String tokenId) {
    return [
      for (final t in tokens)
        if (t.id == tokenId) t.copyWith(hasShield: true) else t,
    ];
  }

  /// Reverse one step on main path.
  Token applyReverse(Token token) {
    final progress = (token.pathProgress - 1).clamp(0, 999);
    final pos = geometry.absoluteFromProgress(token.seat, progress);
    return token.copyWith(pathProgress: progress, position: pos);
  }

  /// Destroy shield on capture — returns momentum bonus if shield destroyed.
  int momentumForCapture({required bool destroyedShield}) {
    var gain = earnForCapture();
    if (destroyedShield) gain += earnForDestroyShield();
    return gain;
  }

  /// Safe-star landing bonus when landing on configured safe cell.
  int momentumForLanding(int absoluteCellId) {
    if (geometry.isSafeCell(absoluteCellId) &&
        config.classic.safeCells.contains(absoluteCellId)) {
      return earnForSafeStar();
    }
    return 0;
  }

  List<PowerType> availablePowers(GameState state, String playerId) {
    if (!isPowerActive) return const [];
    return PowerType.values
        .where(
          (p) => canUsePower(state, playerId, p).isValid ||
              // Include affordability-failed only if feature on — UI greys out
              (power.features.isEnabled(p) &&
                  state.players.any((pl) => pl.id == playerId)),
        )
        .where((p) => power.features.isEnabled(p))
        .toList();
  }
}
