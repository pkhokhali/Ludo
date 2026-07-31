import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/neon_divider.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Main hub — Play, Profile, Stats, Settings. Banner ad slot reserved.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ArenaColors.backgroundDeep,
              ArenaColors.background,
              Color(0xFF152238),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Icon(Icons.casino, color: ArenaColors.gold, size: 28),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstants.appName,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: ArenaColors.goldLight),
                          ),
                          Text(
                            AppConstants.tagline,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.push(AppRoutes.settings),
                      icon: const Icon(Icons.settings, color: ArenaColors.gold),
                    ),
                  ],
                ),
                const NeonDivider(),
                const SizedBox(height: 8),
                GlassCard(
                  glowColor: ArenaColors.gold,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to play?',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Offline Classic & Power modes. Pass & Play or challenge the AI.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 18),
                      PremiumButton(
                        label: 'Play Now',
                        icon: Icons.play_arrow_rounded,
                        onPressed: () => context.push(AppRoutes.mode),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.35,
                    children: [
                      _HomeTile(
                        icon: Icons.person,
                        label: 'Profile',
                        onTap: () => context.push(AppRoutes.profile),
                      ),
                      _HomeTile(
                        icon: Icons.bar_chart_rounded,
                        label: 'Statistics',
                        onTap: () => context.push(AppRoutes.statistics),
                      ),
                      _HomeTile(
                        icon: Icons.help_outline,
                        label: 'Help',
                        onTap: () => context.push(AppRoutes.help),
                      ),
                      _HomeTile(
                        icon: Icons.info_outline,
                        label: 'About',
                        onTap: () => context.push(AppRoutes.about),
                      ),
                    ],
                  ),
                ),
                // Banner ad placeholder (Module 11)
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ArenaColors.surface.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ArenaColors.border),
                  ),
                  child: Text(
                    'Ad banner slot',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeTile extends StatelessWidget {
  const _HomeTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ArenaColors.goldLight, size: 32),
            const SizedBox(height: 10),
            Text(label, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
