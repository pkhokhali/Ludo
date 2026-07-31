import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Wood + blue-pip die matching the Ludo Game Assets reference.
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      width: size,
      height: size,
      transform: rolling
          ? (Matrix4.identity()
            ..rotateZ(0.32)
            ..rotateX(0.35))
          : Matrix4.identity(),
      transformAlignment: Alignment.center,
      child: CustomPaint(
        size: Size.square(size),
        painter: WoodenDicePainter(
          value: value.clamp(1, 6),
          rolling: rolling,
        ),
      ),
    );
  }
}

/// Shared wood-grain die painter (floor die + HUD badge).
class WoodenDicePainter extends CustomPainter {
  WoodenDicePainter({
    required this.value,
    this.rolling = false,
    this.showShadow = true,
  });

  final int value;
  final bool rolling;
  final bool showShadow;

  static const _woodLight = Color(0xFFE8C9A0);
  static const _woodMid = Color(0xFFD4A574);
  static const _woodDark = Color(0xFFB8895A);
  static const _woodDeep = Color(0xFF8B6438);
  static const _pipBlue = Color(0xFF2F6BFF);
  static const _pipBlueDeep = Color(0xFF1A4FD6);

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final radius = s * 0.28;
    final rect = Rect.fromLTWH(0, 0, s, s);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    if (showShadow) {
      canvas.drawRRect(
        rrect.shift(Offset(s * 0.06, s * 0.1)),
        Paint()
          ..color = Colors.black.withValues(alpha: 0.35)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.08),
      );
    }

    if (rolling) {
      canvas.drawRRect(
        rrect.inflate(s * 0.04),
        Paint()
          ..color = ArenaColors.gold.withValues(alpha: 0.35)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, s * 0.12),
      );
    }

    // Soft wood body
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_woodLight, _woodMid, _woodDark],
          stops: [0.0, 0.45, 1.0],
        ).createShader(rect),
    );

    _paintGrain(canvas, rrect, s);

    // Edge rim / polish
    canvas.drawRRect(
      rrect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.03
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.55),
            _woodDeep.withValues(alpha: 0.35),
            Colors.black.withValues(alpha: 0.2),
          ],
        ).createShader(rect),
    );

    // Top-left gloss
    final gloss = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(s * 0.08, s * 0.08, s * 0.55, s * 0.38),
          topLeft: Radius.circular(radius * 0.85),
          topRight: Radius.circular(radius * 0.4),
          bottomLeft: Radius.circular(radius * 0.4),
          bottomRight: Radius.circular(s),
        ),
      );
    canvas.drawPath(
      gloss,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.28),
            Colors.white.withValues(alpha: 0.0),
          ],
        ).createShader(rect),
    );

    _paintPips(canvas, Size(s, s));
  }

  void _paintGrain(Canvas canvas, RRect clip, double s) {
    canvas.save();
    canvas.clipRRect(clip);

    final rng = math.Random(7);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < 14; i++) {
      final y = s * (0.08 + i * 0.065);
      final wobble = (rng.nextDouble() - 0.5) * s * 0.04;
      paint
        ..strokeWidth = s * (0.008 + rng.nextDouble() * 0.012)
        ..color = _woodDeep.withValues(alpha: 0.07 + rng.nextDouble() * 0.08);
      final path = Path()
        ..moveTo(-s * 0.05, y + wobble)
        ..cubicTo(
          s * 0.25,
          y - s * 0.02 + wobble,
          s * 0.55,
          y + s * 0.025 - wobble,
          s * 1.05,
          y + wobble * 0.5,
        );
      canvas.drawPath(path, paint);
    }

    // Soft radial warmth
    canvas.drawRect(
      Rect.fromLTWH(0, 0, s, s),
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.35, -0.4),
          radius: 1.1,
          colors: [
            Colors.white.withValues(alpha: 0.14),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, s, s)),
    );

    canvas.restore();
  }

  void _paintPips(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final cx = s / 2;
    final cy = s / 2;
    final r = s * 0.095;
    final inset = s * 0.27;

    final pips = switch (value) {
      1 => [Offset(cx, cy)],
      2 => [
          Offset(inset, inset),
          Offset(s - inset, s - inset),
        ],
      3 => [
          Offset(inset, inset),
          Offset(cx, cy),
          Offset(s - inset, s - inset),
        ],
      4 => [
          Offset(inset, inset),
          Offset(s - inset, inset),
          Offset(inset, s - inset),
          Offset(s - inset, s - inset),
        ],
      5 => [
          Offset(inset, inset),
          Offset(s - inset, inset),
          Offset(cx, cy),
          Offset(inset, s - inset),
          Offset(s - inset, s - inset),
        ],
      _ => [
          Offset(inset, inset),
          Offset(s - inset, inset),
          Offset(inset, cy),
          Offset(s - inset, cy),
          Offset(inset, s - inset),
          Offset(s - inset, s - inset),
        ],
    };

    for (final p in pips) {
      _drawPip(canvas, p, r);
    }
  }

  void _drawPip(Canvas canvas, Offset c, double r) {
    // Recessed well
    canvas.drawCircle(
      c.translate(0, r * 0.12),
      r * 1.05,
      Paint()..color = Colors.black.withValues(alpha: 0.18),
    );

    canvas.drawCircle(
      c,
      r,
      Paint()
        ..shader = ui.Gradient.radial(
          c.translate(-r * 0.25, -r * 0.3),
          r * 1.3,
          [
            const Color(0xFF5B8CFF),
            _pipBlue,
            _pipBlueDeep,
          ],
          const [0.0, 0.45, 1.0],
        ),
    );

    // Inner rim
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = r * 0.18
        ..color = Colors.black.withValues(alpha: 0.18),
    );

    // Specular
    canvas.drawCircle(
      c.translate(-r * 0.28, -r * 0.32),
      r * 0.28,
      Paint()..color = Colors.white.withValues(alpha: 0.55),
    );
  }

  @override
  bool shouldRepaint(covariant WoodenDicePainter oldDelegate) =>
      oldDelegate.value != value ||
      oldDelegate.rolling != rolling ||
      oldDelegate.showShadow != showShadow;
}

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
