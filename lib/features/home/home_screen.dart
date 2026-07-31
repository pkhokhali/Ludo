import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/player_profile.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/neon_divider.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Main hub — Play, Profile, Stats, Settings + banner ads + resume.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadBanner());
  }

  Future<void> _loadBanner() async {
    final ad = await ref.read(adsServiceProvider).loadHomeBanner();
    if (mounted) setState(() => _banner = ad);
  }

  @override
  void dispose() {
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;
    var hasResume = false;
    try {
      hasResume = ref.watch(gameSnapshotRepositoryProvider).hasSnapshot;
    } catch (_) {}
    var profile = const PlayerProfile();
    try {
      profile = ref.watch(profileRepositoryProvider).load();
    } catch (_) {}

    return Scaffold(
      body: ArenaBackground(
        cyber: cyber,
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
                            'Lv ${profile.level} · ${profile.coins} coins',
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
                        AppConstants.tagline,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 18),
                      PremiumButton(
                        label: 'Play Now',
                        icon: Icons.play_arrow_rounded,
                        onPressed: () => context.push(AppRoutes.mode),
                      ),
                      if (hasResume) ...[
                        const SizedBox(height: 10),
                        OutlinedButton.icon(
                          onPressed: () async {
                            final ok = await ref
                                .read(gameControllerProvider.notifier)
                                .resume();
                            if (ok && context.mounted) {
                              context.go(AppRoutes.gamePath('resume'));
                            }
                          },
                          icon: const Icon(Icons.replay),
                          label: const Text('Resume Last Game'),
                        ),
                      ],
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.08, end: 0),
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
                        icon: Icons.emoji_events_outlined,
                        label: 'Achievements',
                        onTap: () => context.push(AppRoutes.achievements),
                      ),
                      _HomeTile(
                        icon: Icons.help_outline,
                        label: 'Help',
                        onTap: () => context.push(AppRoutes.help),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 54,
                  child: _banner != null
                      ? AdWidget(ad: _banner!)
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ArenaColors.surface.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ArenaColors.border),
                          ),
                          child: Text(
                            'Loading ads…',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
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
    ).animate().fadeIn(duration: 350.ms);
  }
}
