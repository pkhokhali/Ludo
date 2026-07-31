// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameConfig _$GameConfigFromJson(Map<String, dynamic> json) {
  return _GameConfig.fromJson(json);
}

/// @nodoc
mixin _$GameConfig {
  GameMode get mode => throw _privateConstructorUsedError;
  int get playerCount => throw _privateConstructorUsedError;
  List<PlayerSlotConfig> get slots => throw _privateConstructorUsedError;
  RuleConfig? get ruleOverrides => throw _privateConstructorUsedError;
  bool get turnTimerEnabled => throw _privateConstructorUsedError;
  int get turnTimerSeconds => throw _privateConstructorUsedError;

  /// Serializes this GameConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameConfigCopyWith<GameConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameConfigCopyWith<$Res> {
  factory $GameConfigCopyWith(
    GameConfig value,
    $Res Function(GameConfig) then,
  ) = _$GameConfigCopyWithImpl<$Res, GameConfig>;
  @useResult
  $Res call({
    GameMode mode,
    int playerCount,
    List<PlayerSlotConfig> slots,
    RuleConfig? ruleOverrides,
    bool turnTimerEnabled,
    int turnTimerSeconds,
  });

  $RuleConfigCopyWith<$Res>? get ruleOverrides;
}

/// @nodoc
class _$GameConfigCopyWithImpl<$Res, $Val extends GameConfig>
    implements $GameConfigCopyWith<$Res> {
  _$GameConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? playerCount = null,
    Object? slots = null,
    Object? ruleOverrides = freezed,
    Object? turnTimerEnabled = null,
    Object? turnTimerSeconds = null,
  }) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as GameMode,
            playerCount: null == playerCount
                ? _value.playerCount
                : playerCount // ignore: cast_nullable_to_non_nullable
                      as int,
            slots: null == slots
                ? _value.slots
                : slots // ignore: cast_nullable_to_non_nullable
                      as List<PlayerSlotConfig>,
            ruleOverrides: freezed == ruleOverrides
                ? _value.ruleOverrides
                : ruleOverrides // ignore: cast_nullable_to_non_nullable
                      as RuleConfig?,
            turnTimerEnabled: null == turnTimerEnabled
                ? _value.turnTimerEnabled
                : turnTimerEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            turnTimerSeconds: null == turnTimerSeconds
                ? _value.turnTimerSeconds
                : turnTimerSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleConfigCopyWith<$Res>? get ruleOverrides {
    if (_value.ruleOverrides == null) {
      return null;
    }

    return $RuleConfigCopyWith<$Res>(_value.ruleOverrides!, (value) {
      return _then(_value.copyWith(ruleOverrides: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameConfigImplCopyWith<$Res>
    implements $GameConfigCopyWith<$Res> {
  factory _$$GameConfigImplCopyWith(
    _$GameConfigImpl value,
    $Res Function(_$GameConfigImpl) then,
  ) = __$$GameConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    GameMode mode,
    int playerCount,
    List<PlayerSlotConfig> slots,
    RuleConfig? ruleOverrides,
    bool turnTimerEnabled,
    int turnTimerSeconds,
  });

  @override
  $RuleConfigCopyWith<$Res>? get ruleOverrides;
}

/// @nodoc
class __$$GameConfigImplCopyWithImpl<$Res>
    extends _$GameConfigCopyWithImpl<$Res, _$GameConfigImpl>
    implements _$$GameConfigImplCopyWith<$Res> {
  __$$GameConfigImplCopyWithImpl(
    _$GameConfigImpl _value,
    $Res Function(_$GameConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? playerCount = null,
    Object? slots = null,
    Object? ruleOverrides = freezed,
    Object? turnTimerEnabled = null,
    Object? turnTimerSeconds = null,
  }) {
    return _then(
      _$GameConfigImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as GameMode,
        playerCount: null == playerCount
            ? _value.playerCount
            : playerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        slots: null == slots
            ? _value._slots
            : slots // ignore: cast_nullable_to_non_nullable
                  as List<PlayerSlotConfig>,
        ruleOverrides: freezed == ruleOverrides
            ? _value.ruleOverrides
            : ruleOverrides // ignore: cast_nullable_to_non_nullable
                  as RuleConfig?,
        turnTimerEnabled: null == turnTimerEnabled
            ? _value.turnTimerEnabled
            : turnTimerEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        turnTimerSeconds: null == turnTimerSeconds
            ? _value.turnTimerSeconds
            : turnTimerSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameConfigImpl implements _GameConfig {
  const _$GameConfigImpl({
    required this.mode,
    this.playerCount = 4,
    final List<PlayerSlotConfig> slots = const [],
    this.ruleOverrides,
    this.turnTimerEnabled = false,
    this.turnTimerSeconds = 30,
  }) : _slots = slots;

  factory _$GameConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameConfigImplFromJson(json);

  @override
  final GameMode mode;
  @override
  @JsonKey()
  final int playerCount;
  final List<PlayerSlotConfig> _slots;
  @override
  @JsonKey()
  List<PlayerSlotConfig> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  final RuleConfig? ruleOverrides;
  @override
  @JsonKey()
  final bool turnTimerEnabled;
  @override
  @JsonKey()
  final int turnTimerSeconds;

  @override
  String toString() {
    return 'GameConfig(mode: $mode, playerCount: $playerCount, slots: $slots, ruleOverrides: $ruleOverrides, turnTimerEnabled: $turnTimerEnabled, turnTimerSeconds: $turnTimerSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameConfigImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.ruleOverrides, ruleOverrides) ||
                other.ruleOverrides == ruleOverrides) &&
            (identical(other.turnTimerEnabled, turnTimerEnabled) ||
                other.turnTimerEnabled == turnTimerEnabled) &&
            (identical(other.turnTimerSeconds, turnTimerSeconds) ||
                other.turnTimerSeconds == turnTimerSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mode,
    playerCount,
    const DeepCollectionEquality().hash(_slots),
    ruleOverrides,
    turnTimerEnabled,
    turnTimerSeconds,
  );

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
      __$$GameConfigImplCopyWithImpl<_$GameConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameConfigImplToJson(this);
  }
}

abstract class _GameConfig implements GameConfig {
  const factory _GameConfig({
    required final GameMode mode,
    final int playerCount,
    final List<PlayerSlotConfig> slots,
    final RuleConfig? ruleOverrides,
    final bool turnTimerEnabled,
    final int turnTimerSeconds,
  }) = _$GameConfigImpl;

  factory _GameConfig.fromJson(Map<String, dynamic> json) =
      _$GameConfigImpl.fromJson;

  @override
  GameMode get mode;
  @override
  int get playerCount;
  @override
  List<PlayerSlotConfig> get slots;
  @override
  RuleConfig? get ruleOverrides;
  @override
  bool get turnTimerEnabled;
  @override
  int get turnTimerSeconds;

  /// Create a copy of GameConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameConfigImplCopyWith<_$GameConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayerSlotConfig _$PlayerSlotConfigFromJson(Map<String, dynamic> json) {
  return _PlayerSlotConfig.fromJson(json);
}

/// @nodoc
mixin _$PlayerSlotConfig {
  PlayerSeat get seat => throw _privateConstructorUsedError;
  PlayerType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AiDifficulty? get aiDifficulty => throw _privateConstructorUsedError;

  /// Serializes this PlayerSlotConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerSlotConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerSlotConfigCopyWith<PlayerSlotConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerSlotConfigCopyWith<$Res> {
  factory $PlayerSlotConfigCopyWith(
    PlayerSlotConfig value,
    $Res Function(PlayerSlotConfig) then,
  ) = _$PlayerSlotConfigCopyWithImpl<$Res, PlayerSlotConfig>;
  @useResult
  $Res call({
    PlayerSeat seat,
    PlayerType type,
    String name,
    AiDifficulty? aiDifficulty,
  });
}

/// @nodoc
class _$PlayerSlotConfigCopyWithImpl<$Res, $Val extends PlayerSlotConfig>
    implements $PlayerSlotConfigCopyWith<$Res> {
  _$PlayerSlotConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerSlotConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seat = null,
    Object? type = null,
    Object? name = null,
    Object? aiDifficulty = freezed,
  }) {
    return _then(
      _value.copyWith(
            seat: null == seat
                ? _value.seat
                : seat // ignore: cast_nullable_to_non_nullable
                      as PlayerSeat,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PlayerType,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            aiDifficulty: freezed == aiDifficulty
                ? _value.aiDifficulty
                : aiDifficulty // ignore: cast_nullable_to_non_nullable
                      as AiDifficulty?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerSlotConfigImplCopyWith<$Res>
    implements $PlayerSlotConfigCopyWith<$Res> {
  factory _$$PlayerSlotConfigImplCopyWith(
    _$PlayerSlotConfigImpl value,
    $Res Function(_$PlayerSlotConfigImpl) then,
  ) = __$$PlayerSlotConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PlayerSeat seat,
    PlayerType type,
    String name,
    AiDifficulty? aiDifficulty,
  });
}

/// @nodoc
class __$$PlayerSlotConfigImplCopyWithImpl<$Res>
    extends _$PlayerSlotConfigCopyWithImpl<$Res, _$PlayerSlotConfigImpl>
    implements _$$PlayerSlotConfigImplCopyWith<$Res> {
  __$$PlayerSlotConfigImplCopyWithImpl(
    _$PlayerSlotConfigImpl _value,
    $Res Function(_$PlayerSlotConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerSlotConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seat = null,
    Object? type = null,
    Object? name = null,
    Object? aiDifficulty = freezed,
  }) {
    return _then(
      _$PlayerSlotConfigImpl(
        seat: null == seat
            ? _value.seat
            : seat // ignore: cast_nullable_to_non_nullable
                  as PlayerSeat,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        aiDifficulty: freezed == aiDifficulty
            ? _value.aiDifficulty
            : aiDifficulty // ignore: cast_nullable_to_non_nullable
                  as AiDifficulty?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerSlotConfigImpl implements _PlayerSlotConfig {
  const _$PlayerSlotConfigImpl({
    required this.seat,
    required this.type,
    this.name = 'Player',
    this.aiDifficulty,
  });

  factory _$PlayerSlotConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerSlotConfigImplFromJson(json);

  @override
  final PlayerSeat seat;
  @override
  final PlayerType type;
  @override
  @JsonKey()
  final String name;
  @override
  final AiDifficulty? aiDifficulty;

  @override
  String toString() {
    return 'PlayerSlotConfig(seat: $seat, type: $type, name: $name, aiDifficulty: $aiDifficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerSlotConfigImpl &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.aiDifficulty, aiDifficulty) ||
                other.aiDifficulty == aiDifficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, seat, type, name, aiDifficulty);

  /// Create a copy of PlayerSlotConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerSlotConfigImplCopyWith<_$PlayerSlotConfigImpl> get copyWith =>
      __$$PlayerSlotConfigImplCopyWithImpl<_$PlayerSlotConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerSlotConfigImplToJson(this);
  }
}

abstract class _PlayerSlotConfig implements PlayerSlotConfig {
  const factory _PlayerSlotConfig({
    required final PlayerSeat seat,
    required final PlayerType type,
    final String name,
    final AiDifficulty? aiDifficulty,
  }) = _$PlayerSlotConfigImpl;

  factory _PlayerSlotConfig.fromJson(Map<String, dynamic> json) =
      _$PlayerSlotConfigImpl.fromJson;

  @override
  PlayerSeat get seat;
  @override
  PlayerType get type;
  @override
  String get name;
  @override
  AiDifficulty? get aiDifficulty;

  /// Create a copy of PlayerSlotConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerSlotConfigImplCopyWith<_$PlayerSlotConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
