// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  String get id => throw _privateConstructorUsedError;
  GameConfig get config => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;
  List<Token> get tokens => throw _privateConstructorUsedError;
  int get currentPlayerIndex => throw _privateConstructorUsedError;
  int? get lastDiceValue => throw _privateConstructorUsedError;
  int get consecutiveSixes => throw _privateConstructorUsedError;
  bool get awaitingMove => throw _privateConstructorUsedError;
  bool get extraTurnPending => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  String? get winnerPlayerId => throw _privateConstructorUsedError;
  List<String> get finishOrder => throw _privateConstructorUsedError;
  GamePhase get phase => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({
    String id,
    GameConfig config,
    List<Player> players,
    List<Token> tokens,
    int currentPlayerIndex,
    int? lastDiceValue,
    int consecutiveSixes,
    bool awaitingMove,
    bool extraTurnPending,
    bool isFinished,
    String? winnerPlayerId,
    List<String> finishOrder,
    GamePhase phase,
    DateTime? startedAt,
    DateTime? updatedAt,
  });

  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? config = null,
    Object? players = null,
    Object? tokens = null,
    Object? currentPlayerIndex = null,
    Object? lastDiceValue = freezed,
    Object? consecutiveSixes = null,
    Object? awaitingMove = null,
    Object? extraTurnPending = null,
    Object? isFinished = null,
    Object? winnerPlayerId = freezed,
    Object? finishOrder = null,
    Object? phase = null,
    Object? startedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as GameConfig,
            players: null == players
                ? _value.players
                : players // ignore: cast_nullable_to_non_nullable
                      as List<Player>,
            tokens: null == tokens
                ? _value.tokens
                : tokens // ignore: cast_nullable_to_non_nullable
                      as List<Token>,
            currentPlayerIndex: null == currentPlayerIndex
                ? _value.currentPlayerIndex
                : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            lastDiceValue: freezed == lastDiceValue
                ? _value.lastDiceValue
                : lastDiceValue // ignore: cast_nullable_to_non_nullable
                      as int?,
            consecutiveSixes: null == consecutiveSixes
                ? _value.consecutiveSixes
                : consecutiveSixes // ignore: cast_nullable_to_non_nullable
                      as int,
            awaitingMove: null == awaitingMove
                ? _value.awaitingMove
                : awaitingMove // ignore: cast_nullable_to_non_nullable
                      as bool,
            extraTurnPending: null == extraTurnPending
                ? _value.extraTurnPending
                : extraTurnPending // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFinished: null == isFinished
                ? _value.isFinished
                : isFinished // ignore: cast_nullable_to_non_nullable
                      as bool,
            winnerPlayerId: freezed == winnerPlayerId
                ? _value.winnerPlayerId
                : winnerPlayerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            finishOrder: null == finishOrder
                ? _value.finishOrder
                : finishOrder // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            phase: null == phase
                ? _value.phase
                : phase // ignore: cast_nullable_to_non_nullable
                      as GamePhase,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameConfigCopyWith<$Res> get config {
    return $GameConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
    _$GameStateImpl value,
    $Res Function(_$GameStateImpl) then,
  ) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    GameConfig config,
    List<Player> players,
    List<Token> tokens,
    int currentPlayerIndex,
    int? lastDiceValue,
    int consecutiveSixes,
    bool awaitingMove,
    bool extraTurnPending,
    bool isFinished,
    String? winnerPlayerId,
    List<String> finishOrder,
    GamePhase phase,
    DateTime? startedAt,
    DateTime? updatedAt,
  });

  @override
  $GameConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
    _$GameStateImpl _value,
    $Res Function(_$GameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? config = null,
    Object? players = null,
    Object? tokens = null,
    Object? currentPlayerIndex = null,
    Object? lastDiceValue = freezed,
    Object? consecutiveSixes = null,
    Object? awaitingMove = null,
    Object? extraTurnPending = null,
    Object? isFinished = null,
    Object? winnerPlayerId = freezed,
    Object? finishOrder = null,
    Object? phase = null,
    Object? startedAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$GameStateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        config: null == config
            ? _value.config
            : config // ignore: cast_nullable_to_non_nullable
                  as GameConfig,
        players: null == players
            ? _value._players
            : players // ignore: cast_nullable_to_non_nullable
                  as List<Player>,
        tokens: null == tokens
            ? _value._tokens
            : tokens // ignore: cast_nullable_to_non_nullable
                  as List<Token>,
        currentPlayerIndex: null == currentPlayerIndex
            ? _value.currentPlayerIndex
            : currentPlayerIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        lastDiceValue: freezed == lastDiceValue
            ? _value.lastDiceValue
            : lastDiceValue // ignore: cast_nullable_to_non_nullable
                  as int?,
        consecutiveSixes: null == consecutiveSixes
            ? _value.consecutiveSixes
            : consecutiveSixes // ignore: cast_nullable_to_non_nullable
                  as int,
        awaitingMove: null == awaitingMove
            ? _value.awaitingMove
            : awaitingMove // ignore: cast_nullable_to_non_nullable
                  as bool,
        extraTurnPending: null == extraTurnPending
            ? _value.extraTurnPending
            : extraTurnPending // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFinished: null == isFinished
            ? _value.isFinished
            : isFinished // ignore: cast_nullable_to_non_nullable
                  as bool,
        winnerPlayerId: freezed == winnerPlayerId
            ? _value.winnerPlayerId
            : winnerPlayerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        finishOrder: null == finishOrder
            ? _value._finishOrder
            : finishOrder // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        phase: null == phase
            ? _value.phase
            : phase // ignore: cast_nullable_to_non_nullable
                  as GamePhase,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl implements _GameState {
  const _$GameStateImpl({
    required this.id,
    required this.config,
    required final List<Player> players,
    required final List<Token> tokens,
    this.currentPlayerIndex = 0,
    this.lastDiceValue,
    this.consecutiveSixes = 0,
    this.awaitingMove = false,
    this.extraTurnPending = false,
    this.isFinished = false,
    this.winnerPlayerId,
    final List<String> finishOrder = const [],
    this.phase = GamePhase.rolling,
    this.startedAt,
    this.updatedAt,
  }) : _players = players,
       _tokens = tokens,
       _finishOrder = finishOrder;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  final String id;
  @override
  final GameConfig config;
  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<Token> _tokens;
  @override
  List<Token> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  @JsonKey()
  final int currentPlayerIndex;
  @override
  final int? lastDiceValue;
  @override
  @JsonKey()
  final int consecutiveSixes;
  @override
  @JsonKey()
  final bool awaitingMove;
  @override
  @JsonKey()
  final bool extraTurnPending;
  @override
  @JsonKey()
  final bool isFinished;
  @override
  final String? winnerPlayerId;
  final List<String> _finishOrder;
  @override
  @JsonKey()
  List<String> get finishOrder {
    if (_finishOrder is EqualUnmodifiableListView) return _finishOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finishOrder);
  }

  @override
  @JsonKey()
  final GamePhase phase;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'GameState(id: $id, config: $config, players: $players, tokens: $tokens, currentPlayerIndex: $currentPlayerIndex, lastDiceValue: $lastDiceValue, consecutiveSixes: $consecutiveSixes, awaitingMove: $awaitingMove, extraTurnPending: $extraTurnPending, isFinished: $isFinished, winnerPlayerId: $winnerPlayerId, finishOrder: $finishOrder, phase: $phase, startedAt: $startedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            (identical(other.currentPlayerIndex, currentPlayerIndex) ||
                other.currentPlayerIndex == currentPlayerIndex) &&
            (identical(other.lastDiceValue, lastDiceValue) ||
                other.lastDiceValue == lastDiceValue) &&
            (identical(other.consecutiveSixes, consecutiveSixes) ||
                other.consecutiveSixes == consecutiveSixes) &&
            (identical(other.awaitingMove, awaitingMove) ||
                other.awaitingMove == awaitingMove) &&
            (identical(other.extraTurnPending, extraTurnPending) ||
                other.extraTurnPending == extraTurnPending) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.winnerPlayerId, winnerPlayerId) ||
                other.winnerPlayerId == winnerPlayerId) &&
            const DeepCollectionEquality().equals(
              other._finishOrder,
              _finishOrder,
            ) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    config,
    const DeepCollectionEquality().hash(_players),
    const DeepCollectionEquality().hash(_tokens),
    currentPlayerIndex,
    lastDiceValue,
    consecutiveSixes,
    awaitingMove,
    extraTurnPending,
    isFinished,
    winnerPlayerId,
    const DeepCollectionEquality().hash(_finishOrder),
    phase,
    startedAt,
    updatedAt,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(this);
  }
}

abstract class _GameState implements GameState {
  const factory _GameState({
    required final String id,
    required final GameConfig config,
    required final List<Player> players,
    required final List<Token> tokens,
    final int currentPlayerIndex,
    final int? lastDiceValue,
    final int consecutiveSixes,
    final bool awaitingMove,
    final bool extraTurnPending,
    final bool isFinished,
    final String? winnerPlayerId,
    final List<String> finishOrder,
    final GamePhase phase,
    final DateTime? startedAt,
    final DateTime? updatedAt,
  }) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  String get id;
  @override
  GameConfig get config;
  @override
  List<Player> get players;
  @override
  List<Token> get tokens;
  @override
  int get currentPlayerIndex;
  @override
  int? get lastDiceValue;
  @override
  int get consecutiveSixes;
  @override
  bool get awaitingMove;
  @override
  bool get extraTurnPending;
  @override
  bool get isFinished;
  @override
  String? get winnerPlayerId;
  @override
  List<String> get finishOrder;
  @override
  GamePhase get phase;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
