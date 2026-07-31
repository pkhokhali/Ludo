// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiceRolledEventImpl _$$DiceRolledEventImplFromJson(
  Map<String, dynamic> json,
) => _$DiceRolledEventImpl(
  playerId: json['playerId'] as String,
  value: (json['value'] as num).toInt(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$DiceRolledEventImplToJson(
  _$DiceRolledEventImpl instance,
) => <String, dynamic>{
  'playerId': instance.playerId,
  'value': instance.value,
  'type': instance.$type,
};

_$TokenMovedEventImpl _$$TokenMovedEventImplFromJson(
  Map<String, dynamic> json,
) => _$TokenMovedEventImpl(
  tokenId: json['tokenId'] as String,
  from: (json['from'] as num).toInt(),
  to: (json['to'] as num).toInt(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$TokenMovedEventImplToJson(
  _$TokenMovedEventImpl instance,
) => <String, dynamic>{
  'tokenId': instance.tokenId,
  'from': instance.from,
  'to': instance.to,
  'type': instance.$type,
};

_$TokenUnlockedEventImpl _$$TokenUnlockedEventImplFromJson(
  Map<String, dynamic> json,
) => _$TokenUnlockedEventImpl(
  tokenId: json['tokenId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$TokenUnlockedEventImplToJson(
  _$TokenUnlockedEventImpl instance,
) => <String, dynamic>{'tokenId': instance.tokenId, 'type': instance.$type};

_$CapturedEventImpl _$$CapturedEventImplFromJson(Map<String, dynamic> json) =>
    _$CapturedEventImpl(
      attackerTokenId: json['attackerTokenId'] as String,
      victimTokenId: json['victimTokenId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$CapturedEventImplToJson(_$CapturedEventImpl instance) =>
    <String, dynamic>{
      'attackerTokenId': instance.attackerTokenId,
      'victimTokenId': instance.victimTokenId,
      'type': instance.$type,
    };

_$SixRolledEventImpl _$$SixRolledEventImplFromJson(Map<String, dynamic> json) =>
    _$SixRolledEventImpl(
      playerId: json['playerId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SixRolledEventImplToJson(
  _$SixRolledEventImpl instance,
) => <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};

_$ThreeSixesPenaltyEventImpl _$$ThreeSixesPenaltyEventImplFromJson(
  Map<String, dynamic> json,
) => _$ThreeSixesPenaltyEventImpl(
  playerId: json['playerId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$ThreeSixesPenaltyEventImplToJson(
  _$ThreeSixesPenaltyEventImpl instance,
) => <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};

_$MomentumChangedEventImpl _$$MomentumChangedEventImplFromJson(
  Map<String, dynamic> json,
) => _$MomentumChangedEventImpl(
  playerId: json['playerId'] as String,
  delta: (json['delta'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$MomentumChangedEventImplToJson(
  _$MomentumChangedEventImpl instance,
) => <String, dynamic>{
  'playerId': instance.playerId,
  'delta': instance.delta,
  'total': instance.total,
  'type': instance.$type,
};

_$PowerUsedEventImpl _$$PowerUsedEventImplFromJson(Map<String, dynamic> json) =>
    _$PowerUsedEventImpl(
      playerId: json['playerId'] as String,
      power: $enumDecode(_$PowerTypeEnumMap, json['power']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PowerUsedEventImplToJson(
  _$PowerUsedEventImpl instance,
) => <String, dynamic>{
  'playerId': instance.playerId,
  'power': _$PowerTypeEnumMap[instance.power]!,
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

_$PlayerWonEventImpl _$$PlayerWonEventImplFromJson(Map<String, dynamic> json) =>
    _$PlayerWonEventImpl(
      playerId: json['playerId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PlayerWonEventImplToJson(
  _$PlayerWonEventImpl instance,
) => <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};

_$TurnChangedEventImpl _$$TurnChangedEventImplFromJson(
  Map<String, dynamic> json,
) => _$TurnChangedEventImpl(
  playerId: json['playerId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$$TurnChangedEventImplToJson(
  _$TurnChangedEventImpl instance,
) => <String, dynamic>{'playerId': instance.playerId, 'type': instance.$type};
