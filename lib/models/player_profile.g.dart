// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerProfileImpl _$$PlayerProfileImplFromJson(Map<String, dynamic> json) =>
    _$PlayerProfileImpl(
      displayName: json['displayName'] as String? ?? 'Player_1',
      coins: (json['coins'] as num?)?.toInt() ?? 1000,
      diamonds: (json['diamonds'] as num?)?.toInt() ?? 50,
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      favoriteThemeId: json['favoriteThemeId'] as String? ?? 'classic',
      unlockedAchievementIds:
          (json['unlockedAchievementIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlayerProfileImplToJson(_$PlayerProfileImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'coins': instance.coins,
      'diamonds': instance.diamonds,
      'xp': instance.xp,
      'level': instance.level,
      'favoriteThemeId': instance.favoriteThemeId,
      'unlockedAchievementIds': instance.unlockedAchievementIds,
    };
