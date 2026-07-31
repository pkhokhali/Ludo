// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RollDiceActionImpl _$$RollDiceActionImplFromJson(Map<String, dynamic> json) =>
    _$RollDiceActionImpl(
      playerId: json['playerId'] as String?,
      forcedValue: (json['forcedValue'] as num?)?.toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RollDiceActionImplToJson(
  _$RollDiceActionImpl instance,
) => <String, dynamic>{
  'playerId': instance.playerId,
  'forcedValue': instance.forcedValue,
  'type': instance.$type,
};

_$MoveTokenActionImpl _$$MoveTokenActionImplFromJson(
  Map<String, dynamic> json,
) => _$MoveTokenActionImpl(
  tokenId: json['tokenId'] as String,
  playerId: json['playerId'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$MoveTokenActionImplToJson(
  _$MoveTokenActionImpl instance,
) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'playerId': instance.playerId,
  'type': instance.$type,
};

_$UsePowerActionImpl _$$UsePowerActionImplFromJson(Map<String, dynamic> json) =>
    _$UsePowerActionImpl(
      power: $enumDecode(_$PowerTypeEnumMap, json['power']),
      playerId: json['playerId'] as String?,
      tokenId: json['tokenId'] as String?,
      targetCellId: (json['targetCellId'] as num?)?.toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$UsePowerActionImplToJson(
  _$UsePowerActionImpl instance,
) => <String, dynamic>{
  'power': _$PowerTypeEnumMap[instance.power]!,
  'playerId': instance.playerId,
  'tokenId': instance.tokenId,
  'targetCellId': instance.targetCellId,
  'type': instance.$type,
};

const _$PowerTypeEnumMap = {
  PowerType.shield: 'shield',
  PowerType.portal: 'portal',
  PowerType.goldenDice: 'goldenDice',
  PowerType.reverseMove: 'reverseMove',
  PowerType.breakBlockade: 'breakBlockade',
  PowerType.doubleMove: 'doubleMove',
  PowerType.safeLanding: 'safeLanding',
  PowerType.momentumBoost: 'momentumBoost',
  PowerType.reRoll: 'reRoll',
};

_$EndTurnActionImpl _$$EndTurnActionImplFromJson(Map<String, dynamic> json) =>
    _$EndTurnActionImpl(
      playerId: json['playerId'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$EndTurnActionImplToJson(_$EndTurnActionImpl instance) =>
    <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};

_$ForfeitActionImpl _$$ForfeitActionImplFromJson(Map<String, dynamic> json) =>
    _$ForfeitActionImpl(
      playerId: json['playerId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ForfeitActionImplToJson(_$ForfeitActionImpl instance) =>
    <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};
