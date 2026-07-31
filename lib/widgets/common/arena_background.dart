import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Full-bleed navy gradient with subtle diamond grid (reference backdrop).
class ArenaBackground extends StatelessWidget {
  const ArenaBackground({super.key, required this.child, this.cyber = false});

  final Widget child;
  final bool cyber;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: cyber
              ? const [Color(0xFF050814), Color(0xFF0A1628), Color(0xFF001A33)]
              : const [
                  ArenaColors.backgroundDeep,
                  ArenaColors.background,
                  Color(0xFF152238),
                ],
        ),
      ),
      child: CustomPaint(
        painter: _DiamondGridPainter(
          color: (cyber ? const Color(0xFF00E5FF) : ArenaColors.gold)
              .withValues(alpha: 0.04),
        ),
        child: child,
      ),
    );
  }
}

class _DiamondGridPainter extends CustomPainter {
  _DiamondGridPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const step = 28.0;
    for (var y = -step; y < size.height + step; y += step) {
      for (var x = -step; x < size.width + step; x += step) {
        final path = Path()
          ..moveTo(x, y + step / 2)
          ..lineTo(x + step / 2, y)
          ..lineTo(x + step, y + step / 2)
          ..lineTo(x + step / 2, y + step)
          ..close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DiamondGridPainter oldDelegate) =>
      oldDelegate.color != color;
}
