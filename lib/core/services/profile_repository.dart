import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/models/game_statistics.dart';
import 'package:ludo_arena/models/player_profile.dart';

class ProfileRepository {
  Box get _box => Hive.box(HiveBoxes.profile);
  static const String key = 'profile';

  PlayerProfile load() {
    final raw = _box.get(key);
    if (raw is String && raw.isNotEmpty) {
      try {
        return PlayerProfile.fromJson(
          jsonDecode(raw) as Map<String, dynamic>,
        );
      } catch (_) {}
    }
    return const PlayerProfile();
  }

  Future<void> save(PlayerProfile profile) async {
    await _box.put(key, jsonEncode(profile.toJson()));
  }

  Future<PlayerProfile> addXp(int amount) async {
    final p = load();
    var xp = p.xp + amount;
    var level = p.level;
    while (xp >= level * 100) {
      xp -= level * 100;
      level += 1;
    }
    final next = p.copyWith(xp: xp, level: level);
    await save(next);
    return next;
  }

  Future<PlayerProfile> addCoins(int amount) async {
    final current = load();
    final next = current.copyWith(coins: current.coins + amount);
    await save(next);
    return next;
  }
}

class StatisticsRepository {
  Box get _box => Hive.box(HiveBoxes.statistics);
  static const String key = 'stats';

  GameStatistics load() {
    final raw = _box.get(key);
    if (raw is String && raw.isNotEmpty) {
      try {
        return GameStatistics.fromJson(
          jsonDecode(raw) as Map<String, dynamic>,
        );
      } catch (_) {}
    }
    return const GameStatistics();
  }

  Future<void> save(GameStatistics stats) async {
    await _box.put(key, jsonEncode(stats.toJson()));
  }

  Future<GameStatistics> recordMatch({
    required bool won,
    required int captures,
    required int momentumUsed,
    String themeId = 'classic',
  }) async {
    final s = load();
    final streak = won ? s.currentWinningStreak + 1 : 0;
    final next = s.copyWith(
      gamesPlayed: s.gamesPlayed + 1,
      wins: s.wins + (won ? 1 : 0),
      losses: s.losses + (won ? 0 : 1),
      captures: s.captures + captures,
      currentWinningStreak: streak,
      longestWinningStreak: streak > s.longestWinningStreak
          ? streak
          : s.longestWinningStreak,
      momentumUsage: s.momentumUsage + momentumUsed,
      favoriteThemeId: themeId,
    );
    await save(next);
    return next;
  }
}
