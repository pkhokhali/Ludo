import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/app.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/services/ads_service.dart';
import 'package:ludo_arena/core/services/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // CI has no font CDN access; avoid runtime Google Fonts fetches.
    GoogleFonts.config.allowRuntimeFetching = false;

    Hive.init('widget_test_hive');
    for (final name in [
      HiveBoxes.settings,
      HiveBoxes.profile,
      HiveBoxes.statistics,
      HiveBoxes.achievements,
      HiveBoxes.gameSnapshot,
      HiveBoxes.ruleOverrides,
    ]) {
      await Hive.openBox(name);
    }
  });

  testWidgets('Ludo Arena boots to splash then home', (tester) async {
    // Phone-like surface avoids wide desktop overflow in CI defaults.
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          adsServiceProvider.overrideWithValue(AdsService(useTestIds: true)),
        ],
        child: const LudoArenaApp(),
      ),
    );

    // Splash brand is rendered uppercase for hero typography.
    expect(
      find.text(AppConstants.appName.toUpperCase()),
      findsOneWidget,
    );
    expect(find.text(AppConstants.tagline), findsOneWidget);

    // Advance past splash delay without pumpAndSettle (avoids animation hangs).
    await tester.pump(
      const Duration(milliseconds: AnimationDurations.splashMs + 50),
    );
    await tester.pump(); // start route transition
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Play Now'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
