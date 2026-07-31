// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      id: json['id'] as String,
      config: GameConfig.fromJson(json['config'] as Map<String, dynamic>),
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPlayerIndex: (json['currentPlayerIndex'] as num?)?.toInt() ?? 0,
      lastDiceValue: (json['lastDiceValue'] as num?)?.toInt(),
      consecutiveSixes: (json['consecutiveSixes'] as num?)?.toInt() ?? 0,
      awaitingMove: json['awaitingMove'] as bool? ?? false,
      extraTurnPending: json['extraTurnPending'] as bool? ?? false,
      isFinished: json['isFinished'] as bool? ?? false,
      winnerPlayerId: json['winnerPlayerId'] as String?,
      finishOrder:
          (json['finishOrder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phase:
          $enumDecodeNullable(_$GamePhaseEnumMap, json['phase']) ??
          GamePhase.rolling,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'config': instance.config.toJson(),
      'players': instance.players.map((e) => e.toJson()).toList(),
      'tokens': instance.tokens.map((e) => e.toJson()).toList(),
      'currentPlayerIndex': instance.currentPlayerIndex,
      'lastDiceValue': instance.lastDiceValue,
      'consecutiveSixes': instance.consecutiveSixes,
      'awaitingMove': instance.awaitingMove,
      'extraTurnPending': instance.extraTurnPending,
      'isFinished': instance.isFinished,
      'winnerPlayerId': instance.winnerPlayerId,
      'finishOrder': instance.finishOrder,
      'phase': _$GamePhaseEnumMap[instance.phase]!,
      'startedAt': instance.startedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$GamePhaseEnumMap = {
  GamePhase.rolling: 'rolling',
  GamePhase.selectingToken: 'selectingToken',
  GamePhase.animating: 'animating',
  GamePhase.usingPower: 'usingPower',
  GamePhase.finished: 'finished',
};
