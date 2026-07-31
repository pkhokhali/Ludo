import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/models/token.dart';

/// Builds a fresh offline GameState from [GameConfig].
class GameStateFactory {
  static GameState create({
    required GameConfig config,
    String id = 'local',
    DateTime? now,
  }) {
    final seats = PlayerSeat.values.take(config.playerCount).toList();
    final slots = config.slots.isNotEmpty
        ? config.slots
        : [
            for (var i = 0; i < seats.length; i++)
              PlayerSlotConfig(
                seat: seats[i],
                type: PlayerType.human,
                name: 'Player ${i + 1}',
              ),
          ];

    final players = <Player>[];
    final tokens = <Token>[];

    for (var i = 0; i < slots.length; i++) {
      final slot = slots[i];
      final playerId = 'p${slot.seat.name}';
      players.add(
        Player(
          id: playerId,
          seat: slot.seat,
          name: slot.name,
          type: slot.type,
          aiDifficulty: slot.aiDifficulty,
        ),
      );
      for (var t = 0; t < 4; t++) {
        tokens.add(
          Token(
            id: '${slot.seat.name}_$t',
            seat: slot.seat,
            index: t,
          ),
        );
      }
    }

    final stamp = now ?? DateTime.now().toUtc();
    return GameState(
      id: id,
      config: config.copyWith(slots: slots, playerCount: players.length),
      players: players,
      tokens: tokens,
      startedAt: stamp,
      updatedAt: stamp,
    );
  }
}
