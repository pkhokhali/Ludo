// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStatisticsImpl _$$GameStatisticsImplFromJson(
  Map<String, dynamic> json,
) => _$GameStatisticsImpl(
  gamesPlayed: (json['gamesPlayed'] as num?)?.toInt() ?? 0,
  wins: (json['wins'] as num?)?.toInt() ?? 0,
  losses: (json['losses'] as num?)?.toInt() ?? 0,
  captures: (json['captures'] as num?)?.toInt() ?? 0,
  longestWinningStreak: (json['longestWinningStreak'] as num?)?.toInt() ?? 0,
  currentWinningStreak: (json['currentWinningStreak'] as num?)?.toInt() ?? 0,
  momentumUsage: (json['momentumUsage'] as num?)?.toInt() ?? 0,
  favoriteThemeId: json['favoriteThemeId'] as String? ?? 'classic',
);

Map<String, dynamic> _$$GameStatisticsImplToJson(
  _$GameStatisticsImpl instance,
) => <String, dynamic>{
  'gamesPlayed': instance.gamesPlayed,
  'wins': instance.wins,
  'losses': instance.losses,
  'captures': instance.captures,
  'longestWinningStreak': instance.longestWinningStreak,
  'currentWinningStreak': instance.currentWinningStreak,
  'momentumUsage': instance.momentumUsage,
  'favoriteThemeId': instance.favoriteThemeId,
};
