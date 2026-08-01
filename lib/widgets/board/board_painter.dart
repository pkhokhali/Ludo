import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';

/// Classic cream Ludo board (design-pack style) with engine-aligned seats.
class BoardPainter extends CustomPainter {
  BoardPainter({
    required this.safeCells,
    this.highlightedCells = const {},
  });

  final Set<int> safeCells;
  final Set<int> highlightedCells;

  static const _cream = Color(0xFFF7F1E6);
  static const _gridLine = Color(0xFFBCAAA0);
  static const _border = Color(0xFF4E342E);

  static const _startCells = {
    PlayerSeat.red: 0,
    PlayerSeat.blue: 13,
    PlayerSeat.green: 26,
    PlayerSeat.yellow: 39,
  };

  static Color _soft(Color c) => Color.lerp(c, _cream, 0.55)!;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final origin = Offset((size.width - s) / 2, (size.height - s) / 2);
    canvas
      ..save()
      ..translate(origin.dx, origin.dy);

    final cell = s / BoardLayout.grid;
    _drawBoardBase(canvas, s);
    _drawHomes(canvas, s, cell);
    _drawPathGrid(canvas, s, cell);
    _drawColoredPaths(canvas, s, cell);
    _drawStartAndSafe(canvas, s, cell);
    _drawCenter(canvas, s, cell);

