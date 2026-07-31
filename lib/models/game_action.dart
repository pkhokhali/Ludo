import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'game_action.freezed.dart';
part 'game_action.g.dart';

/// Client / UI / AI intents. Host (or local engine) validates via RuleEngine.
@freezed
class GameAction with _$GameAction {
  const factory GameAction.rollDice({
    String? playerId,
    int? forcedValue,
  }) = RollDiceAction;

  const factory GameAction.moveToken({
    required String tokenId,
    String? playerId,
  }) = MoveTokenAction;

  const factory GameAction.usePower({
    required PowerType power,
    String? playerId,
    String? tokenId,
    int? targetCellId,
  }) = UsePowerAction;

  const factory GameAction.endTurn({String? playerId}) = EndTurnAction;

  const factory GameAction.forfeit({required String playerId}) = ForfeitAction;

  factory GameAction.fromJson(Map<String, dynamic> json) =>
      _$GameActionFromJson(json);
}
