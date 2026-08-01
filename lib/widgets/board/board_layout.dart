import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';

/// 15×15 Ludo grid helpers. Path indices match [BoardGeometry].
///
/// Engine seats (counter-clockwise from red):
/// - red start 0 → bottom-left
/// - blue start 13 → top-left
/// - green start 26 → top-right
/// - yellow start 39 → bottom-right
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

  /// Yard rect origin cell (top-left of 5×5 home base).
  static Offset yardOrigin(PlayerSeat seat) => switch (seat) {
        PlayerSeat.red => const Offset(1, 9),
        PlayerSeat.blue => const Offset(1, 1),
        PlayerSeat.green => const Offset(9, 1),
        PlayerSeat.yellow => const Offset(9, 9),
      };

  static final List<Offset> _mainPath = _buildPath();

  static List<Offset> _buildPath() {
    final p = <Offset>[
      // 0–12 red → approach blue
      for (var y = 13; y >= 9; y--) Offset(6, y.toDouble()),
      for (var x = 5; x >= 0; x--) Offset(x.toDouble(), 8),
      const Offset(0, 7),
      const Offset(0, 6),

      // 13–25 blue → approach green
      const Offset(0, 5),
      for (var x = 1; x <= 5; x++) Offset(x.toDouble(), 6),
      for (var y = 5; y >= 0; y--) Offset(6, y.toDouble()),
      const Offset(7, 0),

      // 26–38 green (top-right) → approach yellow
      const Offset(8, 0),
      for (var y = 1; y <= 5; y++) Offset(8, y.toDouble()),
      for (var x = 9; x <= 14; x++) Offset(x.toDouble(), 6),
      const Offset(14, 7),

      // 39–51 yellow (bottom-right) → approach red
      const Offset(14, 8),
      for (var y = 9; y <= 13; y++) Offset(14, y.toDouble()),
      for (var x = 13; x >= 9; x--) Offset(x.toDouble(), 14),
      const Offset(8, 14),
      const Offset(7, 14),
    ];

    assert(p.length == 52, 'Path length ${p.length}');
    return p;
  }

  static final Map<PlayerSeat, List<Offset>> _homeStretch = {
    // Toward center along the colored column/row.
    PlayerSeat.red: [for (var y = 13; y >= 9; y--) Offset(7, y.toDouble())],
    PlayerSeat.blue: [for (var x = 1; x <= 5; x++) Offset(x.toDouble(), 7)],
    PlayerSeat.green: [for (var y = 1; y <= 5; y++) Offset(7, y.toDouble())],
    PlayerSeat.yellow: [
      for (var x = 13; x >= 9; x--) Offset(x.toDouble(), 7),
    ],
  };

  static final Map<PlayerSeat, Offset> _yard = {
    PlayerSeat.red: const Offset(1.9, 10.9),
    PlayerSeat.blue: const Offset(1.9, 1.9),
    PlayerSeat.green: const Offset(10.9, 1.9),
    PlayerSeat.yellow: const Offset(10.9, 10.9),
  };
}
