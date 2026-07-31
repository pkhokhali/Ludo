import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ludo_arena/core/services/ads_service.dart';
import 'package:ludo_arena/core/services/audio_service.dart';
import 'package:ludo_arena/core/services/haptic_service.dart';
import 'package:ludo_arena/core/services/preferences_service.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override sharedPreferencesProvider in main()');
});

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  return PreferencesService(ref.watch(sharedPreferencesProvider));
});

final hapticServiceProvider = Provider<HapticService>((ref) {
  return HapticService(ref.watch(sharedPreferencesProvider));
});

final audioServiceProvider = Provider<AudioService>((ref) {
  final prefs = ref.watch(preferencesServiceProvider);
  final audio = AudioService()
    ..configure(sound: prefs.soundEnabled, music: prefs.musicEnabled);
  return audio;
});

final adsServiceProvider = Provider<AdsService>((ref) {
  return AdsService();
});

final themeIdProvider = StateProvider<ArenaThemeId>((ref) {
  return ref.watch(preferencesServiceProvider).themeId;
});
