import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/engine/game_engine/game_state_factory.dart';
import 'package:ludo_arena/engine/rule_engine/board_geometry.dart';
import 'package:ludo_arena/engine/rule_engine/classic_rule_engine.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_repository.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/token.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ClassicRuleEngine engine;
  late GameState base;

  setUp(() async {
    final config = await RuleConfigRepository().load();
    engine = ClassicRuleEngine(config);
    base = GameStateFactory.create(
      config: const GameConfig(mode: GameMode.classic, playerCount: 4),
    );
  });

  group('unlock', () {
    test('requires unlock roll (6)', () {
      expect(engine.getLegalMoves(base, 5), isEmpty);
      final moves = engine.getLegalMoves(base, 6);
      expect(moves.length, 4); // all yard tokens of current (red) player
      expect(moves.every((m) => m.unlocks), isTrue);
      expect(
        moves.first.toPosition,
        BoardGeometry.startCells[PlayerSeat.red],
      );
    });
  });

  group('movement', () {
    test('moves along main path by dice steps', () {
      final start = BoardGeometry.startCells[PlayerSeat.red]!;
      var state = _withToken(
        base,
        const Token(
          id: 'red_0',
          seat: PlayerSeat.red,
          index: 0,
          status: TokenStatus.onBoard,
          position: 0,
          pathProgress: 0,
        ),
      );
      // Replace default yard red_0
      state = state.copyWith(
        tokens: [
          for (final t in state.tokens)
            if (t.id == 'red_0')
              Token(
                id: 'red_0',
                seat: PlayerSeat.red,
                index: 0,
                status: TokenStatus.onBoard,
                position: start,
                pathProgress: 0,
              )
            else
              t,
        ],
        phase: GamePhase.selectingToken,
        awaitingMove: true,
        lastDiceValue: 4,
      );

      final moves = engine.getLegalMoves(state, 4);
      expect(moves, hasLength(1));
      expect(moves.first.pathProgress, 4);
      expect(
        moves.first.toPosition,
        engine.geometry.absoluteFromProgress(PlayerSeat.red, 4),
      );
    });
  });

  group('three sixes', () {
    test('detects penalty on third consecutive six', () {
      final state = base.copyWith(consecutiveSixes: 2);
      expect(engine.isThreeSixesPenalty(state, 6), isTrue);
      expect(engine.isThreeSixesPenalty(state, 5), isFalse);
      expect(
        engine.isThreeSixesPenalty(base.copyWith(consecutiveSixes: 1), 6),
        isFalse,
      );
    });
  });

  group('capture', () {
    test('captures opponent on non-safe cell', () {
      final redPos = engine.geometry.absoluteFromProgress(PlayerSeat.red, 5);
      expect(engine.geometry.isSafeCell(redPos), isFalse);

      final state = base.copyWith(
        tokens: [
          for (final t in base.tokens)
            if (t.id == 'red_0')
              Token(
                id: 'red_0',
                seat: PlayerSeat.red,
                index: 0,
                status: TokenStatus.onBoard,
                position: engine.geometry.absoluteFromProgress(PlayerSeat.red, 2),
                pathProgress: 2,
              )
            else if (t.id == 'blue_0')
              Token(
                id: 'blue_0',
                seat: PlayerSeat.blue,
                index: 0,
                status: TokenStatus.onBoard,
                position: redPos,
                pathProgress: 10,
              )
            else
              t,
        ],
      );

      final moves = engine.getLegalMoves(state, 3);
      expect(moves, hasLength(1));
      expect(moves.first.capturesTokenId, 'blue_0');
    });

    test('does not capture on safe cell', () {
      // Place blue on a configured safe cell that red can land on with dice 1
      // from a position 1 before it — pick safe cell 1 if reachable for red.
      final safe = engine.config.classic.safeCells.first;
      // Find progress for red that lands on safe with dice 1
      final start = BoardGeometry.startCells[PlayerSeat.red]!;
      var progress = -1;
      for (var p = 0; p < 52; p++) {
        if (engine.geometry.absoluteFromProgress(PlayerSeat.red, p + 1) ==
            safe) {
          progress = p;
          break;
        }
      }
      expect(progress, greaterThanOrEqualTo(0));

      final state = base.copyWith(
        tokens: [
          for (final t in base.tokens)
            if (t.id == 'red_0')
              Token(
                id: 'red_0',
                seat: PlayerSeat.red,
                index: 0,
                status: TokenStatus.onBoard,
                position: (start + progress) % 52,
                pathProgress: progress,
              )
            else if (t.id == 'blue_0')
              Token(
                id: 'blue_0',
                seat: PlayerSeat.blue,
                index: 0,
                status: TokenStatus.onBoard,
                position: safe,
                pathProgress: 20,
              )
            else
              t,
        ],
      );

      final moves = engine.getLegalMoves(state, 1);
      expect(moves, hasLength(1));
      expect(moves.first.capturesTokenId, isNull);
    });
  });

  group('exact finish', () {
    test('requires exact dice to finish from home stretch', () {
      final state = base.copyWith(
        tokens: [
          for (final t in base.tokens)
            if (t.id == 'red_0')
              Token(
                id: 'red_0',
                seat: PlayerSeat.red,
                index: 0,
                status: TokenStatus.homeStretch,
                position: BoardGeometry.homeStretchId(PlayerSeat.red, 3),
                pathProgress: 51,
                homeProgress: 3,
              )
            else
              t,
        ],
      );

      expect(engine.getLegalMoves(state, 1), hasLength(1)); // advance to cell 4
      expect(engine.getLegalMoves(state, 3), isEmpty); // overshoot finish
      final finishMoves = engine.getLegalMoves(state, 2);
      expect(finishMoves, hasLength(1));
      expect(finishMoves.first.finishes, isTrue);
    });
  });

  group('winner', () {
    test('detects all tokens finished', () {
      final finished = base.copyWith(
        tokens: [
          for (final t in base.tokens)
            if (t.seat == PlayerSeat.red)
              t.copyWith(
                status: TokenStatus.finished,
                position: BoardGeometry.finishId(PlayerSeat.red),
                homeProgress: 5,
              )
            else
              t,
        ],
      );
      expect(engine.hasPlayerWon(finished, 'pred'), isTrue);
      expect(engine.hasPlayerWon(base, 'pred'), isFalse);
    });
  });
}

GameState _withToken(GameState state, Token token) => state;
