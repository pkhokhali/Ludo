import 'package:ludo_arena/models/board_cell.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/rule_config.dart';

/// Builds the absolute cell layout from [ClassicRules]. Pure Dart.
class BoardGeometry {
  BoardGeometry(this.rules);

  final ClassicRules rules;

  int get mainPathLength => rules.mainPathLength;
  int get homeStretchLength => rules.homeStretchLength;

  /// Global start cell for each seat on the shared ring.
  static const Map<PlayerSeat, int> startCells = {
    PlayerSeat.red: 0,
    PlayerSeat.blue: 13,
    PlayerSeat.green: 26,
    PlayerSeat.yellow: 39,
  };

  /// Home-entry cell (last main-path cell before stretch) per seat.
  Map<PlayerSeat, int> get homeEntryCells => {
        for (final seat in PlayerSeat.values)
          seat: (startCells[seat]! + mainPathLength - 1) % mainPathLength,
      };

  bool isSafeCell(int absoluteCellId) =>
      rules.safeCells.contains(absoluteCellId) ||
      startCells.values.contains(absoluteCellId);

  /// Absolute main-path cell after [steps] from seat start.
  int absoluteFromProgress(PlayerSeat seat, int pathProgress) {
    final start = startCells[seat]!;
    return (start + pathProgress) % mainPathLength;
  }

  List<BoardCell> buildCells() {
    final cells = <BoardCell>[];

    for (var i = 0; i < mainPathLength; i++) {
      final isStart = startCells.containsValue(i);
      final owner = startCells.entries
          .where((e) => e.value == i)
          .map((e) => e.key)
          .firstOrNull;
      cells.add(
        BoardCell(
          id: i,
          kind: isStart
              ? CellKind.start
              : (isSafeCell(i) ? CellKind.safe : CellKind.path),
          ownerSeat: owner,
        ),
      );
    }

    // Home stretch cells: ids 100+seatIndex*10 + step
    for (final seat in PlayerSeat.values) {
      for (var step = 0; step < homeStretchLength; step++) {
        cells.add(
          BoardCell(
            id: homeStretchId(seat, step),
            kind: CellKind.homeStretch,
            ownerSeat: seat,
          ),
        );
      }
      cells.add(
        BoardCell(
          id: finishId(seat),
          kind: CellKind.finish,
          ownerSeat: seat,
        ),
      );
    }

    return cells;
  }

  static int homeStretchId(PlayerSeat seat, int step) =>
      100 + seat.index * 10 + step;

  static int finishId(PlayerSeat seat) => 100 + seat.index * 10 + 9;
}
