// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String get id => throw _privateConstructorUsedError;
  PlayerSeat get seat => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  TokenStatus get status => throw _privateConstructorUsedError;

  /// Absolute board cell id when onBoard / homeStretch; -1 in yard/finished.
  int get position => throw _privateConstructorUsedError;

  /// Steps advanced on the main path (0..mainPathLength-1).
  int get pathProgress => throw _privateConstructorUsedError;

  /// Steps into home stretch (0..homeStretchLength).
  int get homeProgress => throw _privateConstructorUsedError;
  bool get hasShield => throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({
    String id,
    PlayerSeat seat,
    int index,
    TokenStatus status,
    int position,
    int pathProgress,
    int homeProgress,
    bool hasShield,
  });
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seat = null,
    Object? index = null,
    Object? status = null,
    Object? position = null,
    Object? pathProgress = null,
    Object? homeProgress = null,
    Object? hasShield = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            seat: null == seat
                ? _value.seat
                : seat // ignore: cast_nullable_to_non_nullable
                      as PlayerSeat,
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TokenStatus,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int,
            pathProgress: null == pathProgress
                ? _value.pathProgress
                : pathProgress // ignore: cast_nullable_to_non_nullable
                      as int,
            homeProgress: null == homeProgress
                ? _value.homeProgress
                : homeProgress // ignore: cast_nullable_to_non_nullable
                      as int,
            hasShield: null == hasShield
                ? _value.hasShield
                : hasShield // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
    _$TokenImpl value,
    $Res Function(_$TokenImpl) then,
  ) = __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    PlayerSeat seat,
    int index,
    TokenStatus status,
    int position,
    int pathProgress,
    int homeProgress,
    bool hasShield,
  });
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
    _$TokenImpl _value,
    $Res Function(_$TokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seat = null,
    Object? index = null,
    Object? status = null,
    Object? position = null,
    Object? pathProgress = null,
    Object? homeProgress = null,
    Object? hasShield = null,
  }) {
    return _then(
      _$TokenImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        seat: null == seat
            ? _value.seat
            : seat // ignore: cast_nullable_to_non_nullable
                  as PlayerSeat,
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TokenStatus,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int,
        pathProgress: null == pathProgress
            ? _value.pathProgress
            : pathProgress // ignore: cast_nullable_to_non_nullable
                  as int,
        homeProgress: null == homeProgress
            ? _value.homeProgress
            : homeProgress // ignore: cast_nullable_to_non_nullable
                  as int,
        hasShield: null == hasShield
            ? _value.hasShield
            : hasShield // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  const _$TokenImpl({
    required this.id,
    required this.seat,
    required this.index,
    this.status = TokenStatus.yard,
    this.position = -1,
    this.pathProgress = 0,
    this.homeProgress = 0,
    this.hasShield = false,
  });

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  final String id;
  @override
  final PlayerSeat seat;
  @override
  final int index;
  @override
  @JsonKey()
  final TokenStatus status;

  /// Absolute board cell id when onBoard / homeStretch; -1 in yard/finished.
  @override
  @JsonKey()
  final int position;

  /// Steps advanced on the main path (0..mainPathLength-1).
  @override
  @JsonKey()
  final int pathProgress;

  /// Steps into home stretch (0..homeStretchLength).
  @override
  @JsonKey()
  final int homeProgress;
  @override
  @JsonKey()
  final bool hasShield;

  @override
  String toString() {
    return 'Token(id: $id, seat: $seat, index: $index, status: $status, position: $position, pathProgress: $pathProgress, homeProgress: $homeProgress, hasShield: $hasShield)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.pathProgress, pathProgress) ||
                other.pathProgress == pathProgress) &&
            (identical(other.homeProgress, homeProgress) ||
                other.homeProgress == homeProgress) &&
            (identical(other.hasShield, hasShield) ||
                other.hasShield == hasShield));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    seat,
    index,
    status,
    position,
    pathProgress,
    homeProgress,
    hasShield,
  );

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(this);
  }
}

abstract class _Token implements Token {
  const factory _Token({
    required final String id,
    required final PlayerSeat seat,
    required final int index,
    final TokenStatus status,
    final int position,
    final int pathProgress,
    final int homeProgress,
    final bool hasShield,
  }) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  String get id;
  @override
  PlayerSeat get seat;
  @override
  int get index;
  @override
  TokenStatus get status;

  /// Absolute board cell id when onBoard / homeStretch; -1 in yard/finished.
  @override
  int get position;

  /// Steps advanced on the main path (0..mainPathLength-1).
  @override
  int get pathProgress;

  /// Steps into home stretch (0..homeStretchLength).
  @override
  int get homeProgress;
  @override
  bool get hasShield;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
