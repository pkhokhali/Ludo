import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesServiceProvider);
    final themeId = ref.watch(themeIdProvider);
    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'Settings',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 24),
        children: [
          Text(
            'Audio & Feel',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ArenaColors.goldLight,
                ),
          ),
          const SizedBox(height: 10),
          GlassCard(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Sound Effects'),
                  value: prefs.soundEnabled,
                  activeThumbColor: ArenaColors.gold,
                  onChanged: (v) async {
                    await prefs.setSoundEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                    ref.read(audioServiceProvider).configure(
                          sound: v,
                          music: prefs.musicEnabled,
                        );
                  },
                ),
                SwitchListTile(
                  title: const Text('Music'),
                  value: prefs.musicEnabled,
                  activeThumbColor: ArenaColors.gold,
                  onChanged: (v) async {
                    await prefs.setMusicEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                    ref.read(audioServiceProvider).configure(
                          sound: prefs.soundEnabled,
                          music: v,
                        );
                  },
                ),
                SwitchListTile(
                  title: const Text('Haptics'),
                  value: prefs.hapticsEnabled,
                  activeThumbColor: ArenaColors.gold,
                  onChanged: (v) async {
                    await prefs.setHapticsEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                  },
                ),
              ],
            ),
          ).animate().fadeIn(duration: 360.ms),
          const SizedBox(height: 20),
          Text(
            'Look',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ArenaColors.goldLight,
                ),
          ),
          const SizedBox(height: 10),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Theme', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Row(
                  children: ArenaThemeId.values.map((id) {
                    final selected = themeId == id;
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: id == ArenaThemeId.values.last ? 0 : 8,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              await prefs.setThemeId(id);
                              ref.read(themeIdProvider.notifier).state = id;
                            },
                            borderRadius: BorderRadius.circular(14),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: selected
                                    ? ArenaColors.gold.withValues(alpha: 0.28)
                                    : ArenaColors.surface.withValues(alpha: 0.4),
                                border: Border.all(
                                  color: selected
                                      ? ArenaColors.gold
                                      : ArenaColors.border,
                                ),
                              ),
                              child: Text(
                                id.displayName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: selected
                                          ? ArenaColors.goldLight
                                          : ArenaColors.textSecondary,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 80.ms, duration: 360.ms),
          const SizedBox(height: 20),
          Text(
            'Ads',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ArenaColors.goldLight,
                ),
          ),
          const SizedBox(height: 10),
          GlassCard(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Interstitial every N matches'),
              subtitle: Text('${prefs.interstitialEveryN}'),
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
          ).animate().fadeIn(delay: 140.ms, duration: 360.ms),
        ],
      ),
    );
  }
}
