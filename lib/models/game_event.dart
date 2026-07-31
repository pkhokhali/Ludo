import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'game_event.freezed.dart';
part 'game_event.g.dart';

/// Side-effect events emitted by GameEngine for AnimationEngine / UI.
@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.diceRolled({
    required String playerId,
    required int value,
  }) = DiceRolledEvent;

  const factory GameEvent.tokenMoved({
    required String tokenId,
    required int from,
    required int to,
  }) = TokenMovedEvent;

  const factory GameEvent.tokenUnlocked({required String tokenId}) =
      TokenUnlockedEvent;

  const factory GameEvent.captured({
    required String attackerTokenId,
    required String victimTokenId,
  }) = CapturedEvent;

  const factory GameEvent.sixRolled({required String playerId}) = SixRolledEvent;

  const factory GameEvent.threeSixesPenalty({required String playerId}) =
      ThreeSixesPenaltyEvent;

  const factory GameEvent.momentumChanged({
    required String playerId,
    required int delta,
    required int total,
  }) = MomentumChangedEvent;

  const factory GameEvent.powerUsed({
    required String playerId,
    required PowerType power,
  }) = PowerUsedEvent;

  const factory GameEvent.playerWon({required String playerId}) = PlayerWonEvent;

  const factory GameEvent.turnChanged({required String playerId}) =
      TurnChangedEvent;

  factory GameEvent.fromJson(Map<String, dynamic> json) =>
      _$GameEventFromJson(json);
}
