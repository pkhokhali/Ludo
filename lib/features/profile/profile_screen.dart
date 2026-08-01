import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileRepositoryProvider).load();
    final xpNeed = profile.level * 100;
    return ArenaScaffold(
      title: 'Profile',
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        ArenaColors.gold.withValues(alpha: 0.35),
                        ArenaColors.goldDark.withValues(alpha: 0.2),
                      ],
                    ),
                    border: Border.all(color: ArenaColors.gold, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: ArenaColors.gold.withValues(alpha: 0.35),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    size: 46,
                    color: ArenaColors.goldLight,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  profile.displayName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ArenaColors.goldLight,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Level ${profile.level}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: (profile.xp / xpNeed).clamp(0.0, 1.0),
                    minHeight: 8,
                    color: ArenaColors.gold,
                    backgroundColor: ArenaColors.surface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${profile.xp} / $xpNeed XP',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Divider(height: 32),
                _StatRow(
                  icon: Icons.monetization_on_rounded,
                  iconColor: ArenaColors.coin,
                  label: 'Coins',
                  value: '${profile.coins}',
                ),
                _StatRow(
                  icon: Icons.diamond_rounded,
                  iconColor: ArenaColors.gem,
                  label: 'Diamonds',
                  value: '${profile.diamonds}',
                ),
                _StatRow(
                  icon: Icons.palette_outlined,
                  iconColor: ArenaColors.goldLight,
                  label: 'Theme',
                  value: profile.favoriteThemeId,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.06, end: 0),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(width: 10),
          Expanded(child: Text(label)),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
