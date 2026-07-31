import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_statistics.freezed.dart';
part 'game_statistics.g.dart';

@freezed
class GameStatistics with _$GameStatistics {
  const factory GameStatistics({
    @Default(0) int gamesPlayed,
    @Default(0) int wins,
    @Default(0) int losses,
    @Default(0) int captures,
    @Default(0) int longestWinningStreak,
    @Default(0) int currentWinningStreak,
    @Default(0) int momentumUsage,
    @Default('classic') String favoriteThemeId,
  }) = _GameStatistics;

  factory GameStatistics.fromJson(Map<String, dynamic> json) =>
      _$GameStatisticsFromJson(json);

  const GameStatistics._();

  double get winRate {
    if (gamesPlayed == 0) return 0;
    return wins / gamesPlayed;
  }
}
