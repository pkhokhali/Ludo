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
import 'package:ludo_arena/widgets/common/arena_brand_mark.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Main hub — brand hero, Play CTA, compact destinations + banner ads.
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
          minimum: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    _StatusChip(
                      icon: Icons.military_tech_rounded,
                      label: 'Lv ${profile.level}',
                    ),
                    const SizedBox(width: 8),
                    _StatusChip(
                      icon: Icons.monetization_on_rounded,
                      label: '${profile.coins}',
                      iconColor: ArenaColors.coin,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => context.push(AppRoutes.settings),
                      icon: const Icon(
                        Icons.settings_rounded,
                        color: ArenaColors.gold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final compact = constraints.maxHeight < 520;
                      final markSize = compact ? 72.0 : 96.0;
                      final titleSize = compact ? 28.0 : 34.0;
                      final tileAspect = compact ? 1.8 : 1.55;

                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: compact ? 8 : 16),
                              ArenaBrandMark(size: markSize)
                                  .animate()
                                  .fadeIn(duration: 450.ms)
                                  .scale(begin: const Offset(0.85, 0.85)),
                              SizedBox(height: compact ? 12 : 18),
                              Text(
                                AppConstants.appName.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      color: ArenaColors.goldLight,
                                      fontSize: titleSize,
                                      letterSpacing: 2.2,
                                    ),
                              ).animate().fadeIn(
                                    delay: 120.ms,
                                    duration: 450.ms,
                                  ),
                              const SizedBox(height: 8),
                              Text(
                                AppConstants.tagline,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ).animate().fadeIn(
                                    delay: 200.ms,
                                    duration: 450.ms,
                                  ),
                              SizedBox(height: compact ? 18 : 28),
                              PremiumButton(
                                label: 'Play Now',
                                icon: Icons.play_arrow_rounded,
                                onPressed: () => context.push(AppRoutes.mode),
                              )
                                  .animate()
                                  .fadeIn(delay: 280.ms, duration: 400.ms)
                                  .slideY(begin: 0.12, end: 0),
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
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: ArenaColors.goldLight,
                                    side: BorderSide(
                                      color: ArenaColors.gold
                                          .withValues(alpha: 0.55),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 12,
                                    ),
                                  ),
                                  icon: const Icon(Icons.replay_rounded),
                                  label: const Text('Resume Last Game'),
                                ),
                              ],
                              SizedBox(height: compact ? 16 : 24),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: tileAspect,
                                children: [
                                  _HomeTile(
                                    icon: Icons.person_rounded,
                                    label: 'Profile',
                                    delayMs: 0,
                                    onTap: () =>
                                        context.push(AppRoutes.profile),
                                  ),
                                  _HomeTile(
                                    icon: Icons.bar_chart_rounded,
                                    label: 'Statistics',
                                    delayMs: 60,
                                    onTap: () =>
                                        context.push(AppRoutes.statistics),
                                  ),
                                  _HomeTile(
                                    icon: Icons.emoji_events_outlined,
                                    label: 'Achievements',
                                    delayMs: 120,
                                    onTap: () =>
                                        context.push(AppRoutes.achievements),
                                  ),
                                  _HomeTile(
                                    icon: Icons.help_outline_rounded,
                                    label: 'Help',
                                    delayMs: 180,
                                    onTap: () => context.push(AppRoutes.help),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: _banner != null
                      ? AdWidget(ad: _banner!)
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.icon,
    required this.label,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: ArenaColors.surfaceGlass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ArenaColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor ?? ArenaColors.goldLight),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 12,
                  color: ArenaColors.textPrimary,
                ),
          ),
        ],
      ),
    );
  }
}

class _HomeTile extends StatelessWidget {
  const _HomeTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.delayMs = 0,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final int delayMs;

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
            Icon(icon, color: ArenaColors.goldLight, size: 28),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: delayMs.ms, duration: 350.ms)
        .slideY(begin: 0.08, end: 0);
  }
}
