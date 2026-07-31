import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';

/// Thin wrapper around Flutter [HapticFeedback] with prefs gating.
class HapticService {
  HapticService(this._prefs);

  final SharedPreferences _prefs;

  bool get isEnabled => _prefs.getBool(PrefKeys.hapticsEnabled) ?? true;

  Future<void> setEnabled(bool value) =>
      _prefs.setBool(PrefKeys.hapticsEnabled, value);

  Future<void> light() async {
    if (!isEnabled) return;
    await HapticFeedback.lightImpact();
  }

  Future<void> medium() async {
    if (!isEnabled) return;
    await HapticFeedback.mediumImpact();
  }

  Future<void> heavy() async {
    if (!isEnabled) return;
    await HapticFeedback.heavyImpact();
  }

  Future<void> selection() async {
    if (!isEnabled) return;
    await HapticFeedback.selectionClick();
  }

  /// Dice bounce (light) / settle (heavy).
  Future<void> diceBounce() => light();
  Future<void> diceSettle() => heavy();
  Future<void> capture() => heavy();
  Future<void> victory() => heavy();
  Future<void> portal() => medium();
}
