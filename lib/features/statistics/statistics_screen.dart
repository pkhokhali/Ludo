import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
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
      (Icons.sports_esports_rounded, 'Games Played', '${s.gamesPlayed}'),
      (Icons.emoji_events_rounded, 'Wins', '${s.wins}'),
      (Icons.close_rounded, 'Losses', '${s.losses}'),
      (Icons.percent_rounded, 'Win Rate', rate),
      (Icons.gps_fixed_rounded, 'Captures', '${s.captures}'),
      (Icons.local_fire_department_rounded, 'Longest Streak',
          '${s.longestWinningStreak}'),
      (Icons.bolt_rounded, 'Momentum Usage', '${s.momentumUsage}'),
      (Icons.palette_outlined, 'Favorite Theme', s.favoriteThemeId),
    ];

    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'Statistics',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 24),
        children: [
          GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              children: [
                for (var i = 0; i < rows.length; i++) ...[
                  if (i > 0)
                    Divider(
                      height: 1,
                      color: ArenaColors.border.withValues(alpha: 0.6),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Icon(rows[i].$1, size: 20, color: ArenaColors.goldLight),
                        const SizedBox(width: 12),
                        Expanded(child: Text(rows[i].$2)),
                        Text(
                          rows[i].$3,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05, end: 0),
        ],
      ),
    );
  }
}
