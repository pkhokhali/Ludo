// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameConfigImpl _$$GameConfigImplFromJson(Map<String, dynamic> json) =>
    _$GameConfigImpl(
      mode: $enumDecode(_$GameModeEnumMap, json['mode']),
      playerCount: (json['playerCount'] as num?)?.toInt() ?? 4,
      slots:
          (json['slots'] as List<dynamic>?)
              ?.map((e) => PlayerSlotConfig.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ruleOverrides: json['ruleOverrides'] == null
          ? null
          : RuleConfig.fromJson(json['ruleOverrides'] as Map<String, dynamic>),
      turnTimerEnabled: json['turnTimerEnabled'] as bool? ?? false,
      turnTimerSeconds: (json['turnTimerSeconds'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$GameConfigImplToJson(_$GameConfigImpl instance) =>
    <String, dynamic>{
      'mode': _$GameModeEnumMap[instance.mode]!,
      'playerCount': instance.playerCount,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
      'ruleOverrides': instance.ruleOverrides?.toJson(),
      'turnTimerEnabled': instance.turnTimerEnabled,
      'turnTimerSeconds': instance.turnTimerSeconds,
    };

const _$GameModeEnumMap = {
  GameMode.classic: 'classic',
  GameMode.power: 'power',
  GameMode.quick: 'quick',
  GameMode.ai: 'ai',
  GameMode.passPlay: 'passPlay',
};

_$PlayerSlotConfigImpl _$$PlayerSlotConfigImplFromJson(
  Map<String, dynamic> json,
) => _$PlayerSlotConfigImpl(
  seat: $enumDecode(_$PlayerSeatEnumMap, json['seat']),
  type: $enumDecode(_$PlayerTypeEnumMap, json['type']),
  name: json['name'] as String? ?? 'Player',
  aiDifficulty: $enumDecodeNullable(
    _$AiDifficultyEnumMap,
    json['aiDifficulty'],
  ),
);

Map<String, dynamic> _$$PlayerSlotConfigImplToJson(
  _$PlayerSlotConfigImpl instance,
) => <String, dynamic>{
  'seat': _$PlayerSeatEnumMap[instance.seat]!,
  'type': _$PlayerTypeEnumMap[instance.type]!,
  'name': instance.name,
  'aiDifficulty': _$AiDifficultyEnumMap[instance.aiDifficulty],
};

const _$PlayerSeatEnumMap = {
  PlayerSeat.red: 'red',
  PlayerSeat.blue: 'blue',
  PlayerSeat.green: 'green',
  PlayerSeat.yellow: 'yellow',
};

const _$PlayerTypeEnumMap = {PlayerType.human: 'human', PlayerType.ai: 'ai'};

const _$AiDifficultyEnumMap = {
  AiDifficulty.easy: 'easy',
  AiDifficulty.medium: 'medium',
  AiDifficulty.hard: 'hard',
  AiDifficulty.expert: 'expert',
};
