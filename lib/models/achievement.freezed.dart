// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AchievementDef _$AchievementDefFromJson(Map<String, dynamic> json) {
  return _AchievementDef.fromJson(json);
}

/// @nodoc
mixin _$AchievementDef {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get unlocked => throw _privateConstructorUsedError;

  /// Serializes this AchievementDef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementDefCopyWith<AchievementDef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementDefCopyWith<$Res> {
  factory $AchievementDefCopyWith(
    AchievementDef value,
    $Res Function(AchievementDef) then,
  ) = _$AchievementDefCopyWithImpl<$Res, AchievementDef>;
  @useResult
  $Res call({String id, String title, String description, bool unlocked});
}

/// @nodoc
class _$AchievementDefCopyWithImpl<$Res, $Val extends AchievementDef>
    implements $AchievementDefCopyWith<$Res> {
  _$AchievementDefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? unlocked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            unlocked: null == unlocked
                ? _value.unlocked
                : unlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AchievementDefImplCopyWith<$Res>
    implements $AchievementDefCopyWith<$Res> {
  factory _$$AchievementDefImplCopyWith(
    _$AchievementDefImpl value,
    $Res Function(_$AchievementDefImpl) then,
  ) = __$$AchievementDefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String description, bool unlocked});
}

/// @nodoc
class __$$AchievementDefImplCopyWithImpl<$Res>
    extends _$AchievementDefCopyWithImpl<$Res, _$AchievementDefImpl>
    implements _$$AchievementDefImplCopyWith<$Res> {
  __$$AchievementDefImplCopyWithImpl(
    _$AchievementDefImpl _value,
    $Res Function(_$AchievementDefImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AchievementDef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? unlocked = null,
  }) {
    return _then(
      _$AchievementDefImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        unlocked: null == unlocked
            ? _value.unlocked
            : unlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementDefImpl implements _AchievementDef {
  const _$AchievementDefImpl({
    required this.id,
    required this.title,
    required this.description,
    this.unlocked = false,
  });

  factory _$AchievementDefImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementDefImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool unlocked;

  @override
  String toString() {
    return 'AchievementDef(id: $id, title: $title, description: $description, unlocked: $unlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementDefImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unlocked, unlocked) ||
                other.unlocked == unlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, unlocked);

  /// Create a copy of AchievementDef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementDefImplCopyWith<_$AchievementDefImpl> get copyWith =>
      __$$AchievementDefImplCopyWithImpl<_$AchievementDefImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementDefImplToJson(this);
  }
}

abstract class _AchievementDef implements AchievementDef {
  const factory _AchievementDef({
    required final String id,
    required final String title,
    required final String description,
    final bool unlocked,
  }) = _$AchievementDefImpl;

  factory _AchievementDef.fromJson(Map<String, dynamic> json) =
      _$AchievementDefImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get unlocked;

  /// Create a copy of AchievementDef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementDefImplCopyWith<_$AchievementDefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
