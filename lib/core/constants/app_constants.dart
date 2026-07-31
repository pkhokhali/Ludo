/// App-wide string and numeric constants for Ludo Arena.
abstract final class AppConstants {
  static const String appName = 'Ludo Arena';
  static const String tagline = 'The Next Generation Ludo Experience';
  static const String packageName = 'com.ludoarena.app';

  static const int minPlayers = 2;
  static const int maxPlayers = 4;
  static const int tokensPerPlayer = 4;

  static const int defaultInterstitialEveryNMatches = 3;
  static const int reconnectTimeoutSeconds = 60;
}

/// Animation duration tokens (milliseconds).
abstract final class AnimationDurations {
  static const int splashMs = 2200;
  static const int pageTransitionMs = 350;
  static const int tokenMoveMs = 280;
  static const int tokenBounceMs = 120;
  static const int diceRollMs = 1200;
  static const int captureBurstMs = 600;
  static const int victoryMs = 2500;
}

/// Hive box names.
abstract final class HiveBoxes {
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String statistics = 'statistics';
  static const String achievements = 'achievements';
  static const String gameSnapshot = 'game_snapshot';
  static const String ruleOverrides = 'rule_overrides';
}

/// SharedPreferences keys.
abstract final class PrefKeys {
  static const String soundEnabled = 'sound_enabled';
  static const String musicEnabled = 'music_enabled';
  static const String hapticsEnabled = 'haptics_enabled';
  static const String themeId = 'theme_id';
  static const String interstitialEveryN = 'interstitial_every_n';
  static const String matchesSinceLastAd = 'matches_since_last_ad';
  static const String onboardingDone = 'onboarding_done';
}
