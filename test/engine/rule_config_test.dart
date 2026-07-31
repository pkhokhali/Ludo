import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/engine/rule_engine/board_geometry.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/rule_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('RuleConfig', () {
    test('parses bundled JSON asset', () async {
      final repo = RuleConfigRepository();
      final config = await repo.load();

      expect(config.classic.unlockRoll, 6);
      expect(config.classic.threeSixesRule, isTrue);
      expect(config.classic.mainPathLength, 52);
      expect(config.power.momentumMax, 10);
      expect(config.power.earn.capture, 2);
      expect(config.power.spend.shield, 3);
      expect(config.power.features.portal, isTrue);
    });

    test('round-trips through JSON', () async {
      final raw =
          await rootBundle.loadString(RuleConfigRepository.assetPath);
      final config = RuleConfig.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
      final again = RuleConfig.fromJson(config.toJson());
      expect(again, config);
    });

    test('PowerType cost lookup', () async {
      final config = await RuleConfigRepository().load();
      expect(config.power.spend.costOf(PowerType.goldenDice), 4);
      expect(config.power.features.isEnabled(PowerType.shield), isTrue);
    });
  });

  group('BoardGeometry', () {
    test('builds main path and home stretches', () async {
      final config = await RuleConfigRepository().load();
      final geo = BoardGeometry(config.classic);
      final cells = geo.buildCells();

      expect(cells.where((c) => c.id < 52).length, 52);
      expect(geo.isSafeCell(0), isTrue); // start cells are safe
      expect(
        geo.absoluteFromProgress(PlayerSeat.red, 0),
        BoardGeometry.startCells[PlayerSeat.red],
      );
    });
  });
}
