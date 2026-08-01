import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ArenaScaffold(
      title: 'Help',
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to play',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ArenaColors.goldLight,
                      ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Classic: Roll a 6 to unlock a token. Extra turn on 6. '
                  'Three consecutive 6s end your turn. Capture opponents on '
                  'non-safe cells. Exact count required to finish.\n\n'
                  'Power Mode: Spend Momentum on Shield, Portal, Golden Dice, '
                  'Reverse, Break Blockade, Double Move, Safe Landing, and more.\n\n'
                  'Dice rolls on the board floor — tap the board when it is your turn.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05, end: 0),
        ],
      ),
    );
  }
}
