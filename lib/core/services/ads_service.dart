import 'package:flutter/foundation.dart';

/// AdMob facade. Real SDK wiring lands in Module 11.
/// Ads must never interrupt active gameplay.
class AdsService {
  bool _initialized = false;

  Future<void> init() async {
    // google_mobile_ads MobileAds.instance.initialize() in Module 11
    _initialized = true;
    debugPrint('[AdsService] stub initialized');
  }

  bool get isReady => _initialized;

  Future<void> showBannerHome() async {
    if (!_initialized) return;
    debugPrint('[AdsService] banner: home');
  }

  /// Call only after a completed match when returning to Home.
  Future<bool> maybeShowInterstitial({
    required int matchesSinceLastAd,
    required int everyN,
  }) async {
    if (!_initialized) return false;
    if (matchesSinceLastAd < everyN) return false;
    debugPrint('[AdsService] interstitial: post-match');
    return true;
  }

  Future<void> dispose() async {}
}
