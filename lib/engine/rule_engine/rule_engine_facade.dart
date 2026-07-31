import 'package:ludo_arena/engine/rule_engine/classic_rule_engine.dart';
import 'package:ludo_arena/engine/rule_engine/power_rule_engine.dart';
import 'package:ludo_arena/engine/rule_engine/validation_result.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/rule_config.dart';

/// Facade — Classic always; Power when config.power.enabled / room toggles.
class RuleEngine {
  RuleEngine(this.config)
      : classic = ClassicRuleEngine(config),
        power = PowerRuleEngine(config);

  final RuleConfig config;
  final ClassicRuleEngine classic;
  final PowerRuleEngine power;

  List<LegalMove> getLegalMoves(GameState state, int diceValue) =>
      classic.getLegalMoves(state, diceValue);

  ValidationResult canRoll(GameState state) => classic.canRoll(state);

  bool isThreeSixesPenalty(GameState state, int diceValue) =>
      classic.isThreeSixesPenalty(state, diceValue);

  ValidationResult validateMove(
    GameState state,
    String tokenId,
    int diceValue,
  ) =>
      classic.validateMove(state, tokenId, diceValue);

  bool hasPlayerWon(GameState state, String playerId) =>
      classic.hasPlayerWon(state, playerId);

  ValidationResult canUsePower(
    GameState state,
    String playerId,
    PowerType type, {
    String? tokenId,
  }) =>
      power.canUsePower(state, playerId, type, tokenId: tokenId);
}
