import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesServiceProvider);
    final themeId = ref.watch(themeIdProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GlassCard(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Sound Effects'),
                  value: prefs.soundEnabled,
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
                  onChanged: (v) async {
                    await prefs.setHapticsEnabled(v);
                    ref.invalidate(preferencesServiceProvider);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Theme', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ArenaThemeId.values.map((id) {
                    final selected = themeId == id;
                    return ChoiceChip(
                      label: Text(id.displayName),
                      selected: selected,
                      selectedColor: ArenaColors.gold.withValues(alpha: 0.35),
                      onSelected: (_) async {
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
          GlassCard(
            child: ListTile(
              title: const Text('Interstitial every N matches'),
              subtitle: Text('${prefs.interstitialEveryN}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () async {
                      await prefs.setInterstitialEveryN(
                        prefs.interstitialEveryN - 1,
                      );
                      ref.invalidate(preferencesServiceProvider);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
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
          ),
        ],
      ),
    );
  }
}
