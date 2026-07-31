// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  PlayerSeat get seat => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PlayerType get type => throw _privateConstructorUsedError;
  AiDifficulty? get aiDifficulty => throw _privateConstructorUsedError;
  int get momentum => throw _privateConstructorUsedError;
  int get coinsEarned => throw _privateConstructorUsedError;
  int get captures => throw _privateConstructorUsedError;
  int get tokensFinished => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  bool get hasWon => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({
    String id,
    PlayerSeat seat,
    String name,
    PlayerType type,
    AiDifficulty? aiDifficulty,
    int momentum,
    int coinsEarned,
    int captures,
    int tokensFinished,
    bool isReady,
    bool hasWon,
  });
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seat = null,
    Object? name = null,
    Object? type = null,
    Object? aiDifficulty = freezed,
    Object? momentum = null,
    Object? coinsEarned = null,
    Object? captures = null,
    Object? tokensFinished = null,
    Object? isReady = null,
    Object? hasWon = null,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PlayerType,
            aiDifficulty: freezed == aiDifficulty
                ? _value.aiDifficulty
                : aiDifficulty // ignore: cast_nullable_to_non_nullable
                      as AiDifficulty?,
            momentum: null == momentum
                ? _value.momentum
                : momentum // ignore: cast_nullable_to_non_nullable
                      as int,
            coinsEarned: null == coinsEarned
                ? _value.coinsEarned
                : coinsEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            captures: null == captures
                ? _value.captures
                : captures // ignore: cast_nullable_to_non_nullable
                      as int,
            tokensFinished: null == tokensFinished
                ? _value.tokensFinished
                : tokensFinished // ignore: cast_nullable_to_non_nullable
                      as int,
            isReady: null == isReady
                ? _value.isReady
                : isReady // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasWon: null == hasWon
                ? _value.hasWon
                : hasWon // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
    _$PlayerImpl value,
    $Res Function(_$PlayerImpl) then,
  ) = __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    PlayerSeat seat,
    String name,
    PlayerType type,
    AiDifficulty? aiDifficulty,
    int momentum,
    int coinsEarned,
    int captures,
    int tokensFinished,
    bool isReady,
    bool hasWon,
  });
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
    _$PlayerImpl _value,
    $Res Function(_$PlayerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seat = null,
    Object? name = null,
    Object? type = null,
    Object? aiDifficulty = freezed,
    Object? momentum = null,
    Object? coinsEarned = null,
    Object? captures = null,
    Object? tokensFinished = null,
    Object? isReady = null,
    Object? hasWon = null,
  }) {
    return _then(
      _$PlayerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        seat: null == seat
            ? _value.seat
            : seat // ignore: cast_nullable_to_non_nullable
                  as PlayerSeat,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        aiDifficulty: freezed == aiDifficulty
            ? _value.aiDifficulty
            : aiDifficulty // ignore: cast_nullable_to_non_nullable
                  as AiDifficulty?,
        momentum: null == momentum
            ? _value.momentum
            : momentum // ignore: cast_nullable_to_non_nullable
                  as int,
        coinsEarned: null == coinsEarned
            ? _value.coinsEarned
            : coinsEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        captures: null == captures
            ? _value.captures
            : captures // ignore: cast_nullable_to_non_nullable
                  as int,
        tokensFinished: null == tokensFinished
            ? _value.tokensFinished
            : tokensFinished // ignore: cast_nullable_to_non_nullable
                  as int,
        isReady: null == isReady
            ? _value.isReady
            : isReady // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasWon: null == hasWon
            ? _value.hasWon
            : hasWon // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl({
    required this.id,
    required this.seat,
    required this.name,
    required this.type,
    this.aiDifficulty,
    this.momentum = 0,
    this.coinsEarned = 0,
    this.captures = 0,
    this.tokensFinished = 0,
    this.isReady = false,
    this.hasWon = false,
  });

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final String id;
  @override
  final PlayerSeat seat;
  @override
  final String name;
  @override
  final PlayerType type;
  @override
  final AiDifficulty? aiDifficulty;
  @override
  @JsonKey()
  final int momentum;
  @override
  @JsonKey()
  final int coinsEarned;
  @override
  @JsonKey()
  final int captures;
  @override
  @JsonKey()
  final int tokensFinished;
  @override
  @JsonKey()
  final bool isReady;
  @override
  @JsonKey()
  final bool hasWon;

  @override
  String toString() {
    return 'Player(id: $id, seat: $seat, name: $name, type: $type, aiDifficulty: $aiDifficulty, momentum: $momentum, coinsEarned: $coinsEarned, captures: $captures, tokensFinished: $tokensFinished, isReady: $isReady, hasWon: $hasWon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.aiDifficulty, aiDifficulty) ||
                other.aiDifficulty == aiDifficulty) &&
            (identical(other.momentum, momentum) ||
                other.momentum == momentum) &&
            (identical(other.coinsEarned, coinsEarned) ||
                other.coinsEarned == coinsEarned) &&
            (identical(other.captures, captures) ||
                other.captures == captures) &&
            (identical(other.tokensFinished, tokensFinished) ||
                other.tokensFinished == tokensFinished) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            (identical(other.hasWon, hasWon) || other.hasWon == hasWon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    seat,
    name,
    type,
    aiDifficulty,
    momentum,
    coinsEarned,
    captures,
    tokensFinished,
    isReady,
    hasWon,
  );

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(this);
  }
}

abstract class _Player implements Player {
  const factory _Player({
    required final String id,
    required final PlayerSeat seat,
    required final String name,
    required final PlayerType type,
    final AiDifficulty? aiDifficulty,
    final int momentum,
    final int coinsEarned,
    final int captures,
    final int tokensFinished,
    final bool isReady,
    final bool hasWon,
  }) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  String get id;
  @override
  PlayerSeat get seat;
  @override
  String get name;
  @override
  PlayerType get type;
  @override
  AiDifficulty? get aiDifficulty;
  @override
  int get momentum;
  @override
  int get coinsEarned;
  @override
  int get captures;
  @override
  int get tokensFinished;
  @override
  bool get isReady;
  @override
  bool get hasWon;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
