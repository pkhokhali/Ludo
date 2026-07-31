import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'board_cell.freezed.dart';
part 'board_cell.g.dart';

@freezed
class BoardCell with _$BoardCell {
  const factory BoardCell({
    required int id,
    required CellKind kind,
    PlayerSeat? ownerSeat,
    @Default(false) bool isPortal,
    int? portalTargetId,
  }) = _BoardCell;

  factory BoardCell.fromJson(Map<String, dynamic> json) =>
      _$BoardCellFromJson(json);
}
