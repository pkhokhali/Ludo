import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/models/token.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required String id,
    required GameConfig config,
    required List<Player> players,
    required List<Token> tokens,
    @Default(0) int currentPlayerIndex,
    int? lastDiceValue,
    @Default(0) int consecutiveSixes,
    @Default(false) bool awaitingMove,
    @Default(false) bool extraTurnPending,
    @Default(false) bool isFinished,
    String? winnerPlayerId,
    @Default([]) List<String> finishOrder,
    @Default(GamePhase.rolling) GamePhase phase,
    DateTime? startedAt,
    DateTime? updatedAt,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}

enum GamePhase {
  rolling,
  selectingToken,
  animating,
  usingPower,
  finished,
}
