import 'package:flutter/material.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';

/// Glossy 3D peg token matching the reference (bulbous head, neck, flared base).
class TokenWidget extends StatelessWidget {
  const TokenWidget({
    super.key,
    required this.seat,
    required this.size,
    this.selected = false,
    this.onTap,
  });

  final PlayerSeat seat;
  final double size;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = BoardLayout.seatColor(seat);
    final glow = BoardLayout.seatGlow(seat);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size * 1.35,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Soft floor shadow
            Positioned(
              bottom: 0,
              child: Container(
                width: size * 0.72,
                height: size * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.45),
                      blurRadius: size * 0.12,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            if (selected)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: glow.withValues(alpha: 0.65),
                        blurRadius: size * 0.35,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            CustomPaint(
              size: Size(size, size * 1.25),
              painter: _PegPainter(color: color, highlight: glow),
            ),
          ],
        ),
      ),
    );
  }
}

class _PegPainter extends CustomPainter {
  _PegPainter({required this.color, required this.highlight});

  final Color color;
  final Color highlight;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Base flare
    final base = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h * 0.88),
        width: w * 0.85,
        height: h * 0.22,
      ),
      Radius.circular(w * 0.4),
    );
    canvas.drawRRect(
      base,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.lerp(color, Colors.white, 0.25)!,
            color,
            Color.lerp(color, Colors.black, 0.35)!,
          ],
        ).createShader(base.outerRect),
    );

    // Neck
    final neck = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w / 2, h * 0.55),
        width: w * 0.38,
        height: h * 0.42,
      ),
      Radius.circular(w * 0.2),
    );
    canvas.drawRRect(
      neck,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.lerp(color, Colors.black, 0.2)!,
            Color.lerp(color, Colors.white, 0.15)!,
            Color.lerp(color, Colors.black, 0.25)!,
          ],
        ).createShader(neck.outerRect),
    );

    // Head
    final head = Offset(w / 2, h * 0.28);
    canvas.drawCircle(
      head,
      w * 0.32,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.35, -0.4),
          radius: 0.9,
          colors: [
            Colors.white.withValues(alpha: 0.85),
            highlight,
            color,
            Color.lerp(color, Colors.black, 0.3)!,
          ],
          stops: const [0.0, 0.25, 0.65, 1.0],
        ).createShader(Rect.fromCircle(center: head, radius: w * 0.32)),
    );

    // Specular
    canvas.drawCircle(
      Offset(w * 0.38, h * 0.18),
      w * 0.08,
      Paint()..color = Colors.white.withValues(alpha: 0.75),
    );
  }

  @override
  bool shouldRepaint(covariant _PegPainter oldDelegate) =>
      oldDelegate.color != color;
}
