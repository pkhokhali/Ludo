import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Rule Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassCard(
            child: Column(
              children: _toggles.entries.map((e) {
                return SwitchListTile(
                  title: Text(e.key),
                  value: e.value,
                  onChanged: (v) => setState(() => _toggles[e.key] = v),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
