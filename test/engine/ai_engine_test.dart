import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/engine/ai_engine/ai_engine.dart';
import 'package:ludo_arena/engine/game_engine/game_engine.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_action.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AiEngine ai;
  late GameState state;

  setUp(() async {
    final config = await RuleConfigRepository().load();
    ai = AiEngine.fromConfig(config, random: Random(42));
    state = GameStateFactory.create(
      config: const GameConfig(
        mode: GameMode.ai,
        playerCount: 2,
        slots: [
          PlayerSlotConfig(
            seat: PlayerSeat.red,
            type: PlayerType.human,
            name: 'You',
          ),
          PlayerSlotConfig(
            seat: PlayerSeat.blue,
            type: PlayerType.ai,
            name: 'CPU',
            aiDifficulty: AiDifficulty.hard,
          ),
        ],
      ),
    );
  });

  test('human turn returns null', () {
    expect(ai.decide(state, AiDifficulty.hard), isNull);
  });

  test('AI rolls when in rolling phase', () {
    final aiTurn = state.copyWith(currentPlayerIndex: 1);
    final action = ai.decide(aiTurn, AiDifficulty.medium);
    expect(action, isA<RollDiceAction>());
  });

  test('AI prefers capture over plain move (expert)', () async {
    final config = await RuleConfigRepository().load();
    final engine = AiEngine.fromConfig(config, random: Random(1));

    // Blue AI to move; can capture red with dice 3 or move elsewhere with another token
    final geoStartBlue = 13;
    final capturePos = (geoStartBlue + 5) % 52;

    final s = state.copyWith(
      currentPlayerIndex: 1,
      awaitingMove: true,
      lastDiceValue: 3,
      phase: GamePhase.selectingToken,
      tokens: [
        for (final t in state.tokens)
          if (t.id == 'blue_0')
            t.copyWith(
              status: TokenStatus.onBoard,
              position: geoStartBlue + 2,
              pathProgress: 2,
            )
          else if (t.id == 'blue_1')
            t.copyWith(
              status: TokenStatus.onBoard,
              position: geoStartBlue,
              pathProgress: 0,
            )
          else if (t.id == 'red_0')
            t.copyWith(
              status: TokenStatus.onBoard,
              position: capturePos,
              pathProgress: 20,
            )
          else
            t,
      ],
    );

    final action = engine.decide(s, AiDifficulty.expert);
    expect(action, isA<MoveTokenAction>());
    expect((action! as MoveTokenAction).tokenId, 'blue_0');
  });

  test('Easy vs Expert weights differ in noise', () {
    expect(
      AiWeights.forDifficulty(AiDifficulty.easy).noise,
      greaterThan(AiWeights.forDifficulty(AiDifficulty.expert).noise),
    );
    expect(
      AiWeights.forDifficulty(AiDifficulty.expert).capture,
      greaterThan(AiWeights.forDifficulty(AiDifficulty.easy).capture),
    );
  });
}
