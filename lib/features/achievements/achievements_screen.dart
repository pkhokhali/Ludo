import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(achievementsRepositoryProvider).all();
    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'Achievements',
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 24),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final a = items[i];
          return GlassCard(
            borderColor: a.unlocked ? ArenaColors.gold : null,
            glowColor: a.unlocked ? ArenaColors.gold : null,
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: (a.unlocked ? ArenaColors.gold : ArenaColors.surface)
                      .withValues(alpha: 0.25),
                ),
                child: Icon(
                  a.unlocked
                      ? Icons.emoji_events_rounded
                      : Icons.lock_outline_rounded,
                  color: a.unlocked
                      ? ArenaColors.goldLight
                      : ArenaColors.textSecondary,
                ),
              ),
              title: Text(a.title),
              subtitle: Text(a.description),
              trailing: a.unlocked
                  ? Text(
                      'Unlocked',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ArenaColors.gold,
                          ),
                    )
                  : null,
            ),
          )
              .animate()
              .fadeIn(delay: (50 * i).ms, duration: 320.ms)
              .slideY(begin: 0.05, end: 0);
        },
      ),
    );
  }
}
