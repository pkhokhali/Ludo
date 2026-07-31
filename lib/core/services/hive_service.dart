import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';

/// Opens Hive boxes used across the app. Typed adapters land in Module 10.
class HiveService {
  HiveService._();

  static Future<void> init() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox(HiveBoxes.settings),
      Hive.openBox(HiveBoxes.profile),
      Hive.openBox(HiveBoxes.statistics),
      Hive.openBox(HiveBoxes.achievements),
      Hive.openBox(HiveBoxes.gameSnapshot),
      Hive.openBox(HiveBoxes.ruleOverrides),
    ]);
  }

  static Box box(String name) => Hive.box(name);

  static Future<void> close() => Hive.close();
}
