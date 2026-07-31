import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

/// Power/classic rule toggles shell — wired to RuleConfig in Module 3.
class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  final Map<String, bool> _toggles = {
    'Shield': true,
    'Portal': true,
    'Golden Dice': true,
    'Combo Bonus': true,
    'Momentum': true,
    'Reverse Movement': false,
    'Break Blockade': true,
    'Safe Landing': true,
    'Double Move': false,
    'Momentum Boost': true,
  };

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'Rule Settings',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 24),
        children: [
          GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              children: _toggles.entries.map((e) {
                return SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(e.key),
                  value: e.value,
                  activeThumbColor: ArenaColors.gold,
                  onChanged: (v) => setState(() => _toggles[e.key] = v),
                );
              }).toList(),
            ),
          ).animate().fadeIn(duration: 360.ms).slideY(begin: 0.04, end: 0),
        ],
      ),
    );
  }
}
