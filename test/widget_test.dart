import 'package:flutter_test/flutter_test.dart';
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

    expect(find.text('Ludo Arena'), findsOneWidget);
    expect(find.text('The Next Generation Ludo Experience'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pumpAndSettle();

    expect(find.text('Play Now'), findsOneWidget);
  });
}
