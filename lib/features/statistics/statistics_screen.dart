import 'package:flutter/material.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = const [
      ('Games Played', '0'),
      ('Wins', '0'),
      ('Losses', '0'),
      ('Win Rate', '—'),
      ('Captures', '0'),
      ('Longest Winning Streak', '0'),
      ('Momentum Usage', '0'),
      ('Favorite Theme', 'Classic'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassCard(
            child: Column(
              children: rows
                  .map(
                    (r) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r.$1),
                          Text(r.$2, style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
