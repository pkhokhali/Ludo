import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_rule_widgets.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

/// Arena settings — Neo-Classic layout (toggles + quick links) in navy/gold.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesServiceProvider);
    final themeId = ref.watch(themeIdProvider);

    return ArenaScaffold(
      title: 'Settings',
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2E7D32).withValues(alpha: 0.4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Text(
                      'SETTINGS',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.4,
                          ),
                    ),
                  ),
                ).animate().fadeIn(duration: 300.ms),
                const SizedBox(height: 18),
                ArenaSettingToggleTile(
                  label: 'Sounds',
                  enabled: prefs.soundEnabled,
                  onChanged: (v) async {
                    await prefs.setSoundEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                    ref.read(audioServiceProvider).configure(
                          sound: v,
                          music: prefs.musicEnabled,
                        );
                  },
                ),
                ArenaSettingToggleTile(
                  label: 'Music',
                  enabled: prefs.musicEnabled,
                  onChanged: (v) async {
                    await prefs.setMusicEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                    ref.read(audioServiceProvider).configure(
                          sound: prefs.soundEnabled,
                          music: v,
                        );
                  },
                ),
                ArenaSettingToggleTile(
                  label: 'Vibration',
                  enabled: prefs.hapticsEnabled,
                  onChanged: (v) async {
                    await prefs.setHapticsEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                  },
                ),
                const SizedBox(height: 8),
                const ArenaSectionBanner('Look'),
                const SizedBox(height: 10),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: ArenaThemeId.values.map((id) {
                          return ArenaChoicePill(
                            label: id.displayName,
                            selected: themeId == id,
                            onTap: () async {
                              await prefs.setThemeId(id);
                              ref.read(themeIdProvider.notifier).state = id;
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ArenaSectionBanner('Options'),
                const SizedBox(height: 10),
                GlassCard(
                  child: Column(
                    children: [
                      _OptionRow(
                        label: 'Cont. Rolling',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ArenaChoicePill(
                              label: prefs.continuousRolling ? 'On' : 'Off',
                              selected: true,
                              onTap: () async {
                                await prefs.setContinuousRolling(
                                  !prefs.continuousRolling,
                                );
                                ref.invalidate(preferencesServiceProvider);
                              },
                            ),
                            const SizedBox(width: 8),
                            const ArenaHelpChip(
                              title: 'Continuous Rolling',
                              body:
                                  'When On, you can keep rolling while the magic '
                                  'number (extra-turn face) appears, then move '
                                  'your tokens at the end of the streak.',
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 18),
                      _OptionRow(
                        label: 'Dice Rolling',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ArenaChoicePill(
                              label: prefs.diceRollingStyle == 'fling'
                                  ? 'Fling'
                                  : 'Touch',
                              selected: true,
                              onTap: () async {
                                final next = prefs.diceRollingStyle == 'fling'
                                    ? 'touch'
                                    : 'fling';
                                await prefs.setDiceRollingStyle(next);
                                ref.invalidate(preferencesServiceProvider);
                              },
                            ),
                            const SizedBox(width: 8),
                            const ArenaHelpChip(
                              title: 'Dice Rolling',
                              body:
                                  'Fling: swipe and throw the dice across the board '
                                  'for a real-dice feel.\n\n'
                                  'Touch: tap the board and the die rolls from your '
                                  'corner to the center.',
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 18),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Coin moving speed',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0xFF2E7D32),
                          inactiveTrackColor: ArenaColors.surface,
                          thumbColor: const Color(0xFF43A047),
                          overlayColor:
                              const Color(0xFF2E7D32).withValues(alpha: 0.2),
                          trackHeight: 8,
                        ),
                        child: Slider(
                          value: prefs.coinMoveSpeed,
                          onChanged: (v) async {
                            await prefs.setCoinMoveSpeed(v);
                            ref.invalidate(preferencesServiceProvider);
                          },
                        ),
                      ),
                      const Divider(height: 8),
                      _OptionRow(
                        label: 'Ads every N matches',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: ArenaColors.gold,
                              onPressed: () async {
                                await prefs.setInterstitialEveryN(
                                  prefs.interstitialEveryN - 1,
                                );
                                ref.invalidate(preferencesServiceProvider);
                              },
                            ),
                            Text(
                              '${prefs.interstitialEveryN}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: ArenaColors.gold,
                              onPressed: () async {
                                await prefs.setInterstitialEveryN(
                                  prefs.interstitialEveryN + 1,
                                );
                                ref.invalidate(preferencesServiceProvider);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ArenaSectionBanner('More'),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.6,
                  children: [
                    _LinkChip(
                      label: 'Help',
                      onTap: () => context.push(AppRoutes.help),
                    ),
                    _LinkChip(
                      label: 'About',
                      onTap: () => context.push(AppRoutes.about),
                    ),
                    _LinkChip(
                      label: 'Rules',
                      onTap: () => context.push(AppRoutes.rules),
                    ),
                    _LinkChip(
                      label: 'Profile',
                      onTap: () => context.push(AppRoutes.profile),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _FooterButton(
                  label: 'Exit',
                  color: PlayerColors.red,
                  onTap: () => context.pop(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FooterButton(
                  label: 'Done',
                  color: const Color(0xFF2E7D32),
                  onTap: () => context.pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({required this.label, required this.trailing});

  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ),
        trailing,
      ],
    );
  }
}

class _LinkChip extends StatelessWidget {
  const _LinkChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [ArenaColors.goldLight, ArenaColors.goldDark],
            ),
            boxShadow: [
              BoxShadow(
                color: ArenaColors.gold.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ArenaColors.backgroundDeep,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  const _FooterButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.lerp(color, Colors.white, 0.2)!,
                color,
                Color.lerp(color, Colors.black, 0.2)!,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
