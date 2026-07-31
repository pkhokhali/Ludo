import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/rule_config.dart';

part 'game_config.freezed.dart';
part 'game_config.g.dart';

@freezed
class GameConfig with _$GameConfig {
  const factory GameConfig({
    required GameMode mode,
    @Default(4) int playerCount,
    @Default([]) List<PlayerSlotConfig> slots,
    RuleConfig? ruleOverrides,
    @Default(false) bool turnTimerEnabled,
    @Default(30) int turnTimerSeconds,
  }) = _GameConfig;

  factory GameConfig.fromJson(Map<String, dynamic> json) =>
      _$GameConfigFromJson(json);
}

@freezed
class PlayerSlotConfig with _$PlayerSlotConfig {
  const factory PlayerSlotConfig({
    required PlayerSeat seat,
    required PlayerType type,
    @Default('Player') String name,
    AiDifficulty? aiDifficulty,
  }) = _PlayerSlotConfig;

  factory PlayerSlotConfig.fromJson(Map<String, dynamic> json) =>
      _$PlayerSlotConfigFromJson(json);
}
