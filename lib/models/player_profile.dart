import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_profile.freezed.dart';
part 'player_profile.g.dart';

@freezed
class PlayerProfile with _$PlayerProfile {
  const factory PlayerProfile({
    @Default('Player_1') String displayName,
    @Default(1000) int coins,
    @Default(50) int diamonds,
    @Default(0) int xp,
    @Default(1) int level,
    @Default('classic') String favoriteThemeId,
    @Default([]) List<String> unlockedAchievementIds,
  }) = _PlayerProfile;

  factory PlayerProfile.fromJson(Map<String, dynamic> json) =>
      _$PlayerProfileFromJson(json);
}
