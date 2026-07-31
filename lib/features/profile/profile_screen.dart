import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileRepositoryProvider).load();
    final xpNeed = profile.level * 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ArenaBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: ArenaColors.gold.withValues(alpha: 0.25),
                  child: const Icon(Icons.person, size: 48, color: ArenaColors.gold),
                ),
                const SizedBox(height: 12),
                Text(
                  profile.displayName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text('Level ${profile.level}'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (profile.xp / xpNeed).clamp(0.0, 1.0),
                  color: ArenaColors.gold,
                  backgroundColor: ArenaColors.surface,
                ),
                const SizedBox(height: 4),
                Text('${profile.xp} / $xpNeed XP'),
                const Divider(height: 28),
                _StatRow(label: 'Coins', value: '${profile.coins}'),
                _StatRow(label: 'Diamonds', value: '${profile.diamonds}'),
                _StatRow(
                  label: 'Theme',
                  value: profile.favoriteThemeId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
