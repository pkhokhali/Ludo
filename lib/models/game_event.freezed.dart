// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameEvent _$GameEventFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'dice_rolled':
      return DiceRolledEvent.fromJson(json);
    case 'token_moved':
      return TokenMovedEvent.fromJson(json);
    case 'token_unlocked':
      return TokenUnlockedEvent.fromJson(json);
    case 'captured':
      return CapturedEvent.fromJson(json);
    case 'six_rolled':
      return SixRolledEvent.fromJson(json);
    case 'three_sixes_penalty':
      return ThreeSixesPenaltyEvent.fromJson(json);
    case 'momentum_changed':
      return MomentumChangedEvent.fromJson(json);
    case 'power_used':
      return PowerUsedEvent.fromJson(json);
    case 'player_won':
      return PlayerWonEvent.fromJson(json);
    case 'turn_changed':
      return TurnChangedEvent.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'type',
        'GameEvent',
        'Invalid union type "${json['type']}"!',
      );
  }
}

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this GameEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DiceRolledEventImplCopyWith<$Res> {
  factory _$$DiceRolledEventImplCopyWith(
    _$DiceRolledEventImpl value,
    $Res Function(_$DiceRolledEventImpl) then,
  ) = __$$DiceRolledEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId, int value});
}

/// @nodoc
class __$$DiceRolledEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$DiceRolledEventImpl>
    implements _$$DiceRolledEventImplCopyWith<$Res> {
  __$$DiceRolledEventImplCopyWithImpl(
    _$DiceRolledEventImpl _value,
    $Res Function(_$DiceRolledEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null, Object? value = null}) {
    return _then(
      _$DiceRolledEventImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiceRolledEventImpl implements DiceRolledEvent {
  const _$DiceRolledEventImpl({
    required this.playerId,
    required this.value,
    final String? $type,
  }) : $type = $type ?? 'dice_rolled';

  factory _$DiceRolledEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiceRolledEventImplFromJson(json);

  @override
  final String playerId;
  @override
  final int value;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.diceRolled(playerId: $playerId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiceRolledEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, value);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiceRolledEventImplCopyWith<_$DiceRolledEventImpl> get copyWith =>
      __$$DiceRolledEventImplCopyWithImpl<_$DiceRolledEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return diceRolled(playerId, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return diceRolled?.call(playerId, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (diceRolled != null) {
      return diceRolled(playerId, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return diceRolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return diceRolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (diceRolled != null) {
      return diceRolled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DiceRolledEventImplToJson(this);
  }
}

abstract class DiceRolledEvent implements GameEvent {
  const factory DiceRolledEvent({
    required final String playerId,
    required final int value,
  }) = _$DiceRolledEventImpl;

  factory DiceRolledEvent.fromJson(Map<String, dynamic> json) =
      _$DiceRolledEventImpl.fromJson;

  String get playerId;
  int get value;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiceRolledEventImplCopyWith<_$DiceRolledEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TokenMovedEventImplCopyWith<$Res> {
  factory _$$TokenMovedEventImplCopyWith(
    _$TokenMovedEventImpl value,
    $Res Function(_$TokenMovedEventImpl) then,
  ) = __$$TokenMovedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tokenId, int from, int to});
}

/// @nodoc
class __$$TokenMovedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$TokenMovedEventImpl>
    implements _$$TokenMovedEventImplCopyWith<$Res> {
  __$$TokenMovedEventImplCopyWithImpl(
    _$TokenMovedEventImpl _value,
    $Res Function(_$TokenMovedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tokenId = null, Object? from = null, Object? to = null}) {
    return _then(
      _$TokenMovedEventImpl(
        tokenId: null == tokenId
            ? _value.tokenId
            : tokenId // ignore: cast_nullable_to_non_nullable
                  as String,
        from: null == from
            ? _value.from
            : from // ignore: cast_nullable_to_non_nullable
                  as int,
        to: null == to
            ? _value.to
            : to // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenMovedEventImpl implements TokenMovedEvent {
  const _$TokenMovedEventImpl({
    required this.tokenId,
    required this.from,
    required this.to,
    final String? $type,
  }) : $type = $type ?? 'token_moved';

  factory _$TokenMovedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenMovedEventImplFromJson(json);

  @override
  final String tokenId;
  @override
  final int from;
  @override
  final int to;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.tokenMoved(tokenId: $tokenId, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenMovedEventImpl &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenId, from, to);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenMovedEventImplCopyWith<_$TokenMovedEventImpl> get copyWith =>
      __$$TokenMovedEventImplCopyWithImpl<_$TokenMovedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return tokenMoved(tokenId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return tokenMoved?.call(tokenId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (tokenMoved != null) {
      return tokenMoved(tokenId, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return tokenMoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return tokenMoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (tokenMoved != null) {
      return tokenMoved(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenMovedEventImplToJson(this);
  }
}

abstract class TokenMovedEvent implements GameEvent {
  const factory TokenMovedEvent({
    required final String tokenId,
    required final int from,
    required final int to,
  }) = _$TokenMovedEventImpl;

  factory TokenMovedEvent.fromJson(Map<String, dynamic> json) =
      _$TokenMovedEventImpl.fromJson;

  String get tokenId;
  int get from;
  int get to;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenMovedEventImplCopyWith<_$TokenMovedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TokenUnlockedEventImplCopyWith<$Res> {
  factory _$$TokenUnlockedEventImplCopyWith(
    _$TokenUnlockedEventImpl value,
    $Res Function(_$TokenUnlockedEventImpl) then,
  ) = __$$TokenUnlockedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tokenId});
}

/// @nodoc
class __$$TokenUnlockedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$TokenUnlockedEventImpl>
    implements _$$TokenUnlockedEventImplCopyWith<$Res> {
  __$$TokenUnlockedEventImplCopyWithImpl(
    _$TokenUnlockedEventImpl _value,
    $Res Function(_$TokenUnlockedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tokenId = null}) {
    return _then(
      _$TokenUnlockedEventImpl(
        tokenId: null == tokenId
            ? _value.tokenId
            : tokenId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenUnlockedEventImpl implements TokenUnlockedEvent {
  const _$TokenUnlockedEventImpl({required this.tokenId, final String? $type})
    : $type = $type ?? 'token_unlocked';

  factory _$TokenUnlockedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenUnlockedEventImplFromJson(json);

  @override
  final String tokenId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.tokenUnlocked(tokenId: $tokenId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenUnlockedEventImpl &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenUnlockedEventImplCopyWith<_$TokenUnlockedEventImpl> get copyWith =>
      __$$TokenUnlockedEventImplCopyWithImpl<_$TokenUnlockedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return tokenUnlocked(tokenId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return tokenUnlocked?.call(tokenId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (tokenUnlocked != null) {
      return tokenUnlocked(tokenId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return tokenUnlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return tokenUnlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (tokenUnlocked != null) {
      return tokenUnlocked(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenUnlockedEventImplToJson(this);
  }
}

abstract class TokenUnlockedEvent implements GameEvent {
  const factory TokenUnlockedEvent({required final String tokenId}) =
      _$TokenUnlockedEventImpl;

  factory TokenUnlockedEvent.fromJson(Map<String, dynamic> json) =
      _$TokenUnlockedEventImpl.fromJson;

  String get tokenId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenUnlockedEventImplCopyWith<_$TokenUnlockedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CapturedEventImplCopyWith<$Res> {
  factory _$$CapturedEventImplCopyWith(
    _$CapturedEventImpl value,
    $Res Function(_$CapturedEventImpl) then,
  ) = __$$CapturedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String attackerTokenId, String victimTokenId});
}

/// @nodoc
class __$$CapturedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$CapturedEventImpl>
    implements _$$CapturedEventImplCopyWith<$Res> {
  __$$CapturedEventImplCopyWithImpl(
    _$CapturedEventImpl _value,
    $Res Function(_$CapturedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? attackerTokenId = null, Object? victimTokenId = null}) {
    return _then(
      _$CapturedEventImpl(
        attackerTokenId: null == attackerTokenId
            ? _value.attackerTokenId
            : attackerTokenId // ignore: cast_nullable_to_non_nullable
                  as String,
        victimTokenId: null == victimTokenId
            ? _value.victimTokenId
            : victimTokenId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CapturedEventImpl implements CapturedEvent {
  const _$CapturedEventImpl({
    required this.attackerTokenId,
    required this.victimTokenId,
    final String? $type,
  }) : $type = $type ?? 'captured';

  factory _$CapturedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CapturedEventImplFromJson(json);

  @override
  final String attackerTokenId;
  @override
  final String victimTokenId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.captured(attackerTokenId: $attackerTokenId, victimTokenId: $victimTokenId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CapturedEventImpl &&
            (identical(other.attackerTokenId, attackerTokenId) ||
                other.attackerTokenId == attackerTokenId) &&
            (identical(other.victimTokenId, victimTokenId) ||
                other.victimTokenId == victimTokenId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attackerTokenId, victimTokenId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CapturedEventImplCopyWith<_$CapturedEventImpl> get copyWith =>
      __$$CapturedEventImplCopyWithImpl<_$CapturedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return captured(attackerTokenId, victimTokenId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return captured?.call(attackerTokenId, victimTokenId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured(attackerTokenId, victimTokenId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return captured(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return captured?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CapturedEventImplToJson(this);
  }
}

abstract class CapturedEvent implements GameEvent {
  const factory CapturedEvent({
    required final String attackerTokenId,
    required final String victimTokenId,
  }) = _$CapturedEventImpl;

  factory CapturedEvent.fromJson(Map<String, dynamic> json) =
      _$CapturedEventImpl.fromJson;

  String get attackerTokenId;
  String get victimTokenId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CapturedEventImplCopyWith<_$CapturedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SixRolledEventImplCopyWith<$Res> {
  factory _$$SixRolledEventImplCopyWith(
    _$SixRolledEventImpl value,
    $Res Function(_$SixRolledEventImpl) then,
  ) = __$$SixRolledEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class __$$SixRolledEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$SixRolledEventImpl>
    implements _$$SixRolledEventImplCopyWith<$Res> {
  __$$SixRolledEventImplCopyWithImpl(
    _$SixRolledEventImpl _value,
    $Res Function(_$SixRolledEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _$SixRolledEventImpl(
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
class _$SixRolledEventImpl implements SixRolledEvent {
  const _$SixRolledEventImpl({required this.playerId, final String? $type})
    : $type = $type ?? 'six_rolled';

  factory _$SixRolledEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$SixRolledEventImplFromJson(json);

  @override
  final String playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.sixRolled(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SixRolledEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SixRolledEventImplCopyWith<_$SixRolledEventImpl> get copyWith =>
      __$$SixRolledEventImplCopyWithImpl<_$SixRolledEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return sixRolled(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return sixRolled?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (sixRolled != null) {
      return sixRolled(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return sixRolled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return sixRolled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (sixRolled != null) {
      return sixRolled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SixRolledEventImplToJson(this);
  }
}

abstract class SixRolledEvent implements GameEvent {
  const factory SixRolledEvent({required final String playerId}) =
      _$SixRolledEventImpl;

  factory SixRolledEvent.fromJson(Map<String, dynamic> json) =
      _$SixRolledEventImpl.fromJson;

  String get playerId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SixRolledEventImplCopyWith<_$SixRolledEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThreeSixesPenaltyEventImplCopyWith<$Res> {
  factory _$$ThreeSixesPenaltyEventImplCopyWith(
    _$ThreeSixesPenaltyEventImpl value,
    $Res Function(_$ThreeSixesPenaltyEventImpl) then,
  ) = __$$ThreeSixesPenaltyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class __$$ThreeSixesPenaltyEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$ThreeSixesPenaltyEventImpl>
    implements _$$ThreeSixesPenaltyEventImplCopyWith<$Res> {
  __$$ThreeSixesPenaltyEventImplCopyWithImpl(
    _$ThreeSixesPenaltyEventImpl _value,
    $Res Function(_$ThreeSixesPenaltyEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _$ThreeSixesPenaltyEventImpl(
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
class _$ThreeSixesPenaltyEventImpl implements ThreeSixesPenaltyEvent {
  const _$ThreeSixesPenaltyEventImpl({
    required this.playerId,
    final String? $type,
  }) : $type = $type ?? 'three_sixes_penalty';

  factory _$ThreeSixesPenaltyEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreeSixesPenaltyEventImplFromJson(json);

  @override
  final String playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.threeSixesPenalty(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreeSixesPenaltyEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreeSixesPenaltyEventImplCopyWith<_$ThreeSixesPenaltyEventImpl>
  get copyWith =>
      __$$ThreeSixesPenaltyEventImplCopyWithImpl<_$ThreeSixesPenaltyEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return threeSixesPenalty(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return threeSixesPenalty?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (threeSixesPenalty != null) {
      return threeSixesPenalty(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return threeSixesPenalty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return threeSixesPenalty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (threeSixesPenalty != null) {
      return threeSixesPenalty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreeSixesPenaltyEventImplToJson(this);
  }
}

abstract class ThreeSixesPenaltyEvent implements GameEvent {
  const factory ThreeSixesPenaltyEvent({required final String playerId}) =
      _$ThreeSixesPenaltyEventImpl;

  factory ThreeSixesPenaltyEvent.fromJson(Map<String, dynamic> json) =
      _$ThreeSixesPenaltyEventImpl.fromJson;

  String get playerId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreeSixesPenaltyEventImplCopyWith<_$ThreeSixesPenaltyEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MomentumChangedEventImplCopyWith<$Res> {
  factory _$$MomentumChangedEventImplCopyWith(
    _$MomentumChangedEventImpl value,
    $Res Function(_$MomentumChangedEventImpl) then,
  ) = __$$MomentumChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId, int delta, int total});
}

/// @nodoc
class __$$MomentumChangedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$MomentumChangedEventImpl>
    implements _$$MomentumChangedEventImplCopyWith<$Res> {
  __$$MomentumChangedEventImplCopyWithImpl(
    _$MomentumChangedEventImpl _value,
    $Res Function(_$MomentumChangedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? delta = null,
    Object? total = null,
  }) {
    return _then(
      _$MomentumChangedEventImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        delta: null == delta
            ? _value.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MomentumChangedEventImpl implements MomentumChangedEvent {
  const _$MomentumChangedEventImpl({
    required this.playerId,
    required this.delta,
    required this.total,
    final String? $type,
  }) : $type = $type ?? 'momentum_changed';

  factory _$MomentumChangedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$MomentumChangedEventImplFromJson(json);

  @override
  final String playerId;
  @override
  final int delta;
  @override
  final int total;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.momentumChanged(playerId: $playerId, delta: $delta, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MomentumChangedEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, delta, total);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MomentumChangedEventImplCopyWith<_$MomentumChangedEventImpl>
  get copyWith =>
      __$$MomentumChangedEventImplCopyWithImpl<_$MomentumChangedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return momentumChanged(playerId, delta, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return momentumChanged?.call(playerId, delta, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (momentumChanged != null) {
      return momentumChanged(playerId, delta, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return momentumChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return momentumChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (momentumChanged != null) {
      return momentumChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MomentumChangedEventImplToJson(this);
  }
}

abstract class MomentumChangedEvent implements GameEvent {
  const factory MomentumChangedEvent({
    required final String playerId,
    required final int delta,
    required final int total,
  }) = _$MomentumChangedEventImpl;

  factory MomentumChangedEvent.fromJson(Map<String, dynamic> json) =
      _$MomentumChangedEventImpl.fromJson;

  String get playerId;
  int get delta;
  int get total;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MomentumChangedEventImplCopyWith<_$MomentumChangedEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PowerUsedEventImplCopyWith<$Res> {
  factory _$$PowerUsedEventImplCopyWith(
    _$PowerUsedEventImpl value,
    $Res Function(_$PowerUsedEventImpl) then,
  ) = __$$PowerUsedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId, PowerType power});
}

/// @nodoc
class __$$PowerUsedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$PowerUsedEventImpl>
    implements _$$PowerUsedEventImplCopyWith<$Res> {
  __$$PowerUsedEventImplCopyWithImpl(
    _$PowerUsedEventImpl _value,
    $Res Function(_$PowerUsedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null, Object? power = null}) {
    return _then(
      _$PowerUsedEventImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        power: null == power
            ? _value.power
            : power // ignore: cast_nullable_to_non_nullable
                  as PowerType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PowerUsedEventImpl implements PowerUsedEvent {
  const _$PowerUsedEventImpl({
    required this.playerId,
    required this.power,
    final String? $type,
  }) : $type = $type ?? 'power_used';

  factory _$PowerUsedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PowerUsedEventImplFromJson(json);

  @override
  final String playerId;
  @override
  final PowerType power;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.powerUsed(playerId: $playerId, power: $power)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerUsedEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.power, power) || other.power == power));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId, power);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerUsedEventImplCopyWith<_$PowerUsedEventImpl> get copyWith =>
      __$$PowerUsedEventImplCopyWithImpl<_$PowerUsedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return powerUsed(playerId, power);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return powerUsed?.call(playerId, power);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (powerUsed != null) {
      return powerUsed(playerId, power);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return powerUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return powerUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (powerUsed != null) {
      return powerUsed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PowerUsedEventImplToJson(this);
  }
}

abstract class PowerUsedEvent implements GameEvent {
  const factory PowerUsedEvent({
    required final String playerId,
    required final PowerType power,
  }) = _$PowerUsedEventImpl;

  factory PowerUsedEvent.fromJson(Map<String, dynamic> json) =
      _$PowerUsedEventImpl.fromJson;

  String get playerId;
  PowerType get power;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerUsedEventImplCopyWith<_$PowerUsedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayerWonEventImplCopyWith<$Res> {
  factory _$$PlayerWonEventImplCopyWith(
    _$PlayerWonEventImpl value,
    $Res Function(_$PlayerWonEventImpl) then,
  ) = __$$PlayerWonEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class __$$PlayerWonEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$PlayerWonEventImpl>
    implements _$$PlayerWonEventImplCopyWith<$Res> {
  __$$PlayerWonEventImplCopyWithImpl(
    _$PlayerWonEventImpl _value,
    $Res Function(_$PlayerWonEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _$PlayerWonEventImpl(
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
class _$PlayerWonEventImpl implements PlayerWonEvent {
  const _$PlayerWonEventImpl({required this.playerId, final String? $type})
    : $type = $type ?? 'player_won';

  factory _$PlayerWonEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerWonEventImplFromJson(json);

  @override
  final String playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.playerWon(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerWonEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerWonEventImplCopyWith<_$PlayerWonEventImpl> get copyWith =>
      __$$PlayerWonEventImplCopyWithImpl<_$PlayerWonEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return playerWon(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return playerWon?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (playerWon != null) {
      return playerWon(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return playerWon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return playerWon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (playerWon != null) {
      return playerWon(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerWonEventImplToJson(this);
  }
}

abstract class PlayerWonEvent implements GameEvent {
  const factory PlayerWonEvent({required final String playerId}) =
      _$PlayerWonEventImpl;

  factory PlayerWonEvent.fromJson(Map<String, dynamic> json) =
      _$PlayerWonEventImpl.fromJson;

  String get playerId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerWonEventImplCopyWith<_$PlayerWonEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TurnChangedEventImplCopyWith<$Res> {
  factory _$$TurnChangedEventImplCopyWith(
    _$TurnChangedEventImpl value,
    $Res Function(_$TurnChangedEventImpl) then,
  ) = __$$TurnChangedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String playerId});
}

/// @nodoc
class __$$TurnChangedEventImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$TurnChangedEventImpl>
    implements _$$TurnChangedEventImplCopyWith<$Res> {
  __$$TurnChangedEventImplCopyWithImpl(
    _$TurnChangedEventImpl _value,
    $Res Function(_$TurnChangedEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? playerId = null}) {
    return _then(
      _$TurnChangedEventImpl(
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
class _$TurnChangedEventImpl implements TurnChangedEvent {
  const _$TurnChangedEventImpl({required this.playerId, final String? $type})
    : $type = $type ?? 'turn_changed';

  factory _$TurnChangedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnChangedEventImplFromJson(json);

  @override
  final String playerId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'GameEvent.turnChanged(playerId: $playerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TurnChangedEventImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerId);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnChangedEventImplCopyWith<_$TurnChangedEventImpl> get copyWith =>
      __$$TurnChangedEventImplCopyWithImpl<_$TurnChangedEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String playerId, int value) diceRolled,
    required TResult Function(String tokenId, int from, int to) tokenMoved,
    required TResult Function(String tokenId) tokenUnlocked,
    required TResult Function(String attackerTokenId, String victimTokenId)
    captured,
    required TResult Function(String playerId) sixRolled,
    required TResult Function(String playerId) threeSixesPenalty,
    required TResult Function(String playerId, int delta, int total)
    momentumChanged,
    required TResult Function(String playerId, PowerType power) powerUsed,
    required TResult Function(String playerId) playerWon,
    required TResult Function(String playerId) turnChanged,
  }) {
    return turnChanged(playerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String playerId, int value)? diceRolled,
    TResult? Function(String tokenId, int from, int to)? tokenMoved,
    TResult? Function(String tokenId)? tokenUnlocked,
    TResult? Function(String attackerTokenId, String victimTokenId)? captured,
    TResult? Function(String playerId)? sixRolled,
    TResult? Function(String playerId)? threeSixesPenalty,
    TResult? Function(String playerId, int delta, int total)? momentumChanged,
    TResult? Function(String playerId, PowerType power)? powerUsed,
    TResult? Function(String playerId)? playerWon,
    TResult? Function(String playerId)? turnChanged,
  }) {
    return turnChanged?.call(playerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String playerId, int value)? diceRolled,
    TResult Function(String tokenId, int from, int to)? tokenMoved,
    TResult Function(String tokenId)? tokenUnlocked,
    TResult Function(String attackerTokenId, String victimTokenId)? captured,
    TResult Function(String playerId)? sixRolled,
    TResult Function(String playerId)? threeSixesPenalty,
    TResult Function(String playerId, int delta, int total)? momentumChanged,
    TResult Function(String playerId, PowerType power)? powerUsed,
    TResult Function(String playerId)? playerWon,
    TResult Function(String playerId)? turnChanged,
    required TResult orElse(),
  }) {
    if (turnChanged != null) {
      return turnChanged(playerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiceRolledEvent value) diceRolled,
    required TResult Function(TokenMovedEvent value) tokenMoved,
    required TResult Function(TokenUnlockedEvent value) tokenUnlocked,
    required TResult Function(CapturedEvent value) captured,
    required TResult Function(SixRolledEvent value) sixRolled,
    required TResult Function(ThreeSixesPenaltyEvent value) threeSixesPenalty,
    required TResult Function(MomentumChangedEvent value) momentumChanged,
    required TResult Function(PowerUsedEvent value) powerUsed,
    required TResult Function(PlayerWonEvent value) playerWon,
    required TResult Function(TurnChangedEvent value) turnChanged,
  }) {
    return turnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiceRolledEvent value)? diceRolled,
    TResult? Function(TokenMovedEvent value)? tokenMoved,
    TResult? Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult? Function(CapturedEvent value)? captured,
    TResult? Function(SixRolledEvent value)? sixRolled,
    TResult? Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult? Function(MomentumChangedEvent value)? momentumChanged,
    TResult? Function(PowerUsedEvent value)? powerUsed,
    TResult? Function(PlayerWonEvent value)? playerWon,
    TResult? Function(TurnChangedEvent value)? turnChanged,
  }) {
    return turnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiceRolledEvent value)? diceRolled,
    TResult Function(TokenMovedEvent value)? tokenMoved,
    TResult Function(TokenUnlockedEvent value)? tokenUnlocked,
    TResult Function(CapturedEvent value)? captured,
    TResult Function(SixRolledEvent value)? sixRolled,
    TResult Function(ThreeSixesPenaltyEvent value)? threeSixesPenalty,
    TResult Function(MomentumChangedEvent value)? momentumChanged,
    TResult Function(PowerUsedEvent value)? powerUsed,
    TResult Function(PlayerWonEvent value)? playerWon,
    TResult Function(TurnChangedEvent value)? turnChanged,
    required TResult orElse(),
  }) {
    if (turnChanged != null) {
      return turnChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnChangedEventImplToJson(this);
  }
}

abstract class TurnChangedEvent implements GameEvent {
  const factory TurnChangedEvent({required final String playerId}) =
      _$TurnChangedEventImpl;

  factory TurnChangedEvent.fromJson(Map<String, dynamic> json) =
      _$TurnChangedEventImpl.fromJson;

  String get playerId;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TurnChangedEventImplCopyWith<_$TurnChangedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
