// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameAction _$GameActionFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'roll_dice':
      return RollDiceAction.fromJson(json);
    case 'move_token':
      return MoveTokenAction.fromJson(json);
    case 'use_power':
      return UsePowerAction.fromJson(json);
    case 'end_turn':
      return EndTurnAction.fromJson(json);
    case 'forfeit':
      return ForfeitAction.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'type',
        'GameAction',
        'Invalid union type "${json['type']}"!',
      );
  }
}

/// @nodoc
mixin _$GameAction {
  String? get playerId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this GameAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameActionCopyWith<GameAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameActionCopyWith<$Res> {
  factory $GameActionCopyWith(
    GameAction value,
    $Res Function(GameAction) then,
  ) = _$GameActionCopyWithImpl<$Res, GameAction>;
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class _$GameActionCopyWithImpl<$Res, $Val extends GameAction>
    implements $GameActionCopyWith<$Res> {
  _$GameActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId!
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RollDiceActionImplCopyWith<$Res>
    implements $GameActionCopyWith<$Res> {
  factory _$$RollDiceActionImplCopyWith(
    _$RollDiceActionImpl value,
    $Res Function(_$RollDiceActionImpl) then,
  ) = __$$RollDiceActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? playerId, int? forcedValue});
}

/// @nodoc
class __$$RollDiceActionImplCopyWithImpl<$Res>
    extends _$GameActionCopyWithImpl<$Res, _$RollDiceActionImpl>
    implements _$$RollDiceActionImplCopyWith<$Res> {
  __$$RollDiceActionImplCopyWithImpl(
    _$RollDiceActionImpl _value,
    $Res Function(_$RollDiceActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = freezed, Object? forcedValue = freezed}) {
    return _then(
      _$RollDiceActionImpl(
        playerId: freezed == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        forcedValue: freezed == forcedValue
            ? _value.forcedValue
            : forcedValue // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RollDiceActionImpl implements RollDiceAction {
  const _$RollDiceActionImpl({
    this.playerId,
    this.forcedValue,
    final String? $type,
  }) : $type = $type ?? 'roll_dice';

  factory _$RollDiceActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RollDiceActionImplFromJson(json);

  @override
  final String? playerId;
  @override
  final int? forcedValue;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameAction.rollDice(playerId: $playerId, forcedValue: $forcedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RollDiceActionImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.forcedValue, forcedValue) ||
                other.forcedValue == forcedValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, forcedValue);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RollDiceActionImplCopyWith<_$RollDiceActionImpl> get copyWith =>
      __$$RollDiceActionImplCopyWithImpl<_$RollDiceActionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) {
    return rollDice(playerId, forcedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) {
    return rollDice?.call(playerId, forcedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) {
    if (rollDice != null) {
      return rollDice(playerId, forcedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) {
    return rollDice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) {
    return rollDice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) {
    if (rollDice != null) {
      return rollDice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RollDiceActionImplToJson(this);
  }
}

abstract class RollDiceAction implements GameAction {
  const factory RollDiceAction({
    final String? playerId,
    final int? forcedValue,
  }) = _$RollDiceActionImpl;

  factory RollDiceAction.fromJson(Map<String, dynamic> json) =
      _$RollDiceActionImpl.fromJson;

  @override
  String? get playerId;
  int? get forcedValue;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RollDiceActionImplCopyWith<_$RollDiceActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MoveTokenActionImplCopyWith<$Res>
    implements $GameActionCopyWith<$Res> {
  factory _$$MoveTokenActionImplCopyWith(
    _$MoveTokenActionImpl value,
    $Res Function(_$MoveTokenActionImpl) then,
  ) = __$$MoveTokenActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tokenId, String? playerId});
}

/// @nodoc
class __$$MoveTokenActionImplCopyWithImpl<$Res>
    extends _$GameActionCopyWithImpl<$Res, _$MoveTokenActionImpl>
    implements _$$MoveTokenActionImplCopyWith<$Res> {
  __$$MoveTokenActionImplCopyWithImpl(
    _$MoveTokenActionImpl _value,
    $Res Function(_$MoveTokenActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tokenId = null, Object? playerId = freezed}) {
    return _then(
      _$MoveTokenActionImpl(
        tokenId: null == tokenId
            ? _value.tokenId
            : tokenId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerId: freezed == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MoveTokenActionImpl implements MoveTokenAction {
  const _$MoveTokenActionImpl({
    required this.tokenId,
    this.playerId,
    final String? $type,
  }) : $type = $type ?? 'move_token';

  factory _$MoveTokenActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoveTokenActionImplFromJson(json);

  @override
  final String tokenId;
  @override
  final String? playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameAction.moveToken(tokenId: $tokenId, playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoveTokenActionImpl &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenId, playerId);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoveTokenActionImplCopyWith<_$MoveTokenActionImpl> get copyWith =>
      __$$MoveTokenActionImplCopyWithImpl<_$MoveTokenActionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) {
    return moveToken(tokenId, playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) {
    return moveToken?.call(tokenId, playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) {
    if (moveToken != null) {
      return moveToken(tokenId, playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) {
    return moveToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) {
    return moveToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) {
    if (moveToken != null) {
      return moveToken(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MoveTokenActionImplToJson(this);
  }
}

abstract class MoveTokenAction implements GameAction {
  const factory MoveTokenAction({
    required final String tokenId,
    final String? playerId,
  }) = _$MoveTokenActionImpl;

  factory MoveTokenAction.fromJson(Map<String, dynamic> json) =
      _$MoveTokenActionImpl.fromJson;

  String get tokenId;
  @override
  String? get playerId;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoveTokenActionImplCopyWith<_$MoveTokenActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsePowerActionImplCopyWith<$Res>
    implements $GameActionCopyWith<$Res> {
  factory _$$UsePowerActionImplCopyWith(
    _$UsePowerActionImpl value,
    $Res Function(_$UsePowerActionImpl) then,
  ) = __$$UsePowerActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PowerType power,
    String? playerId,
    String? tokenId,
    int? targetCellId,
  });
}

/// @nodoc
class __$$UsePowerActionImplCopyWithImpl<$Res>
    extends _$GameActionCopyWithImpl<$Res, _$UsePowerActionImpl>
    implements _$$UsePowerActionImplCopyWith<$Res> {
  __$$UsePowerActionImplCopyWithImpl(
    _$UsePowerActionImpl _value,
    $Res Function(_$UsePowerActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? power = null,
    Object? playerId = freezed,
    Object? tokenId = freezed,
    Object? targetCellId = freezed,
  }) {
    return _then(
      _$UsePowerActionImpl(
        power: null == power
            ? _value.power
            : power // ignore: cast_nullable_to_non_nullable
                  as PowerType,
        playerId: freezed == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenId: freezed == tokenId
            ? _value.tokenId
            : tokenId // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetCellId: freezed == targetCellId
            ? _value.targetCellId
            : targetCellId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsePowerActionImpl implements UsePowerAction {
  const _$UsePowerActionImpl({
    required this.power,
    this.playerId,
    this.tokenId,
    this.targetCellId,
    final String? $type,
  }) : $type = $type ?? 'use_power';

  factory _$UsePowerActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsePowerActionImplFromJson(json);

  @override
  final PowerType power;
  @override
  final String? playerId;
  @override
  final String? tokenId;
  @override
  final int? targetCellId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameAction.usePower(power: $power, playerId: $playerId, tokenId: $tokenId, targetCellId: $targetCellId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsePowerActionImpl &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.targetCellId, targetCellId) ||
                other.targetCellId == targetCellId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, power, playerId, tokenId, targetCellId);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsePowerActionImplCopyWith<_$UsePowerActionImpl> get copyWith =>
      __$$UsePowerActionImplCopyWithImpl<_$UsePowerActionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) {
    return usePower(power, playerId, tokenId, targetCellId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) {
    return usePower?.call(power, playerId, tokenId, targetCellId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) {
    if (usePower != null) {
      return usePower(power, playerId, tokenId, targetCellId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) {
    return usePower(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) {
    return usePower?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) {
    if (usePower != null) {
      return usePower(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UsePowerActionImplToJson(this);
  }
}

abstract class UsePowerAction implements GameAction {
  const factory UsePowerAction({
    required final PowerType power,
    final String? playerId,
    final String? tokenId,
    final int? targetCellId,
  }) = _$UsePowerActionImpl;

  factory UsePowerAction.fromJson(Map<String, dynamic> json) =
      _$UsePowerActionImpl.fromJson;

  PowerType get power;
  @override
  String? get playerId;
  String? get tokenId;
  int? get targetCellId;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsePowerActionImplCopyWith<_$UsePowerActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndTurnActionImplCopyWith<$Res>
    implements $GameActionCopyWith<$Res> {
  factory _$$EndTurnActionImplCopyWith(
    _$EndTurnActionImpl value,
    $Res Function(_$EndTurnActionImpl) then,
  ) = __$$EndTurnActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? playerId});
}

/// @nodoc
class __$$EndTurnActionImplCopyWithImpl<$Res>
    extends _$GameActionCopyWithImpl<$Res, _$EndTurnActionImpl>
    implements _$$EndTurnActionImplCopyWith<$Res> {
  __$$EndTurnActionImplCopyWithImpl(
    _$EndTurnActionImpl _value,
    $Res Function(_$EndTurnActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = freezed}) {
    return _then(
      _$EndTurnActionImpl(
        playerId: freezed == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EndTurnActionImpl implements EndTurnAction {
  const _$EndTurnActionImpl({this.playerId, final String? $type})
    : $type = $type ?? 'end_turn';

  factory _$EndTurnActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndTurnActionImplFromJson(json);

  @override
  final String? playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameAction.endTurn(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndTurnActionImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndTurnActionImplCopyWith<_$EndTurnActionImpl> get copyWith =>
      __$$EndTurnActionImplCopyWithImpl<_$EndTurnActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) {
    return endTurn(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) {
    return endTurn?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) {
    if (endTurn != null) {
      return endTurn(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) {
    return endTurn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) {
    return endTurn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) {
    if (endTurn != null) {
      return endTurn(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EndTurnActionImplToJson(this);
  }
}

abstract class EndTurnAction implements GameAction {
  const factory EndTurnAction({final String? playerId}) = _$EndTurnActionImpl;

  factory EndTurnAction.fromJson(Map<String, dynamic> json) =
      _$EndTurnActionImpl.fromJson;

  @override
  String? get playerId;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndTurnActionImplCopyWith<_$EndTurnActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForfeitActionImplCopyWith<$Res>
    implements $GameActionCopyWith<$Res> {
  factory _$$ForfeitActionImplCopyWith(
    _$ForfeitActionImpl value,
    $Res Function(_$ForfeitActionImpl) then,
  ) = __$$ForfeitActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class __$$ForfeitActionImplCopyWithImpl<$Res>
    extends _$GameActionCopyWithImpl<$Res, _$ForfeitActionImpl>
    implements _$$ForfeitActionImplCopyWith<$Res> {
  __$$ForfeitActionImplCopyWithImpl(
    _$ForfeitActionImpl _value,
    $Res Function(_$ForfeitActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _$ForfeitActionImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForfeitActionImpl implements ForfeitAction {
  const _$ForfeitActionImpl({required this.playerId, final String? $type})
    : $type = $type ?? 'forfeit';

  factory _$ForfeitActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForfeitActionImplFromJson(json);

  @override
  final String playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameAction.forfeit(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForfeitActionImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForfeitActionImplCopyWith<_$ForfeitActionImpl> get copyWith =>
      __$$ForfeitActionImplCopyWithImpl<_$ForfeitActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? playerId, int? forcedValue) rollDice,
    required TResult Function(String tokenId, String? playerId) moveToken,
    required TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )
    usePower,
    required TResult Function(String? playerId) endTurn,
    required TResult Function(String playerId) forfeit,
  }) {
    return forfeit(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? playerId, int? forcedValue)? rollDice,
    TResult? Function(String tokenId, String? playerId)? moveToken,
    TResult? Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult? Function(String? playerId)? endTurn,
    TResult? Function(String playerId)? forfeit,
  }) {
    return forfeit?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? playerId, int? forcedValue)? rollDice,
    TResult Function(String tokenId, String? playerId)? moveToken,
    TResult Function(
      PowerType power,
      String? playerId,
      String? tokenId,
      int? targetCellId,
    )?
    usePower,
    TResult Function(String? playerId)? endTurn,
    TResult Function(String playerId)? forfeit,
    required TResult orElse(),
  }) {
    if (forfeit != null) {
      return forfeit(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RollDiceAction value) rollDice,
    required TResult Function(MoveTokenAction value) moveToken,
    required TResult Function(UsePowerAction value) usePower,
    required TResult Function(EndTurnAction value) endTurn,
    required TResult Function(ForfeitAction value) forfeit,
  }) {
    return forfeit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RollDiceAction value)? rollDice,
    TResult? Function(MoveTokenAction value)? moveToken,
    TResult? Function(UsePowerAction value)? usePower,
    TResult? Function(EndTurnAction value)? endTurn,
    TResult? Function(ForfeitAction value)? forfeit,
  }) {
    return forfeit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RollDiceAction value)? rollDice,
    TResult Function(MoveTokenAction value)? moveToken,
    TResult Function(UsePowerAction value)? usePower,
    TResult Function(EndTurnAction value)? endTurn,
    TResult Function(ForfeitAction value)? forfeit,
    required TResult orElse(),
  }) {
    if (forfeit != null) {
      return forfeit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ForfeitActionImplToJson(this);
  }
}

abstract class ForfeitAction implements GameAction {
  const factory ForfeitAction({required final String playerId}) =
      _$ForfeitActionImpl;

  factory ForfeitAction.fromJson(Map<String, dynamic> json) =
      _$ForfeitActionImpl.fromJson;

  @override
  String get playerId;

  /// Create a copy of GameAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForfeitActionImplCopyWith<_$ForfeitActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
