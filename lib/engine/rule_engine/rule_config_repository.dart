import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/models/rule_config.dart';

/// Loads bundled RuleConfig and merges optional Hive overrides.
class RuleConfigRepository {
  RuleConfigRepository({AssetBundle? bundle, this._overrideBox})
      : _bundle = bundle ?? rootBundle;

  static const String assetPath = 'assets/config/rule_config.json';
  static const String overrideKey = 'rule_config_override';

  final AssetBundle _bundle;
  final Box? _overrideBox;

  RuleConfig? _cached;

  Future<RuleConfig> load() async {
    if (_cached != null) return _cached!;

    final raw = await _bundle.loadString(assetPath);
    final map = jsonDecode(raw) as Map<String, dynamic>;
    var config = RuleConfig.fromJson(map);

    final box = _overrideBox ?? _tryBox();
    final overrideRaw = box?.get(overrideKey);
    if (overrideRaw is String && overrideRaw.isNotEmpty) {
      final overrideMap = jsonDecode(overrideRaw) as Map<String, dynamic>;
      config = _merge(config, RuleConfig.fromJson(overrideMap));
    }

    _cached = config;
    return config;
  }

  Future<void> saveOverride(RuleConfig config) async {
    final box = _overrideBox ?? _tryBox();
    if (box == null) return;
    await box.put(overrideKey, jsonEncode(config.toJson()));
    _cached = config;
  }

  Future<void> clearOverride() async {
    final box = _overrideBox ?? _tryBox();
    await box?.delete(overrideKey);
    _cached = null;
  }

  void invalidateCache() => _cached = null;

  Box? _tryBox() {
    try {
      return Hive.box(HiveBoxes.ruleOverrides);
    } catch (_) {
      return null;
    }
  }

  /// Shallow merge: override power features/costs and classic flags when present.
  RuleConfig _merge(RuleConfig base, RuleConfig overlay) {
    return base.copyWith(
      classic: overlay.classic,
      power: overlay.power,
    );
  }
}
