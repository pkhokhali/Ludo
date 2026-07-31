// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardCellImpl _$$BoardCellImplFromJson(Map<String, dynamic> json) =>
    _$BoardCellImpl(
      id: (json['id'] as num).toInt(),
      kind: $enumDecode(_$CellKindEnumMap, json['kind']),
      ownerSeat: $enumDecodeNullable(_$PlayerSeatEnumMap, json['ownerSeat']),
      isPortal: json['isPortal'] as bool? ?? false,
      portalTargetId: (json['portalTargetId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BoardCellImplToJson(_$BoardCellImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$CellKindEnumMap[instance.kind]!,
      'ownerSeat': _$PlayerSeatEnumMap[instance.ownerSeat],
      'isPortal': instance.isPortal,
      'portalTargetId': instance.portalTargetId,
    };

const _$CellKindEnumMap = {
  CellKind.path: 'path',
  CellKind.safe: 'safe',
  CellKind.start: 'start',
  CellKind.homeEntry: 'homeEntry',
  CellKind.homeStretch: 'homeStretch',
  CellKind.finish: 'finish',
  CellKind.portal: 'portal',
};

const _$PlayerSeatEnumMap = {
  PlayerSeat.red: 'red',
  PlayerSeat.blue: 'blue',
  PlayerSeat.green: 'green',
  PlayerSeat.yellow: 'yellow',
};
