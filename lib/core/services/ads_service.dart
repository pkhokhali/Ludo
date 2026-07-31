import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// AdMob integration. Never shows during active gameplay.
class AdsService {
  AdsService({this.useTestIds = true});

  final bool useTestIds;
  bool _initialized = false;
  BannerAd? _banner;
  InterstitialAd? _interstitial;

  /// Google sample test unit IDs.
  static const _testBanner = 'ca-app-pub-3940256099942544/6300978111';
  static const _testInterstitial = 'ca-app-pub-3940256099942544/1033173712';

  bool get isReady => _initialized;
  BannerAd? get bannerAd => _banner;

  Future<void> init() async {
    try {
      await MobileAds.instance.initialize();
      _initialized = true;
      await _loadInterstitial();
      debugPrint('[AdsService] initialized (testIds=$useTestIds)');
    } catch (e) {
      debugPrint('[AdsService] init failed: $e');
      _initialized = false;
    }
  }

  String get _bannerId => useTestIds
      ? _testBanner
      : const String.fromEnvironment(
          'ADMOB_BANNER_ID',
          defaultValue: _testBanner,
        );

  String get _interstitialId => useTestIds
      ? _testInterstitial
      : const String.fromEnvironment(
          'ADMOB_INTERSTITIAL_ID',
          defaultValue: _testInterstitial,
        );

  Future<BannerAd?> loadHomeBanner() async {
    if (!_initialized) return null;
    final completer = Completer<BannerAd?>();
    _banner?.dispose();
    _banner = BannerAd(
      size: AdSize.banner,
      adUnitId: _bannerId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!completer.isCompleted) completer.complete(ad as BannerAd);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          _banner = null;
          debugPrint('[AdsService] banner failed: $error');
          if (!completer.isCompleted) completer.complete(null);
        },
      ),
      request: const AdRequest(),
    )..load();
    return completer.future.timeout(
      const Duration(seconds: 8),
      onTimeout: () => _banner,
    );
  }

  Future<void> _loadInterstitial() async {
    await InterstitialAd.load(
      adUnitId: _interstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitial = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _interstitial = null;
              _loadInterstitial();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _interstitial = null;
              _loadInterstitial();
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('[AdsService] interstitial load failed: $error');
          _interstitial = null;
        },
      ),
    );
  }

  /// Call only after a completed match when returning to Home.
  Future<bool> maybeShowInterstitial({
    required int matchesSinceLastAd,
    required int everyN,
  }) async {
    if (!_initialized) return false;
    if (matchesSinceLastAd < everyN) return false;
    final ad = _interstitial;
    if (ad == null) {
      await _loadInterstitial();
      return false;
    }
    await ad.show();
    return true;
  }

  Future<void> dispose() async {
    await _banner?.dispose();
    await _interstitial?.dispose();
  }
}
