import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';

/// Draws the premium Ludo board (frame, homes, path, stars, center).
class BoardPainter extends CustomPainter {
  BoardPainter({
    required this.safeCells,
    this.highlightedCells = const {},
  });

  final Set<int> safeCells;
  final Set<int> highlightedCells;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final origin = Offset((size.width - s) / 2, (size.height - s) / 2);
    canvas
      ..save()
      ..translate(origin.dx, origin.dy);

    _drawFrame(canvas, s);
    _drawHomes(canvas, s);
    _drawPath(canvas, s);
    _drawCenter(canvas, s);

    canvas.restore();
  }

  void _drawFrame(Canvas canvas, double s) {
    final outer = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, s, s),
      const Radius.circular(18),
    );
    canvas.drawRRect(
      outer,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [ArenaColors.goldLight, ArenaColors.goldDark],
        ).createShader(Rect.fromLTWH(0, 0, s, s)),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.018, s * 0.018, s * 0.964, s * 0.964),
        const Radius.circular(14),
      ),
      Paint()..color = const Color(0xFF1A1208),
    );
  }

  void _drawHomes(Canvas canvas, double s) {
    final cell = s / BoardLayout.grid;
    final homes = {
      PlayerSeat.red: Rect.fromLTWH(cell, cell * 9, cell * 5, cell * 5),
      PlayerSeat.blue: Rect.fromLTWH(cell, cell, cell * 5, cell * 5),
      PlayerSeat.yellow: Rect.fromLTWH(cell * 9, cell, cell * 5, cell * 5),
      PlayerSeat.green: Rect.fromLTWH(cell * 9, cell * 9, cell * 5, cell * 5),
    };
    for (final e in homes.entries) {
      final color = BoardLayout.seatColor(e.key);
      final rr = RRect.fromRectAndRadius(e.value, const Radius.circular(10));
      canvas.drawRRect(
        rr,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(color, Colors.black, 0.25)!,
              color,
              Color.lerp(color, Colors.white, 0.12)!,
            ],
          ).createShader(e.value),
      );
      canvas.drawRRect(
        rr,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.white24,
      );
      for (var i = 0; i < 4; i++) {
        final c = BoardLayout.toPixel(BoardLayout.yardPedestal(e.key, i), s);
        canvas
          ..drawCircle(c, cell * 0.38, Paint()..color = Colors.black38)
          ..drawCircle(
            c,
            cell * 0.32,
            Paint()..color = Colors.white.withValues(alpha: 0.14),
          );
      }
    }
  }

  void _drawPath(Canvas canvas, double s) {
    final cell = s / BoardLayout.grid;
    for (var i = 0; i < 52; i++) {
      final center = BoardLayout.toPixel(BoardLayout.pathCell(i), s);
      final rect = Rect.fromCenter(
        center: center,
        width: cell * 0.92,
        height: cell * 0.92,
      );
      final rr = RRect.fromRectAndRadius(rect, const Radius.circular(4));
      canvas
        ..drawRRect(
          rr.shift(const Offset(1.2, 1.5)),
          Paint()..color = ArenaColors.pathTileShadow,
        )
        ..drawRRect(rr, Paint()..color = ArenaColors.pathTile);

      if (safeCells.contains(i)) {
        _drawStar(canvas, center, cell * 0.28);
      }
      if (highlightedCells.contains(i)) {
        canvas.drawRRect(
          rr,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.5
            ..color = ArenaColors.gold,
        );
      }
    }

    for (final seat in PlayerSeat.values) {
      final color = BoardLayout.seatColor(seat);
      for (var step = 0; step < 5; step++) {
        final center = BoardLayout.toPixel(BoardLayout.homeStretch(seat, step), s);
        final rect = Rect.fromCenter(
          center: center,
          width: cell * 0.92,
          height: cell * 0.92,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(4)),
          Paint()..color = color.withValues(alpha: 0.88),
        );
      }
    }
  }

  void _drawCenter(Canvas canvas, double s) {
    final cell = s / BoardLayout.grid;
    final c = Offset(s / 2, s / 2);
    final tris = <(PlayerSeat, List<Offset>)>[
      (
        PlayerSeat.red,
        [
          c,
          Offset(c.dx - cell * 1.5, c.dy + cell * 1.5),
          Offset(c.dx + cell * 1.5, c.dy + cell * 1.5),
        ],
      ),
      (
        PlayerSeat.blue,
        [
          c,
          Offset(c.dx - cell * 1.5, c.dy - cell * 1.5),
          Offset(c.dx - cell * 1.5, c.dy + cell * 1.5),
        ],
      ),
      (
        PlayerSeat.yellow,
        [
          c,
          Offset(c.dx - cell * 1.5, c.dy - cell * 1.5),
          Offset(c.dx + cell * 1.5, c.dy - cell * 1.5),
        ],
      ),
      (
        PlayerSeat.green,
        [
          c,
          Offset(c.dx + cell * 1.5, c.dy - cell * 1.5),
          Offset(c.dx + cell * 1.5, c.dy + cell * 1.5),
        ],
      ),
    ];
    for (final t in tris) {
      final path = Path()
        ..moveTo(t.$2[0].dx, t.$2[0].dy)
        ..lineTo(t.$2[1].dx, t.$2[1].dy)
        ..lineTo(t.$2[2].dx, t.$2[2].dy)
        ..close();
      canvas.drawPath(path, Paint()..color = BoardLayout.seatColor(t.$1));
    }
  }

  void _drawStar(Canvas canvas, Offset c, double r) {
    final path = Path();
    for (var i = 0; i < 5; i++) {
      final a = -math.pi / 2 + i * 2 * math.pi / 5;
      final b = a + math.pi / 5;
      final p1 = Offset(c.dx + r * 1.05 * math.cos(a), c.dy + r * 1.05 * math.sin(a));
      final p2 = Offset(c.dx + r * 0.42 * math.cos(b), c.dy + r * 0.42 * math.sin(b));
      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }
      path.lineTo(p2.dx, p2.dy);
    }
    path.close();
    canvas
      ..drawCircle(c, r * 0.95, Paint()..color = const Color(0xFF9E9E9E))
      ..drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant BoardPainter oldDelegate) =>
      oldDelegate.safeCells != safeCells ||
      oldDelegate.highlightedCells != highlightedCells;
}
