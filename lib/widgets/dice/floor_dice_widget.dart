import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// 3D-looking die that lives on the board floor (not a fixed UI button).
class FloorDiceWidget extends StatelessWidget {
  const FloorDiceWidget({
    super.key,
    required this.value,
    required this.rolling,
    this.size = 48,
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
            ..rotateZ(0.35)
            ..rotateX(0.4))
          : Matrix4.identity(),
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFE8E8E8), Color(0xFFCFCFCF)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 10,
            offset: const Offset(3, 6),
          ),
          if (rolling)
            BoxShadow(
              color: ArenaColors.gold.withValues(alpha: 0.55),
              blurRadius: 16,
              spreadRadius: 1,
            ),
        ],
        border: Border.all(color: Colors.black12, width: 1.2),
      ),
      child: CustomPaint(
        painter: _DiceFacePainter(value: value.clamp(1, 6)),
      ),
    );
  }
}

class _DiceFacePainter extends CustomPainter {
  _DiceFacePainter({required this.value});
  final int value;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF212121);
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.shortestSide * 0.09;
    final inset = size.shortestSide * 0.28;

    List<Offset> pips;
    switch (value) {
      case 1:
        pips = [Offset(cx, cy)];
      case 2:
        pips = [
          Offset(inset, inset),
          Offset(size.width - inset, size.height - inset),
        ];
      case 3:
        pips = [
          Offset(inset, inset),
          Offset(cx, cy),
          Offset(size.width - inset, size.height - inset),
        ];
      case 4:
        pips = [
          Offset(inset, inset),
          Offset(size.width - inset, inset),
          Offset(inset, size.height - inset),
          Offset(size.width - inset, size.height - inset),
        ];
      case 5:
        pips = [
          Offset(inset, inset),
          Offset(size.width - inset, inset),
          Offset(cx, cy),
          Offset(inset, size.height - inset),
          Offset(size.width - inset, size.height - inset),
        ];
      default:
        pips = [
          Offset(inset, inset),
          Offset(size.width - inset, inset),
          Offset(inset, cy),
          Offset(size.width - inset, cy),
          Offset(inset, size.height - inset),
          Offset(size.width - inset, size.height - inset),
        ];
    }
    for (final p in pips) {
      canvas.drawCircle(p, r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DiceFacePainter oldDelegate) =>
      oldDelegate.value != value;
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
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);

    void tick() {
      progress = curve.value;
      final bounce = math.sin(progress * math.pi * 3).abs() * (1 - progress) * 28;
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
