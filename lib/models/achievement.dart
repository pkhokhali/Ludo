import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

@freezed
class AchievementDef with _$AchievementDef {
  const factory AchievementDef({
    required String id,
    required String title,
    required String description,
    @Default(false) bool unlocked,
  }) = _AchievementDef;

  factory AchievementDef.fromJson(Map<String, dynamic> json) =>
      _$AchievementDefFromJson(json);
}

abstract final class AchievementCatalog {
  static const List<AchievementDef> defaults = [
    AchievementDef(
      id: 'first_win',
      title: 'First Victory',
      description: 'Win your first match',
    ),
    AchievementDef(
      id: 'ten_captures',
      title: 'Hunter',
      description: 'Capture 10 tokens total',
    ),
    AchievementDef(
      id: 'five_wins',
      title: 'Arena Regular',
      description: 'Win 5 matches',
    ),
    AchievementDef(
      id: 'streak_3',
      title: 'On Fire',
      description: 'Win 3 matches in a row',
    ),
    AchievementDef(
      id: 'momentum_user',
      title: 'Power Player',
      description: 'Spend momentum 10 times',
    ),
  ];
}

class AchievementsRepository {
  Box get _box => Hive.box(HiveBoxes.achievements);
  static const String key = 'unlocked';

  Set<String> unlockedIds() {
    final raw = _box.get(key);
    if (raw is String && raw.isNotEmpty) {
      try {
        return Set<String>.from(jsonDecode(raw) as List);
      } catch (_) {}
    }
    return {};
  }

  List<AchievementDef> all() {
    final unlocked = unlockedIds();
    return [
      for (final a in AchievementCatalog.defaults)
        a.copyWith(unlocked: unlocked.contains(a.id)),
    ];
  }

  Future<List<String>> evaluate({
    required int wins,
    required int captures,
    required int streak,
    required int momentumUsage,
  }) async {
    final unlocked = unlockedIds();
    final newly = <String>[];

    void tryUnlock(String id, bool condition) {
      if (condition && !unlocked.contains(id)) {
        unlocked.add(id);
        newly.add(id);
      }
    }

    tryUnlock('first_win', wins >= 1);
    tryUnlock('ten_captures', captures >= 10);
    tryUnlock('five_wins', wins >= 5);
    tryUnlock('streak_3', streak >= 3);
    tryUnlock('momentum_user', momentumUsage >= 10);

    if (newly.isNotEmpty) {
      await _box.put(key, jsonEncode(unlocked.toList()));
    }
    return newly;
  }
}
