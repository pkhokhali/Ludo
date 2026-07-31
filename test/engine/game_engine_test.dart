import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/engine/game_engine/game_engine.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_action.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_state.dart';

class _SeqRandom implements Random {
  _SeqRandom(this.values);
  final List<int> values;
  int i = 0;

  @override
  int nextInt(int max) => values[i++ % values.length];

  @override
  double nextDouble() => 0;

  @override
  bool nextBool() => false;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GameEngine engine;
  late GameState state;

  setUp(() async {
    final config = await RuleConfigRepository().load();
    // Dice sequence: 6 (unlock), then 4 (move)
    engine = GameEngine(config: config, random: _SeqRandom([5, 3]));
    state = GameStateFactory.create(
      config: const GameConfig(mode: GameMode.classic, playerCount: 2),
    );
  });

  test('roll then unlock on 6', () {
    final roll = engine.apply(state, const GameAction.rollDice());
    expect(roll.isOk, isTrue);
    expect(roll.state.lastDiceValue, 6); // 5+1
    expect(roll.state.phase, GamePhase.selectingToken);
    expect(roll.state.awaitingMove, isTrue);

    final move = engine.apply(
      roll.state,
      const GameAction.moveToken(tokenId: 'red_0'),
    );
    expect(move.isOk, isTrue);
    final token = move.state.tokens.firstWhere((t) => t.id == 'red_0');
    expect(token.status, TokenStatus.onBoard);
  });

  test('forced dice value for tests', () {
    final roll = engine.apply(
      state,
      const GameAction.rollDice(forcedValue: 2),
    );
    // All in yard — no moves on 2 → turn advances
    expect(roll.state.currentPlayerIndex, isNot(0));
    expect(
      roll.events.any(
        (e) => e.maybeMap(diceRolled: (d) => d.value == 2, orElse: () => false),
      ),
      isTrue,
    );
  });

  test('three sixes ends turn', () async {
    final config = await RuleConfigRepository().load();
    final eng = GameEngine(config: config, random: Random(1));
    final s = state.copyWith(consecutiveSixes: 2, phase: GamePhase.rolling);
    final roll = eng.apply(s, const GameAction.rollDice(forcedValue: 6));
    expect(
      roll.events.any((e) => e.maybeMap(
            threeSixesPenalty: (_) => true,
            orElse: () => false,
          )),
      isTrue,
    );
    expect(roll.state.currentPlayerIndex, isNot(0));
  });

  test('extra turn on six after move', () {
    final s = state.copyWith(
      tokens: [
        for (final t in state.tokens)
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
    final roll = engine.apply(s, const GameAction.rollDice(forcedValue: 6));
    expect(roll.state.extraTurnPending, isTrue);
    final move = engine.apply(
      roll.state,
      const GameAction.moveToken(tokenId: 'red_0'),
    );
    expect(move.state.currentPlayerIndex, 0); // same player
    expect(move.state.phase, GamePhase.rolling);
  });
}
