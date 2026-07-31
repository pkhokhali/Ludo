import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/engine/game_engine/game_state_factory.dart';
import 'package:ludo_arena/engine/rule_engine/power_rule_engine.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PowerRuleEngine power;
  late GameState state;

  setUp(() async {
    final config = await RuleConfigRepository().load();
    power = PowerRuleEngine(config);
    state = GameStateFactory.create(
      config: const GameConfig(mode: GameMode.power, playerCount: 2),
    );
  });

  group('momentum', () {
    test('clamps to configured max', () {
      expect(power.clampMomentum(99), 10);
      expect(power.clampMomentum(-3), 0);
      expect(power.clampMomentum(5), 5);
    });

    test('earn values come from config', () {
      expect(power.earnForCapture(), 2);
      expect(power.earnForReachHome(), 3);
      expect(power.earnForDestroyShield(), 3);
    });
  });

  group('shield', () {
    test('requires momentum and on-board token', () {
      final poor = state.copyWith(
        players: [
          state.players.first.copyWith(momentum: 0),
          ...state.players.skip(1),
        ],
      );
      final result = power.canUsePower(poor, 'pred', PowerType.shield, tokenId: 'red_0');
      expect(result.isValid, isFalse);

      final richYard = state.copyWith(
        players: [
          state.players.first.copyWith(momentum: 5),
          ...state.players.skip(1),
        ],
      );
      expect(
        power.canUsePower(richYard, 'pred', PowerType.shield, tokenId: 'red_0').isValid,
        isFalse,
      );

      final onBoard = richYard.copyWith(
        tokens: [
          for (final t in richYard.tokens)
            if (t.id == 'red_0')
              t.copyWith(
                status: TokenStatus.onBoard,
                position: 0,
                pathProgress: 0,
              )
            else
              t,
        ],
      );
      expect(
        power.canUsePower(onBoard, 'pred', PowerType.shield, tokenId: 'red_0').isValid,
        isTrue,
      );
    });

    test('applyShield sets flag', () {
      final tokens = power.applyShield(state.tokens, 'red_0');
      expect(tokens.firstWhere((t) => t.id == 'red_0').hasShield, isTrue);
    });
  });

  group('capture momentum', () {
    test('adds destroy-shield bonus', () {
      expect(power.momentumForCapture(destroyedShield: false), 2);
      expect(power.momentumForCapture(destroyedShield: true), 5);
    });
  });

  group('feature toggles', () {
    test('disabled feature rejects power', () async {
      final config = await RuleConfigRepository().load();
      final disabled = config.copyWith(
        power: config.power.copyWith(
          features: config.power.features.copyWith(goldenDice: false),
        ),
      );
      final engine = PowerRuleEngine(disabled);
      final rich = state.copyWith(
        players: [
          state.players.first.copyWith(momentum: 10),
          ...state.players.skip(1),
        ],
      );
      expect(
        engine.canUsePower(rich, 'pred', PowerType.goldenDice).isValid,
        isFalse,
      );
    });
  });
}
