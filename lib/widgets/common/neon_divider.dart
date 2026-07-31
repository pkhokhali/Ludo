import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Thin gold/neon divider for menu sections.
class NeonDivider extends StatelessWidget {
  const NeonDivider({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? ArenaColors.gold;
    return Container(
      height: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            c.withValues(alpha: 0),
            c.withValues(alpha: 0.85),
            c.withValues(alpha: 0),
          ],
        ),
        boxShadow: [
          BoxShadow(color: c.withValues(alpha: 0.35), blurRadius: 6),
        ],
      ),
    );
  }
}
