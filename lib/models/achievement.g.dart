// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementDefImpl _$$AchievementDefImplFromJson(Map<String, dynamic> json) =>
    _$AchievementDefImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      unlocked: json['unlocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$AchievementDefImplToJson(
  _$AchievementDefImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'unlocked': instance.unlocked,
};
