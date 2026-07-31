import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'rule_config.freezed.dart';
part 'rule_config.g.dart';

/// Fully configurable rules — loaded from assets/config/rule_config.json.
@freezed
class RuleConfig with _$RuleConfig {
  const factory RuleConfig({
    required ClassicRules classic,
    required PowerRules power,
  }) = _RuleConfig;

  factory RuleConfig.fromJson(Map<String, dynamic> json) =>
      _$RuleConfigFromJson(json);
}

@freezed
class ClassicRules with _$ClassicRules {
  const factory ClassicRules({
    @Default(6) int unlockRoll,
    @Default(true) bool extraTurnOnSix,
    @Default(true) bool threeSixesRule,
    @Default(true) bool exactFinish,
    @Default(true) bool captureEnabled,
    @Default([1, 9, 14, 22, 27, 35, 40, 48]) List<int> safeCells,
    @Default(52) int mainPathLength,
    @Default(5) int homeStretchLength,
    @Default(3) int maxConsecutiveSixes,
  }) = _ClassicRules;

  factory ClassicRules.fromJson(Map<String, dynamic> json) =>
      _$ClassicRulesFromJson(json);
}

@freezed
class PowerRules with _$PowerRules {
  const factory PowerRules({
    @Default(true) bool enabled,
    @Default(10) int momentumMax,
    required MomentumEarn earn,
    required MomentumSpend spend,
    required PowerFeatures features,
  }) = _PowerRules;

  factory PowerRules.fromJson(Map<String, dynamic> json) =>
      _$PowerRulesFromJson(json);
}

@freezed
class MomentumEarn with _$MomentumEarn {
  const factory MomentumEarn({
    @Default(2) int capture,
    @Default(3) int reachHome,
    @Default(2) int completeLap,
    @Default(1) int safeStar,
    @Default(3) int destroyShield,
  }) = _MomentumEarn;

  factory MomentumEarn.fromJson(Map<String, dynamic> json) =>
      _$MomentumEarnFromJson(json);
}

@freezed
class MomentumSpend with _$MomentumSpend {
  const factory MomentumSpend({
    @Default(2) int reverseMove,
    @Default(3) int shield,
    @Default(4) int goldenDice,
    @Default(3) int breakBlockade,
    @Default(3) int doubleMove,
    @Default(2) int safeLanding,
    @Default(2) int momentumBoost,
    @Default(2) int reRoll,
  }) = _MomentumSpend;

  factory MomentumSpend.fromJson(Map<String, dynamic> json) =>
      _$MomentumSpendFromJson(json);

  const MomentumSpend._();

  int costOf(PowerType type) => switch (type) {
        PowerType.reverseMove => reverseMove,
        PowerType.shield => shield,
        PowerType.goldenDice => goldenDice,
        PowerType.breakBlockade => breakBlockade,
        PowerType.doubleMove => doubleMove,
        PowerType.safeLanding => safeLanding,
        PowerType.momentumBoost => momentumBoost,
        PowerType.reRoll => reRoll,
        PowerType.portal => 0,
      };
}

@freezed
class PowerFeatures with _$PowerFeatures {
  const factory PowerFeatures({
    @Default(true) bool shield,
    @Default(true) bool portal,
    @Default(true) bool goldenDice,
    @Default(true) bool comboBonus,
    @Default(true) bool momentum,
    @Default(true) bool reverseMovement,
    @Default(true) bool breakBlockade,
    @Default(true) bool safeLanding,
    @Default(true) bool doubleMove,
    @Default(true) bool momentumBoost,
  }) = _PowerFeatures;

  factory PowerFeatures.fromJson(Map<String, dynamic> json) =>
      _$PowerFeaturesFromJson(json);

  const PowerFeatures._();

  bool isEnabled(PowerType type) => switch (type) {
        PowerType.shield => shield,
        PowerType.portal => portal,
        PowerType.goldenDice => goldenDice,
        PowerType.reverseMove => reverseMovement,
        PowerType.breakBlockade => breakBlockade,
        PowerType.doubleMove => doubleMove,
        PowerType.safeLanding => safeLanding,
        PowerType.momentumBoost => momentumBoost,
        PowerType.reRoll => momentum,
      };
}
