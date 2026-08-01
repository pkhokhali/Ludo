import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ludo_arena/core/constants/arena_assets.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Cream die with glossy red pips — design-pack faces.
class FloorDiceWidget extends StatelessWidget {
  const FloorDiceWidget({
    super.key,
    required this.value,
    required this.rolling,
    this.size = 52,
  });

  final int value;
  final bool rolling;
  final double size;

  @override
  Widget build(BuildContext context) {
    final face = value.clamp(1, 6);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: size,
      height: size,
      transform: rolling
          ? (Matrix4.identity()
            ..rotateZ(0.28)
            ..rotateX(0.3))
          : Matrix4.identity(),
      transformAlignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (rolling)
            Container(
              width: size * 1.15,
              height: size * 1.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ArenaColors.gold.withValues(alpha: 0.45),
                    blurRadius: size * 0.35,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          Image.asset(
            ArenaAssets.diceFace(face),
            width: size,
            height: size,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            errorBuilder: (_, _, _) => CustomPaint(
              size: Size.square(size),
              painter: CreamDicePainter(value: face, rolling: rolling),
            ),
          ),
        ],
      ),
    );
  }
}

/// Fallback cream + red-pip painter if assets fail to load.
class CreamDicePainter extends CustomPainter {
  CreamDicePainter({
    required this.value,
    this.rolling = false,
    this.showShadow = true,
  });

  final int value;
  final bool rolling;
  final bool showShadow;

  static const _face = Color(0xFFF7F1E6);
  static const _faceDeep = Color(0xFFE8DFD0);
  static const _rim = Color(0xFF2E221D);
  static const _side = Color(0xFFC4A574);
  static const _pip = Color(0xFFC1272D);

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final radius = s * 0.22;
    final face = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.04, s * 0.04, s * 0.88, s * 0.84),
      Radius.circular(radius),
    );
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.04, s * 0.08, s * 0.88, s * 0.86),
      Radius.circular(radius),
    );

    if (showShadow) {
      canvas.drawRRect(
        body.shift(Offset(s * 0.04, s * 0.06)),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.28)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.06),
      );
    }

    canvas.drawRRect(body, Paint()..color = _side);
    canvas.drawRRect(
      face,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, _face, _faceDeep],
        ).createShader(face.outerRect),
    );
    canvas.drawRRect(
      face,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.035
        ..color = _rim,
    );

    final cx = s / 2;
    final cy = s * 0.46;
    final r = s * 0.09;
    final inset = s * 0.28;
    final pips = switch (value) {
      1 => [Offset(cx, cy)],
      2 => [Offset(inset, inset * 0.95), Offset(s - inset, s * 0.62)],
      3 => [
          Offset(inset, inset * 0.95),
          Offset(cx, cy),
          Offset(s - inset, s * 0.62),
        ],
      4 => [
          Offset(inset, inset * 0.95),
          Offset(s - inset, inset * 0.95),
          Offset(inset, s * 0.62),
          Offset(s - inset, s * 0.62),
        ],
      5 => [
          Offset(inset, inset * 0.95),
          Offset(s - inset, inset * 0.95),
          Offset(cx, cy),
          Offset(inset, s * 0.62),
          Offset(s - inset, s * 0.62),
        ],
      _ => [
          Offset(inset, inset * 0.9),
          Offset(s - inset, inset * 0.9),
          Offset(inset, cy),
          Offset(s - inset, cy),
          Offset(inset, s * 0.64),
          Offset(s - inset, s * 0.64),
        ],
    };

    for (final p in pips) {
      canvas.drawCircle(p, r, Paint()..color = _pip);
      canvas.drawCircle(
        p.translate(-r * 0.28, -r * 0.3),
        r * 0.28,
        Paint()..color = Colors.white.withValues(alpha: 0.85),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CreamDicePainter oldDelegate) =>
      oldDelegate.value != value || oldDelegate.rolling != rolling;
}

/// Alias kept for HUD badge compatibility.
typedef WoodenDicePainter = CreamDicePainter;

/// Keyframed floor roll: arc + tumble + settle.
class DiceRollController extends ChangeNotifier {
  DiceRollController();

  double progress = 0;
  Offset position = Offset.zero;
  int face = 1;
  bool rolling = false;

  Future<void> play({
    required Offset from,
    required Offset to,
    required int finalFace,
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 1100),
  }) async {
    rolling = true;
    face = 1 + math.Random().nextInt(6);
    notifyListeners();

    final controller = AnimationController(vsync: vsync, duration: duration);
    final curve =
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);

    void tick() {
      progress = curve.value;
      final bounce =
          math.sin(progress * math.pi * 3).abs() * (1 - progress) * 28;
      position = Offset.lerp(from, to, progress)! - Offset(0, bounce);
      if (progress < 0.85) {
        face = 1 + ((progress * 18).floor() % 6);
      } else {
        face = finalFace;
      }
      notifyListeners();
    }

    curve.addListener(tick);
    await controller.forward();
    curve.removeListener(tick);
    controller.dispose();

    face = finalFace;
    position = to;
    rolling = false;
    progress = 1;
    notifyListeners();
  }
}
