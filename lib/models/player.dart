import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required PlayerSeat seat,
    required String name,
    required PlayerType type,
    AiDifficulty? aiDifficulty,
    @Default(0) int momentum,
    @Default(0) int coinsEarned,
    @Default(0) int captures,
    @Default(0) int tokensFinished,
    @Default(false) bool isReady,
    @Default(false) bool hasWon,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
