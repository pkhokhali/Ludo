// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
  id: json['id'] as String,
  seat: $enumDecode(_$PlayerSeatEnumMap, json['seat']),
  index: (json['index'] as num).toInt(),
  status:
      $enumDecodeNullable(_$TokenStatusEnumMap, json['status']) ??
      TokenStatus.yard,
  position: (json['position'] as num?)?.toInt() ?? -1,
  pathProgress: (json['pathProgress'] as num?)?.toInt() ?? 0,
  homeProgress: (json['homeProgress'] as num?)?.toInt() ?? 0,
  hasShield: json['hasShield'] as bool? ?? false,
);

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seat': _$PlayerSeatEnumMap[instance.seat]!,
      'index': instance.index,
      'status': _$TokenStatusEnumMap[instance.status]!,
      'position': instance.position,
      'pathProgress': instance.pathProgress,
      'homeProgress': instance.homeProgress,
      'hasShield': instance.hasShield,
    };

const _$PlayerSeatEnumMap = {
  PlayerSeat.red: 'red',
  PlayerSeat.blue: 'blue',
  PlayerSeat.green: 'green',
  PlayerSeat.yellow: 'yellow',
};

const _$TokenStatusEnumMap = {
  TokenStatus.yard: 'yard',
  TokenStatus.onBoard: 'onBoard',
  TokenStatus.homeStretch: 'homeStretch',
  TokenStatus.finished: 'finished',
};
