import 'package:flutter/material.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassCard(
            child: Text(
              'Classic: Roll a 6 to unlock a token. Extra turn on 6. '
              'Three consecutive 6s end your turn. Capture opponents on '
              'non-safe cells. Exact count required to finish.\n\n'
              'Power Mode: Spend Momentum on Shield, Portal, Golden Dice, '
              'Reverse, Break Blockade, Double Move, Safe Landing, and more.\n\n'
              'Dice rolls on the board floor — tap the board when it is your turn.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
