import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';

/// 15×15 Ludo grid helpers. Path indices match [BoardGeometry] (0,13,26,39 starts).
abstract final class BoardLayout {
  static const int grid = 15;

  static Color seatColor(PlayerSeat seat) => PlayerColors.seats[seat.index];
  static Color seatGlow(PlayerSeat seat) => PlayerColors.seatGlows[seat.index];

  static Offset pathCell(int id) => _mainPath[id % 52];

  static Offset homeStretch(PlayerSeat seat, int step) {
    final list = _homeStretch[seat]!;
    return list[step.clamp(0, list.length - 1)];
  }

  static Offset finish(PlayerSeat seat) => const Offset(7, 7);

  static Offset yardPedestal(PlayerSeat seat, int tokenIndex) {
    final o = _yard[seat]!;
    const d = [
      Offset(0, 0),
      Offset(1.35, 0),
      Offset(0, 1.35),
      Offset(1.35, 1.35),
    ];
    return o + d[tokenIndex % 4];
  }

  static Offset toPixel(Offset cell, double size) {
    final cellSize = size / grid;
    return Offset((cell.dx + 0.5) * cellSize, (cell.dy + 0.5) * cellSize);
  }

  /// 52 cells. Starts: red=0, blue=13, green=26, yellow=39 (engine order).
  /// Visual seats: red bottom-left, blue top-left, green bottom-right, yellow top-right.
  /// Engine maps green→26 and yellow→39; we place green then yellow on the ring.
  static final List<Offset> _mainPath = _buildPath();

  static List<Offset> _buildPath() {
    final p = <Offset>[];

    // 0–12: red start → approach blue (13 cells)
    p.addAll([for (var y = 13; y >= 9; y--) Offset(6, y.toDouble())]); // 0-4
    p.addAll([for (var x = 5; x >= 0; x--) Offset(x.toDouble(), 8)]); // 5-10
    p.addAll([const Offset(0, 7), const Offset(0, 6)]); // 11-12

    // 13–25: blue start → approach green (13 cells)
    p.add(const Offset(0, 5)); // 13 blue start
    p.addAll([for (var x = 1; x <= 5; x++) Offset(x.toDouble(), 6)]); // 14-18
    p.addAll([for (var y = 5; y >= 0; y--) Offset(6, y.toDouble())]); // 19-24
    p.add(const Offset(7, 0)); // 25

    // 26–38: green start in engine = cell 26 — place at top-right entry visually
    // Using yellow's visual corner for engine-green to keep seat colors on tokens.
    // Actually keep seat colors separate from path; position by absolute id only.
    p.add(const Offset(8, 0)); // 26 — engine green start
    p.addAll([for (var y = 1; y <= 5; y++) Offset(8, y.toDouble())]); // 27-31
    p.addAll([for (var x = 9; x <= 14; x++) Offset(x.toDouble(), 6)]); // 32-37
    p.add(const Offset(14, 7)); // 38

    // 39–51: yellow start
    p.add(const Offset(14, 8)); // 39 yellow start (engine)
    p.add(const Offset(14, 9));
    p.addAll([for (var x = 13; x >= 9; x--) Offset(x.toDouble(), 8)]); // 5 cells
    p.addAll([for (var y = 9; y <= 13; y++) Offset(8, y.toDouble())]); // 5
    p.add(const Offset(7, 14));

    assert(p.length == 52, 'Path length ${p.length}');
    return p;
  }

  static final Map<PlayerSeat, List<Offset>> _homeStretch = {
    PlayerSeat.red: [for (var y = 12; y >= 8; y--) Offset(7, y.toDouble())],
    PlayerSeat.blue: [for (var x = 1; x <= 5; x++) Offset(x.toDouble(), 7)],
    PlayerSeat.yellow: [for (var y = 1; y <= 5; y++) Offset(7, y.toDouble())],
    PlayerSeat.green: [for (var x = 13; x >= 9; x--) Offset(x.toDouble(), 7)],
  };

  static final Map<PlayerSeat, Offset> _yard = {
    PlayerSeat.red: const Offset(1.9, 10.9),
    PlayerSeat.blue: const Offset(1.9, 1.9),
    PlayerSeat.yellow: const Offset(10.9, 1.9),
    PlayerSeat.green: const Offset(10.9, 10.9),
  };
}