    canvas.restore();
  }

  void _drawBoardBase(Canvas canvas, double s) {
    final outer = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, s, s),
      const Radius.circular(16),
    );
    canvas
      ..drawRRect(
        outer.shift(const Offset(2, 3)),
        Paint()..color = Colors.black26,
      )
      ..drawRRect(outer, Paint()..color = _cream)
      ..drawRRect(
        outer,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = _border,
      );
  }

  void _drawHomes(Canvas canvas, double s, double cell) {
    for (final seat in PlayerSeat.values) {
      final color = BoardLayout.seatColor(seat);
      final o = BoardLayout.yardOrigin(seat);
      final rect = Rect.fromLTWH(o.dx * cell, o.dy * cell, cell * 5, cell * 5);
      final outer = RRect.fromRectAndRadius(rect, const Radius.circular(14));
      final inner = RRect.fromRectAndRadius(
        rect.deflate(cell * 0.35),
        const Radius.circular(12),
      );

      canvas
        ..drawRRect(outer, Paint()..color = color)
        ..drawRRect(inner, Paint()..color = _cream)
        ..drawRRect(
          outer,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.5
            ..color = Color.lerp(color, Colors.black, 0.25)!,
        );

      for (var i = 0; i < 4; i++) {
        final c = BoardLayout.toPixel(BoardLayout.yardPedestal(seat, i), s);
        canvas
          ..drawCircle(c, cell * 0.34, Paint()..color = color)
          ..drawCircle(
            c,
            cell * 0.34,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.2
              ..color = Colors.black26,
          );
      }
    }
  }

  void _drawPathGrid(Canvas canvas, double s, double cell) {
    // Fill cross arms cream
    final hBand = Rect.fromLTWH(0, cell * 6, s, cell * 3);
    final vBand = Rect.fromLTWH(cell * 6, 0, cell * 3, s);
    canvas
      ..drawRect(hBand, Paint()..color = _cream)
      ..drawRect(vBand, Paint()..color = _cream);

    final line = Paint()
      ..color = _gridLine
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (var i = 0; i <= 15; i++) {
      final p = i * cell;
      // Horizontal lines in vertical strip
      if (i >= 0 && i <= 15) {
        canvas.drawLine(Offset(cell * 6, p), Offset(cell * 9, p), line);
        canvas.drawLine(Offset(p, cell * 6), Offset(p, cell * 9), line);
      }
    }
  }

  void _drawColoredPaths(Canvas canvas, double s, double cell) {
    // Home stretches (lighter seat color)
    for (final seat in PlayerSeat.values) {
      final soft = _soft(BoardLayout.seatColor(seat));
      for (var step = 0; step < 5; step++) {
        final center =
            BoardLayout.toPixel(BoardLayout.homeStretch(seat, step), s);
        final rect = Rect.fromCenter(
          center: center,
          width: cell * 0.98,
          height: cell * 0.98,
        );
        canvas.drawRect(rect, Paint()..color = soft);
        canvas.drawRect(
          rect,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 0.8
            ..color = _gridLine,
        );
      }
    }

    // Main path tiles
    for (var i = 0; i < 52; i++) {
      final center = BoardLayout.toPixel(BoardLayout.pathCell(i), s);
      final rect = Rect.fromCenter(
        center: center,
        width: cell * 0.98,
        height: cell * 0.98,
      );
      PlayerSeat? startSeat;
      for (final e in _startCells.entries) {
        if (e.value == i) {
          startSeat = e.key;
          break;
        }
      }

      canvas.drawRect(
        rect,
        Paint()
          ..color = startSeat != null
              ? BoardLayout.seatColor(startSeat)
              : _cream,
      );
      canvas.drawRect(
        rect,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8
          ..color = _gridLine,
      );

      if (highlightedCells.contains(i)) {
        canvas.drawRect(
          rect.deflate(1),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.5
            ..color = ArenaColors.gold,
        );
      }
    }
  }

  void _drawStartAndSafe(Canvas canvas, double s, double cell) {
    for (final e in _startCells.entries) {
      final center = BoardLayout.toPixel(BoardLayout.pathCell(e.value), s);
      _drawStar(
        canvas,
        center,
        cell * 0.28,
        fill: Colors.white,
        stroke: Colors.black87,
      );
    }

    for (final id in safeCells) {
      if (_startCells.containsValue(id)) continue;
      final center = BoardLayout.toPixel(BoardLayout.pathCell(id), s);
      _drawStar(
        canvas,
        center,
        cell * 0.26,
        fill: Colors.white,
        stroke: Colors.black54,
      );
    }
  }

  void _drawCenter(Canvas canvas, double s, double cell) {
    final c = Offset(s / 2, s / 2);
    final half = cell * 1.5;
    final tris = <(PlayerSeat, List<Offset>)>[
      (
        PlayerSeat.blue,
        [
          c,
          Offset(c.dx - half, c.dy - half),
          Offset(c.dx - half, c.dy + half),
        ],
      ),
      (
        PlayerSeat.green,
        [
          c,
          Offset(c.dx - half, c.dy - half),
          Offset(c.dx + half, c.dy - half),
        ],
      ),
      (
        PlayerSeat.yellow,
        [
          c,
          Offset(c.dx + half, c.dy - half),
          Offset(c.dx + half, c.dy + half),
        ],
      ),
      (
        PlayerSeat.red,
        [
          c,
          Offset(c.dx - half, c.dy + half),
          Offset(c.dx + half, c.dy + half),
        ],
      ),
    ];

    for (final t in tris) {
      final path = Path()
        ..moveTo(t.$2[0].dx, t.$2[0].dy)
        ..lineTo(t.$2[1].dx, t.$2[1].dy)
        ..lineTo(t.$2[2].dx, t.$2[2].dy)
        ..close();
      canvas
        ..drawPath(path, Paint()..color = BoardLayout.seatColor(t.$1))
        ..drawPath(
          path,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = Colors.black26,
        );
    }

    canvas.drawRect(
      Rect.fromCenter(center: c, width: cell * 3, height: cell * 3),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..color = _border,
    );
  }

  void _drawStar(
    Canvas canvas,
    Offset c,
    double r, {
    required Color fill,
    required Color stroke,
  }) {
    final path = Path();
    for (var i = 0; i < 5; i++) {
      final a = -math.pi / 2 + i * 2 * math.pi / 5;
      final b = a + math.pi / 5;
      final p1 = Offset(c.dx + r * math.cos(a), c.dy + r * math.sin(a));
      final p2 =
          Offset(c.dx + r * 0.4 * math.cos(b), c.dy + r * 0.4 * math.sin(b));
      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }
      path.lineTo(p2.dx, p2.dy);
    }
    path.close();
    canvas
      ..drawPath(path, Paint()..color = fill)
      ..drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = stroke,
      );
  }

  @override
  bool shouldRepaint(covariant BoardPainter oldDelegate) =>
      oldDelegate.safeCells != safeCells ||
      oldDelegate.highlightedCells != highlightedCells;
}
