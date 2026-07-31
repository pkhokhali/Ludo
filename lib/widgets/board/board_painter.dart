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

  static const _startCells = {
    PlayerSeat.red: 0,
    PlayerSeat.blue: 13,
    PlayerSeat.green: 26,
    PlayerSeat.yellow: 39,
  };

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final origin = Offset((size.width - s) / 2, (size.height - s) / 2);
    canvas
      ..save()
      ..translate(origin.dx, origin.dy);

    _drawOuterGlow(canvas, s);
    _drawFrame(canvas, s);
    _drawHomes(canvas, s);
    _drawPath(canvas, s);
    _drawCenter(canvas, s);
    _drawStartArrows(canvas, s);

    canvas.restore();
  }

  void _drawOuterGlow(Canvas canvas, double s) {
    final outer = RRect.fromRectAndRadius(
      Rect.fromLTWH(-4, -4, s + 8, s + 8),
      const Radius.circular(22),
    );
    canvas.drawRRect(
      outer,
      Paint()
        ..color = ArenaColors.gold.withValues(alpha: 0.22)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16),
    );
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
          colors: [
            ArenaColors.goldLight,
            ArenaColors.gold,
            ArenaColors.goldDark,
            ArenaColors.gold,
          ],
          stops: [0.0, 0.35, 0.7, 1.0],
        ).createShader(Rect.fromLTWH(0, 0, s, s)),
    );

    // Inner felt bed
    final inner = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.016, s * 0.016, s * 0.968, s * 0.968),
      const Radius.circular(14),
    );
    canvas.drawRRect(
      inner,
      Paint()
        ..shader = const RadialGradient(
          center: Alignment.center,
          radius: 1.05,
          colors: [
            Color(0xFF2A1C0E),
            Color(0xFF1A1208),
            Color(0xFF0F0A05),
          ],
        ).createShader(Rect.fromLTWH(0, 0, s, s)),
    );

    // Thin gold trim
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.028, s * 0.028, s * 0.944, s * 0.944),
        const Radius.circular(12),
      ),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..color = ArenaColors.gold.withValues(alpha: 0.45),
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
      final highlight = BoardLayout.seatGlow(e.key);
      final rect = e.value;
      final rr = RRect.fromRectAndRadius(rect, const Radius.circular(12));

      canvas.drawRRect(
        rr,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(color, Colors.white, 0.12)!,
              color,
              Color.lerp(color, Colors.black, 0.28)!,
            ],
          ).createShader(rect),
      );

      // Inner pad
      final inset = rect.deflate(cell * 0.45);
      final pad = RRect.fromRectAndRadius(inset, const Radius.circular(10));
      canvas
        ..drawRRect(
          pad,
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.92),
                Color.lerp(Colors.white, color, 0.12)!,
              ],
            ).createShader(inset),
        )
        ..drawRRect(
          pad,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = color.withValues(alpha: 0.55),
        );

      // Pedestal cups
      for (var i = 0; i < 4; i++) {
        final c = BoardLayout.toPixel(BoardLayout.yardPedestal(e.key, i), s);
        canvas
          ..drawCircle(
            c.translate(1, 1.5),
            cell * 0.36,
            Paint()..color = Colors.black26,
          )
          ..drawCircle(
            c,
            cell * 0.36,
            Paint()
              ..shader = RadialGradient(
                colors: [
                  color.withValues(alpha: 0.35),
                  color.withValues(alpha: 0.75),
                ],
              ).createShader(Rect.fromCircle(center: c, radius: cell * 0.36)),
          )
          ..drawCircle(
            c,
            cell * 0.22,
            Paint()..color = Colors.white.withValues(alpha: 0.55),
          )
          ..drawCircle(
            c,
            cell * 0.36,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5
              ..color = highlight.withValues(alpha: 0.65),
          );
      }
    }
  }

  void _drawPath(Canvas canvas, double s) {
    final cell = s / BoardLayout.grid;
    final startByCell = {
      for (final e in _startCells.entries) e.value: e.key,
    };

    for (var i = 0; i < 52; i++) {
      final center = BoardLayout.toPixel(BoardLayout.pathCell(i), s);
      final rect = Rect.fromCenter(
        center: center,
        width: cell * 0.92,
        height: cell * 0.92,
      );
      final rr = RRect.fromRectAndRadius(rect, const Radius.circular(5));
      final startSeat = startByCell[i];

      canvas.drawRRect(
        rr.shift(const Offset(1.1, 1.4)),
        Paint()..color = ArenaColors.pathTileShadow,
      );

      if (startSeat != null) {
        final c = BoardLayout.seatColor(startSeat);
        canvas.drawRRect(
          rr,
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(c, Colors.white, 0.25)!,
                c,
                Color.lerp(c, Colors.black, 0.15)!,
              ],
            ).createShader(rect),
        );
      } else {
        canvas.drawRRect(
          rr,
          Paint()
            ..shader = const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFFBF3),
                ArenaColors.pathTile,
                ArenaColors.pathTileShadow,
              ],
            ).createShader(rect),
        );
      }

      canvas.drawRRect(
        rr,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8
          ..color = Colors.black12,
      );

      if (safeCells.contains(i)) {
        _drawStar(canvas, center, cell * 0.26);
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
        final center =
            BoardLayout.toPixel(BoardLayout.homeStretch(seat, step), s);
        final rect = Rect.fromCenter(
          center: center,
          width: cell * 0.92,
          height: cell * 0.92,
        );
        final rr = RRect.fromRectAndRadius(rect, const Radius.circular(5));
        canvas
          ..drawRRect(
            rr.shift(const Offset(1, 1.2)),
            Paint()..color = Colors.black26,
          )
          ..drawRRect(
            rr,
            Paint()
              ..shader = LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(color, Colors.white, 0.2)!,
                  color.withValues(alpha: 0.92),
                  Color.lerp(color, Colors.black, 0.2)!,
                ],
              ).createShader(rect),
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
      final color = BoardLayout.seatColor(t.$1);
      final path = Path()
        ..moveTo(t.$2[0].dx, t.$2[0].dy)
        ..lineTo(t.$2[1].dx, t.$2[1].dy)
        ..lineTo(t.$2[2].dx, t.$2[2].dy)
        ..close();
      canvas
        ..drawPath(
          path,
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.lerp(color, Colors.white, 0.18)!,
                color,
                Color.lerp(color, Colors.black, 0.22)!,
              ],
            ).createShader(Rect.fromCircle(center: c, radius: cell * 2)),
        )
        ..drawPath(
          path,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = Colors.white24,
        );
    }

    // Finish medal
    canvas
      ..drawCircle(
        c,
        cell * 0.72,
        Paint()
          ..shader = const RadialGradient(
            colors: [
              ArenaColors.goldLight,
              ArenaColors.gold,
              ArenaColors.goldDark,
            ],
          ).createShader(Rect.fromCircle(center: c, radius: cell * 0.72)),
      )
      ..drawCircle(
        c,
        cell * 0.48,
        Paint()..color = const Color(0xFF1A1208),
      );
    _drawStar(canvas, c, cell * 0.28, filled: true);
  }

  void _drawStartArrows(Canvas canvas, double s) {
    final cell = s / BoardLayout.grid;
    final arrows = <(PlayerSeat, Offset, double)>[
      (PlayerSeat.red, const Offset(6, 13), -math.pi / 2),
      (PlayerSeat.blue, const Offset(1, 6), 0),
      (PlayerSeat.green, const Offset(8, 1), math.pi / 2),
      (PlayerSeat.yellow, const Offset(13, 8), math.pi),
    ];

    for (final a in arrows) {
      final color = BoardLayout.seatColor(a.$1);
      final center = BoardLayout.toPixel(a.$2, s);
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(a.$3);
      final path = Path()
        ..moveTo(-cell * 0.18, -cell * 0.12)
        ..lineTo(cell * 0.22, 0)
        ..lineTo(-cell * 0.18, cell * 0.12)
        ..close();
      canvas
        ..drawPath(path, Paint()..color = Colors.white.withValues(alpha: 0.9))
        ..drawPath(
          path,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = color,
        );
      canvas.restore();
    }
  }

  void _drawStar(
    Canvas canvas,
    Offset c,
    double r, {
    bool filled = false,
  }) {
    final path = Path();
    for (var i = 0; i < 5; i++) {
      final a = -math.pi / 2 + i * 2 * math.pi / 5;
      final b = a + math.pi / 5;
      final p1 = Offset(
        c.dx + r * 1.05 * math.cos(a),
        c.dy + r * 1.05 * math.sin(a),
      );
      final p2 = Offset(
        c.dx + r * 0.42 * math.cos(b),
        c.dy + r * 0.42 * math.sin(b),
      );
      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }
      path.lineTo(p2.dx, p2.dy);
    }
    path.close();

    if (filled) {
      canvas.drawPath(
        path,
        Paint()
          ..shader = const LinearGradient(
            colors: [Colors.white, ArenaColors.goldLight],
          ).createShader(Rect.fromCircle(center: c, radius: r)),
      );
      return;
    }

    canvas
      ..drawCircle(c, r * 0.95, Paint()..color = const Color(0xFF8A8A8A))
      ..drawPath(path, Paint()..color = Colors.white)
      ..drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8
          ..color = Colors.black26,
      );
  }

  @override
  bool shouldRepaint(covariant BoardPainter oldDelegate) =>
      oldDelegate.safeCells != safeCells ||
      oldDelegate.highlightedCells != highlightedCells;
}
