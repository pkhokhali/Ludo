import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Gold-gradient emblem with a four-seat color ring for brand moments.
class ArenaBrandMark extends StatelessWidget {
  const ArenaBrandMark({
    super.key,
    this.size = 110,
    this.showGlow = true,
  });

  final double size;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    final ring = size * 0.12;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showGlow)
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ArenaColors.gold.withValues(alpha: 0.45),
                    blurRadius: size * 0.28,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          CustomPaint(
            size: Size(size, size),
            painter: _SeatRingPainter(strokeWidth: ring * 0.55),
          ),
          Container(
            width: size * 0.62,
            height: size * 0.62,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ArenaColors.goldLight, ArenaColors.goldDark],
              ),
            ),
            child: Icon(
              Icons.casino_rounded,
              size: size * 0.32,
              color: ArenaColors.backgroundDeep,
            ),
          ),
        ],
      ),
    );
  }
}

class _SeatRingPainter extends CustomPainter {
  _SeatRingPainter({required this.strokeWidth});

  final double strokeWidth;

  static const _seats = [
    PlayerColors.red,
    PlayerColors.blue,
    PlayerColors.green,
    PlayerColors.yellow,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const sweep = 1.55;
    const gap = (3.1415926535 * 2 - sweep * 4) / 4;
    var start = -1.55;

    for (final color in _seats) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(rect, start, sweep, false, paint);
      start += sweep + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _SeatRingPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth;
}
