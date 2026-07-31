import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ludo_arena/app.dart';
import 'package:ludo_arena/core/services/ads_service.dart';
import 'package:ludo_arena/core/services/hive_service.dart';
import 'package:ludo_arena/core/services/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  final prefs = await SharedPreferences.getInstance();
  await HiveService.init();

  final ads = AdsService();
  await ads.init();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        adsServiceProvider.overrideWithValue(ads),
      ],
      child: const LudoArenaApp(),
    ),
  );
}
