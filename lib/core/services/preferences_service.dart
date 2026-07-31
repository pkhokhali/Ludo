import 'package:shared_preferences/shared_preferences.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Reads/writes user preferences (sound, theme, ad frequency).
class PreferencesService {
  PreferencesService(this._prefs);

  final SharedPreferences _prefs;

  bool get soundEnabled => _prefs.getBool(PrefKeys.soundEnabled) ?? true;
  Future<void> setSoundEnabled(bool v) =>
      _prefs.setBool(PrefKeys.soundEnabled, v);

  bool get musicEnabled => _prefs.getBool(PrefKeys.musicEnabled) ?? true;
  Future<void> setMusicEnabled(bool v) =>
      _prefs.setBool(PrefKeys.musicEnabled, v);

  bool get hapticsEnabled => _prefs.getBool(PrefKeys.hapticsEnabled) ?? true;
  Future<void> setHapticsEnabled(bool v) =>
      _prefs.setBool(PrefKeys.hapticsEnabled, v);

  ArenaThemeId get themeId {
    final raw = _prefs.getString(PrefKeys.themeId);
    return ArenaThemeId.values.firstWhere(
      (e) => e.storageKey == raw,
      orElse: () => ArenaThemeId.classic,
    );
  }

  Future<void> setThemeId(ArenaThemeId id) =>
      _prefs.setString(PrefKeys.themeId, id.storageKey);

  int get interstitialEveryN =>
      _prefs.getInt(PrefKeys.interstitialEveryN) ??
      AppConstants.defaultInterstitialEveryNMatches;

  Future<void> setInterstitialEveryN(int n) =>
      _prefs.setInt(PrefKeys.interstitialEveryN, n.clamp(1, 10));

  int get matchesSinceLastAd =>
      _prefs.getInt(PrefKeys.matchesSinceLastAd) ?? 0;

  Future<void> setMatchesSinceLastAd(int n) =>
      _prefs.setInt(PrefKeys.matchesSinceLastAd, n);

  Future<void> incrementMatchesSinceLastAd() =>
      setMatchesSinceLastAd(matchesSinceLastAd + 1);
}
