import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/app.dart';
import 'package:ludo_arena/core/services/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Ludo Arena boots to splash', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const LudoArenaApp(),
      ),
    );

    expect(find.text('Ludo Arena'), findsOneWidget);
    expect(find.text('The Next Generation Ludo Experience'), findsOneWidget);

    // Advance splash timer + animations so no pending timers remain.
    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pumpAndSettle();

    expect(find.text('Play Now'), findsOneWidget);
  });
}
