// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RuleConfigImpl _$$RuleConfigImplFromJson(Map<String, dynamic> json) =>
    _$RuleConfigImpl(
      classic: ClassicRules.fromJson(json['classic'] as Map<String, dynamic>),
      power: PowerRules.fromJson(json['power'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RuleConfigImplToJson(_$RuleConfigImpl instance) =>
    <String, dynamic>{
      'classic': instance.classic.toJson(),
      'power': instance.power.toJson(),
    };

_$ClassicRulesImpl _$$ClassicRulesImplFromJson(Map<String, dynamic> json) =>
    _$ClassicRulesImpl(
      unlockRoll: (json['unlockRoll'] as num?)?.toInt() ?? 6,
      extraTurnOnSix: json['extraTurnOnSix'] as bool? ?? true,
      threeSixesRule: json['threeSixesRule'] as bool? ?? true,
      exactFinish: json['exactFinish'] as bool? ?? true,
      captureEnabled: json['captureEnabled'] as bool? ?? true,
      safeCells:
          (json['safeCells'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [1, 9, 14, 22, 27, 35, 40, 48],
      mainPathLength: (json['mainPathLength'] as num?)?.toInt() ?? 52,
      homeStretchLength: (json['homeStretchLength'] as num?)?.toInt() ?? 5,
      maxConsecutiveSixes: (json['maxConsecutiveSixes'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$ClassicRulesImplToJson(_$ClassicRulesImpl instance) =>
    <String, dynamic>{
      'unlockRoll': instance.unlockRoll,
      'extraTurnOnSix': instance.extraTurnOnSix,
      'threeSixesRule': instance.threeSixesRule,
      'exactFinish': instance.exactFinish,
      'captureEnabled': instance.captureEnabled,
      'safeCells': instance.safeCells,
      'mainPathLength': instance.mainPathLength,
      'homeStretchLength': instance.homeStretchLength,
      'maxConsecutiveSixes': instance.maxConsecutiveSixes,
    };

_$PowerRulesImpl _$$PowerRulesImplFromJson(Map<String, dynamic> json) =>
    _$PowerRulesImpl(
      enabled: json['enabled'] as bool? ?? true,
      momentumMax: (json['momentumMax'] as num?)?.toInt() ?? 10,
      earn: MomentumEarn.fromJson(json['earn'] as Map<String, dynamic>),
      spend: MomentumSpend.fromJson(json['spend'] as Map<String, dynamic>),
      features: PowerFeatures.fromJson(
        json['features'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$PowerRulesImplToJson(_$PowerRulesImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'momentumMax': instance.momentumMax,
      'earn': instance.earn.toJson(),
      'spend': instance.spend.toJson(),
      'features': instance.features.toJson(),
    };

_$MomentumEarnImpl _$$MomentumEarnImplFromJson(Map<String, dynamic> json) =>
    _$MomentumEarnImpl(
      capture: (json['capture'] as num?)?.toInt() ?? 2,
      reachHome: (json['reachHome'] as num?)?.toInt() ?? 3,
      completeLap: (json['completeLap'] as num?)?.toInt() ?? 2,
      safeStar: (json['safeStar'] as num?)?.toInt() ?? 1,
      destroyShield: (json['destroyShield'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$MomentumEarnImplToJson(_$MomentumEarnImpl instance) =>
    <String, dynamic>{
      'capture': instance.capture,
      'reachHome': instance.reachHome,
      'completeLap': instance.completeLap,
      'safeStar': instance.safeStar,
      'destroyShield': instance.destroyShield,
    };

_$MomentumSpendImpl _$$MomentumSpendImplFromJson(Map<String, dynamic> json) =>
    _$MomentumSpendImpl(
      reverseMove: (json['reverseMove'] as num?)?.toInt() ?? 2,
      shield: (json['shield'] as num?)?.toInt() ?? 3,
      goldenDice: (json['goldenDice'] as num?)?.toInt() ?? 4,
      breakBlockade: (json['breakBlockade'] as num?)?.toInt() ?? 3,
      doubleMove: (json['doubleMove'] as num?)?.toInt() ?? 3,
      safeLanding: (json['safeLanding'] as num?)?.toInt() ?? 2,
      momentumBoost: (json['momentumBoost'] as num?)?.toInt() ?? 2,
      reRoll: (json['reRoll'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$$MomentumSpendImplToJson(_$MomentumSpendImpl instance) =>
    <String, dynamic>{
      'reverseMove': instance.reverseMove,
      'shield': instance.shield,
      'goldenDice': instance.goldenDice,
      'breakBlockade': instance.breakBlockade,
      'doubleMove': instance.doubleMove,
      'safeLanding': instance.safeLanding,
      'momentumBoost': instance.momentumBoost,
      'reRoll': instance.reRoll,
    };

_$PowerFeaturesImpl _$$PowerFeaturesImplFromJson(Map<String, dynamic> json) =>
    _$PowerFeaturesImpl(
      shield: json['shield'] as bool? ?? true,
      portal: json['portal'] as bool? ?? true,
      goldenDice: json['goldenDice'] as bool? ?? true,
      comboBonus: json['comboBonus'] as bool? ?? true,
      momentum: json['momentum'] as bool? ?? true,
      reverseMovement: json['reverseMovement'] as bool? ?? true,
      breakBlockade: json['breakBlockade'] as bool? ?? true,
      safeLanding: json['safeLanding'] as bool? ?? true,
      doubleMove: json['doubleMove'] as bool? ?? true,
      momentumBoost: json['momentumBoost'] as bool? ?? true,
    );

Map<String, dynamic> _$$PowerFeaturesImplToJson(_$PowerFeaturesImpl instance) =>
    <String, dynamic>{
      'shield': instance.shield,
      'portal': instance.portal,
      'goldenDice': instance.goldenDice,
      'comboBonus': instance.comboBonus,
      'momentum': instance.momentum,
      'reverseMovement': instance.reverseMovement,
      'breakBlockade': instance.breakBlockade,
      'safeLanding': instance.safeLanding,
      'doubleMove': instance.doubleMove,
      'momentumBoost': instance.momentumBoost,
    };
