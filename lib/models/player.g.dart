// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
  id: json['id'] as String,
  seat: $enumDecode(_$PlayerSeatEnumMap, json['seat']),
  name: json['name'] as String,
  type: $enumDecode(_$PlayerTypeEnumMap, json['type']),
  aiDifficulty: $enumDecodeNullable(
    _$AiDifficultyEnumMap,
    json['aiDifficulty'],
  ),
  momentum: (json['momentum'] as num?)?.toInt() ?? 0,
  coinsEarned: (json['coinsEarned'] as num?)?.toInt() ?? 0,
  captures: (json['captures'] as num?)?.toInt() ?? 0,
  tokensFinished: (json['tokensFinished'] as num?)?.toInt() ?? 0,
  isReady: json['isReady'] as bool? ?? false,
  hasWon: json['hasWon'] as bool? ?? false,
);

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seat': _$PlayerSeatEnumMap[instance.seat]!,
      'name': instance.name,
      'type': _$PlayerTypeEnumMap[instance.type]!,
      'aiDifficulty': _$AiDifficultyEnumMap[instance.aiDifficulty],
      'momentum': instance.momentum,
      'coinsEarned': instance.coinsEarned,
      'captures': instance.captures,
      'tokensFinished': instance.tokensFinished,
      'isReady': instance.isReady,
      'hasWon': instance.hasWon,
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
