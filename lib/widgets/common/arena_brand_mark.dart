import 'package:flutter/material.dart';
import 'package:ludo_arena/core/constants/arena_assets.dart';

/// Arena logo mark from the design pack (hex badge + die).
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
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showGlow)
            Container(
              width: size * 0.92,
              height: size * 0.92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00E5FF).withValues(alpha: 0.35),
                    blurRadius: size * 0.28,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          Image.asset(
            ArenaAssets.logo,
            width: size,
            height: size,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
