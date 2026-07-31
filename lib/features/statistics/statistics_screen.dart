import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(statisticsRepositoryProvider).load();
    final rate = s.gamesPlayed == 0
        ? '—'
        : '${(s.winRate * 100).toStringAsFixed(0)}%';

    final rows = [
      ('Games Played', '${s.gamesPlayed}'),
      ('Wins', '${s.wins}'),
      ('Losses', '${s.losses}'),
      ('Win Rate', rate),
      ('Captures', '${s.captures}'),
      ('Longest Winning Streak', '${s.longestWinningStreak}'),
      ('Momentum Usage', '${s.momentumUsage}'),
      ('Favorite Theme', s.favoriteThemeId),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ArenaBackground(
        child: ListView(
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
                            Text(
                              r.$2,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
