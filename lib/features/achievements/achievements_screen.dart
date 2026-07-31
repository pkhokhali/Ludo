import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(achievementsRepositoryProvider).all();

    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: ArenaBackground(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, i) {
            final a = items[i];
            return GlassCard(
              borderColor: a.unlocked ? ArenaColors.gold : null,
              child: ListTile(
                leading: Icon(
                  a.unlocked ? Icons.emoji_events : Icons.lock_outline,
                  color: a.unlocked ? ArenaColors.gold : ArenaColors.textSecondary,
                ),
                title: Text(a.title),
                subtitle: Text(a.description),
                trailing: a.unlocked
                    ? const Text('Unlocked', style: TextStyle(color: ArenaColors.gold))
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
