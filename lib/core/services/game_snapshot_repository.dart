import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/models/game_state.dart';

/// Persists / restores the in-progress match as JSON in Hive.
class GameSnapshotRepository {
  Box get _box => Hive.box(HiveBoxes.gameSnapshot);

  static const String key = 'active_game';

  Future<void> save(GameState state) async {
    await _box.put(key, jsonEncode(state.toJson()));
  }

  GameState? load() {
    final raw = _box.get(key);
    if (raw is! String || raw.isEmpty) return null;
    try {
      return GameState.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  bool get hasSnapshot => _box.containsKey(key);

  Future<void> clear() => _box.delete(key);
}
