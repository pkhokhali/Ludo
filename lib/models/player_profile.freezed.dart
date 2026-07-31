// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlayerProfile _$PlayerProfileFromJson(Map<String, dynamic> json) {
  return _PlayerProfile.fromJson(json);
}

/// @nodoc
mixin _$PlayerProfile {
  String get displayName => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  int get diamonds => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get favoriteThemeId => throw _privateConstructorUsedError;
  List<String> get unlockedAchievementIds => throw _privateConstructorUsedError;

  /// Serializes this PlayerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerProfileCopyWith<PlayerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerProfileCopyWith<$Res> {
  factory $PlayerProfileCopyWith(
    PlayerProfile value,
    $Res Function(PlayerProfile) then,
  ) = _$PlayerProfileCopyWithImpl<$Res, PlayerProfile>;
  @useResult
  $Res call({
    String displayName,
    int coins,
    int diamonds,
    int xp,
    int level,
    String favoriteThemeId,
    List<String> unlockedAchievementIds,
  });
}

/// @nodoc
class _$PlayerProfileCopyWithImpl<$Res, $Val extends PlayerProfile>
    implements $PlayerProfileCopyWith<$Res> {
  _$PlayerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? coins = null,
    Object? diamonds = null,
    Object? xp = null,
    Object? level = null,
    Object? favoriteThemeId = null,
    Object? unlockedAchievementIds = null,
  }) {
    return _then(
      _value.copyWith(
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            coins: null == coins
                ? _value.coins
                : coins // ignore: cast_nullable_to_non_nullable
                      as int,
            diamonds: null == diamonds
                ? _value.diamonds
                : diamonds // ignore: cast_nullable_to_non_nullable
                      as int,
            xp: null == xp
                ? _value.xp
                : xp // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            favoriteThemeId: null == favoriteThemeId
                ? _value.favoriteThemeId
                : favoriteThemeId // ignore: cast_nullable_to_non_nullable
                      as String,
            unlockedAchievementIds: null == unlockedAchievementIds
                ? _value.unlockedAchievementIds
                : unlockedAchievementIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerProfileImplCopyWith<$Res>
    implements $PlayerProfileCopyWith<$Res> {
  factory _$$PlayerProfileImplCopyWith(
    _$PlayerProfileImpl value,
    $Res Function(_$PlayerProfileImpl) then,
  ) = __$$PlayerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String displayName,
    int coins,
    int diamonds,
    int xp,
    int level,
    String favoriteThemeId,
    List<String> unlockedAchievementIds,
  });
}

/// @nodoc
class __$$PlayerProfileImplCopyWithImpl<$Res>
    extends _$PlayerProfileCopyWithImpl<$Res, _$PlayerProfileImpl>
    implements _$$PlayerProfileImplCopyWith<$Res> {
  __$$PlayerProfileImplCopyWithImpl(
    _$PlayerProfileImpl _value,
    $Res Function(_$PlayerProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? coins = null,
    Object? diamonds = null,
    Object? xp = null,
    Object? level = null,
    Object? favoriteThemeId = null,
    Object? unlockedAchievementIds = null,
  }) {
    return _then(
      _$PlayerProfileImpl(
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        coins: null == coins
            ? _value.coins
            : coins // ignore: cast_nullable_to_non_nullable
                  as int,
        diamonds: null == diamonds
            ? _value.diamonds
            : diamonds // ignore: cast_nullable_to_non_nullable
                  as int,
        xp: null == xp
            ? _value.xp
            : xp // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        favoriteThemeId: null == favoriteThemeId
            ? _value.favoriteThemeId
            : favoriteThemeId // ignore: cast_nullable_to_non_nullable
                  as String,
        unlockedAchievementIds: null == unlockedAchievementIds
            ? _value._unlockedAchievementIds
            : unlockedAchievementIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerProfileImpl implements _PlayerProfile {
  const _$PlayerProfileImpl({
    this.displayName = 'Player_1',
    this.coins = 1000,
    this.diamonds = 50,
    this.xp = 0,
    this.level = 1,
    this.favoriteThemeId = 'classic',
    final List<String> unlockedAchievementIds = const [],
  }) : _unlockedAchievementIds = unlockedAchievementIds;

  factory _$PlayerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerProfileImplFromJson(json);

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final int coins;
  @override
  @JsonKey()
  final int diamonds;
  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final String favoriteThemeId;
  final List<String> _unlockedAchievementIds;
  @override
  @JsonKey()
  List<String> get unlockedAchievementIds {
    if (_unlockedAchievementIds is EqualUnmodifiableListView)
      return _unlockedAchievementIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedAchievementIds);
  }

  @override
  String toString() {
    return 'PlayerProfile(displayName: $displayName, coins: $coins, diamonds: $diamonds, xp: $xp, level: $level, favoriteThemeId: $favoriteThemeId, unlockedAchievementIds: $unlockedAchievementIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerProfileImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.diamonds, diamonds) ||
                other.diamonds == diamonds) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.favoriteThemeId, favoriteThemeId) ||
                other.favoriteThemeId == favoriteThemeId) &&
            const DeepCollectionEquality().equals(
              other._unlockedAchievementIds,
              _unlockedAchievementIds,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    displayName,
    coins,
    diamonds,
    xp,
    level,
    favoriteThemeId,
    const DeepCollectionEquality().hash(_unlockedAchievementIds),
  );

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerProfileImplCopyWith<_$PlayerProfileImpl> get copyWith =>
      __$$PlayerProfileImplCopyWithImpl<_$PlayerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerProfileImplToJson(this);
  }
}

abstract class _PlayerProfile implements PlayerProfile {
  const factory _PlayerProfile({
    final String displayName,
    final int coins,
    final int diamonds,
    final int xp,
    final int level,
    final String favoriteThemeId,
    final List<String> unlockedAchievementIds,
  }) = _$PlayerProfileImpl;

  factory _PlayerProfile.fromJson(Map<String, dynamic> json) =
      _$PlayerProfileImpl.fromJson;

  @override
  String get displayName;
  @override
  int get coins;
  @override
  int get diamonds;
  @override
  int get xp;
  @override
  int get level;
  @override
  String get favoriteThemeId;
  @override
  List<String> get unlockedAchievementIds;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerProfileImplCopyWith<_$PlayerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
