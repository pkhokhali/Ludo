// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RuleConfig _$RuleConfigFromJson(Map<String, dynamic> json) {
  return _RuleConfig.fromJson(json);
}

/// @nodoc
mixin _$RuleConfig {
  ClassicRules get classic => throw _privateConstructorUsedError;
  PowerRules get power => throw _privateConstructorUsedError;

  /// Serializes this RuleConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleConfigCopyWith<RuleConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleConfigCopyWith<$Res> {
  factory $RuleConfigCopyWith(
    RuleConfig value,
    $Res Function(RuleConfig) then,
  ) = _$RuleConfigCopyWithImpl<$Res, RuleConfig>;
  @useResult
  $Res call({ClassicRules classic, PowerRules power});

  $ClassicRulesCopyWith<$Res> get classic;
  $PowerRulesCopyWith<$Res> get power;
}

/// @nodoc
class _$RuleConfigCopyWithImpl<$Res, $Val extends RuleConfig>
    implements $RuleConfigCopyWith<$Res> {
  _$RuleConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? classic = null, Object? power = null}) {
    return _then(
      _value.copyWith(
            classic: null == classic
                ? _value.classic
                : classic // ignore: cast_nullable_to_non_nullable
                      as ClassicRules,
            power: null == power
                ? _value.power
                : power // ignore: cast_nullable_to_non_nullable
                      as PowerRules,
          )
          as $Val,
    );
  }

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClassicRulesCopyWith<$Res> get classic {
    return $ClassicRulesCopyWith<$Res>(_value.classic, (value) {
      return _then(_value.copyWith(classic: value) as $Val);
    });
  }

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PowerRulesCopyWith<$Res> get power {
    return $PowerRulesCopyWith<$Res>(_value.power, (value) {
      return _then(_value.copyWith(power: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RuleConfigImplCopyWith<$Res>
    implements $RuleConfigCopyWith<$Res> {
  factory _$$RuleConfigImplCopyWith(
    _$RuleConfigImpl value,
    $Res Function(_$RuleConfigImpl) then,
  ) = __$$RuleConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClassicRules classic, PowerRules power});

  @override
  $ClassicRulesCopyWith<$Res> get classic;
  @override
  $PowerRulesCopyWith<$Res> get power;
}

/// @nodoc
class __$$RuleConfigImplCopyWithImpl<$Res>
    extends _$RuleConfigCopyWithImpl<$Res, _$RuleConfigImpl>
    implements _$$RuleConfigImplCopyWith<$Res> {
  __$$RuleConfigImplCopyWithImpl(
    _$RuleConfigImpl _value,
    $Res Function(_$RuleConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? classic = null, Object? power = null}) {
    return _then(
      _$RuleConfigImpl(
        classic: null == classic
            ? _value.classic
            : classic // ignore: cast_nullable_to_non_nullable
                  as ClassicRules,
        power: null == power
            ? _value.power
            : power // ignore: cast_nullable_to_non_nullable
                  as PowerRules,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RuleConfigImpl implements _RuleConfig {
  const _$RuleConfigImpl({required this.classic, required this.power});

  factory _$RuleConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuleConfigImplFromJson(json);

  @override
  final ClassicRules classic;
  @override
  final PowerRules power;

  @override
  String toString() {
    return 'RuleConfig(classic: $classic, power: $power)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleConfigImpl &&
            (identical(other.classic, classic) || other.classic == classic) &&
            (identical(other.power, power) || other.power == power));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, classic, power);

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleConfigImplCopyWith<_$RuleConfigImpl> get copyWith =>
      __$$RuleConfigImplCopyWithImpl<_$RuleConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuleConfigImplToJson(this);
  }
}

abstract class _RuleConfig implements RuleConfig {
  const factory _RuleConfig({
    required final ClassicRules classic,
    required final PowerRules power,
  }) = _$RuleConfigImpl;

  factory _RuleConfig.fromJson(Map<String, dynamic> json) =
      _$RuleConfigImpl.fromJson;

  @override
  ClassicRules get classic;
  @override
  PowerRules get power;

  /// Create a copy of RuleConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleConfigImplCopyWith<_$RuleConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClassicRules _$ClassicRulesFromJson(Map<String, dynamic> json) {
  return _ClassicRules.fromJson(json);
}

/// @nodoc
mixin _$ClassicRules {
  int get unlockRoll => throw _privateConstructorUsedError;
  bool get extraTurnOnSix => throw _privateConstructorUsedError;
  bool get threeSixesRule => throw _privateConstructorUsedError;
  bool get exactFinish => throw _privateConstructorUsedError;
  bool get captureEnabled => throw _privateConstructorUsedError;
  List<int> get safeCells => throw _privateConstructorUsedError;
  int get mainPathLength => throw _privateConstructorUsedError;
  int get homeStretchLength => throw _privateConstructorUsedError;
  int get maxConsecutiveSixes => throw _privateConstructorUsedError;

  /// Serializes this ClassicRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClassicRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClassicRulesCopyWith<ClassicRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassicRulesCopyWith<$Res> {
  factory $ClassicRulesCopyWith(
    ClassicRules value,
    $Res Function(ClassicRules) then,
  ) = _$ClassicRulesCopyWithImpl<$Res, ClassicRules>;
  @useResult
  $Res call({
    int unlockRoll,
    bool extraTurnOnSix,
    bool threeSixesRule,
    bool exactFinish,
    bool captureEnabled,
    List<int> safeCells,
    int mainPathLength,
    int homeStretchLength,
    int maxConsecutiveSixes,
  });
}

/// @nodoc
class _$ClassicRulesCopyWithImpl<$Res, $Val extends ClassicRules>
    implements $ClassicRulesCopyWith<$Res> {
  _$ClassicRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClassicRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlockRoll = null,
    Object? extraTurnOnSix = null,
    Object? threeSixesRule = null,
    Object? exactFinish = null,
    Object? captureEnabled = null,
    Object? safeCells = null,
    Object? mainPathLength = null,
    Object? homeStretchLength = null,
    Object? maxConsecutiveSixes = null,
  }) {
    return _then(
      _value.copyWith(
            unlockRoll: null == unlockRoll
                ? _value.unlockRoll
                : unlockRoll // ignore: cast_nullable_to_non_nullable
                      as int,
            extraTurnOnSix: null == extraTurnOnSix
                ? _value.extraTurnOnSix
                : extraTurnOnSix // ignore: cast_nullable_to_non_nullable
                      as bool,
            threeSixesRule: null == threeSixesRule
                ? _value.threeSixesRule
                : threeSixesRule // ignore: cast_nullable_to_non_nullable
                      as bool,
            exactFinish: null == exactFinish
                ? _value.exactFinish
                : exactFinish // ignore: cast_nullable_to_non_nullable
                      as bool,
            captureEnabled: null == captureEnabled
                ? _value.captureEnabled
                : captureEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            safeCells: null == safeCells
                ? _value.safeCells
                : safeCells // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            mainPathLength: null == mainPathLength
                ? _value.mainPathLength
                : mainPathLength // ignore: cast_nullable_to_non_nullable
                      as int,
            homeStretchLength: null == homeStretchLength
                ? _value.homeStretchLength
                : homeStretchLength // ignore: cast_nullable_to_non_nullable
                      as int,
            maxConsecutiveSixes: null == maxConsecutiveSixes
                ? _value.maxConsecutiveSixes
                : maxConsecutiveSixes // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClassicRulesImplCopyWith<$Res>
    implements $ClassicRulesCopyWith<$Res> {
  factory _$$ClassicRulesImplCopyWith(
    _$ClassicRulesImpl value,
    $Res Function(_$ClassicRulesImpl) then,
  ) = __$$ClassicRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int unlockRoll,
    bool extraTurnOnSix,
    bool threeSixesRule,
    bool exactFinish,
    bool captureEnabled,
    List<int> safeCells,
    int mainPathLength,
    int homeStretchLength,
    int maxConsecutiveSixes,
  });
}

/// @nodoc
class __$$ClassicRulesImplCopyWithImpl<$Res>
    extends _$ClassicRulesCopyWithImpl<$Res, _$ClassicRulesImpl>
    implements _$$ClassicRulesImplCopyWith<$Res> {
  __$$ClassicRulesImplCopyWithImpl(
    _$ClassicRulesImpl _value,
    $Res Function(_$ClassicRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClassicRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unlockRoll = null,
    Object? extraTurnOnSix = null,
    Object? threeSixesRule = null,
    Object? exactFinish = null,
    Object? captureEnabled = null,
    Object? safeCells = null,
    Object? mainPathLength = null,
    Object? homeStretchLength = null,
    Object? maxConsecutiveSixes = null,
  }) {
    return _then(
      _$ClassicRulesImpl(
        unlockRoll: null == unlockRoll
            ? _value.unlockRoll
            : unlockRoll // ignore: cast_nullable_to_non_nullable
                  as int,
        extraTurnOnSix: null == extraTurnOnSix
            ? _value.extraTurnOnSix
            : extraTurnOnSix // ignore: cast_nullable_to_non_nullable
                  as bool,
        threeSixesRule: null == threeSixesRule
            ? _value.threeSixesRule
            : threeSixesRule // ignore: cast_nullable_to_non_nullable
                  as bool,
        exactFinish: null == exactFinish
            ? _value.exactFinish
            : exactFinish // ignore: cast_nullable_to_non_nullable
                  as bool,
        captureEnabled: null == captureEnabled
            ? _value.captureEnabled
            : captureEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        safeCells: null == safeCells
            ? _value._safeCells
            : safeCells // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        mainPathLength: null == mainPathLength
            ? _value.mainPathLength
            : mainPathLength // ignore: cast_nullable_to_non_nullable
                  as int,
        homeStretchLength: null == homeStretchLength
            ? _value.homeStretchLength
            : homeStretchLength // ignore: cast_nullable_to_non_nullable
                  as int,
        maxConsecutiveSixes: null == maxConsecutiveSixes
            ? _value.maxConsecutiveSixes
            : maxConsecutiveSixes // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClassicRulesImpl implements _ClassicRules {
  const _$ClassicRulesImpl({
    this.unlockRoll = 6,
    this.extraTurnOnSix = true,
    this.threeSixesRule = true,
    this.exactFinish = true,
    this.captureEnabled = true,
    final List<int> safeCells = const [1, 9, 14, 22, 27, 35, 40, 48],
    this.mainPathLength = 52,
    this.homeStretchLength = 5,
    this.maxConsecutiveSixes = 3,
  }) : _safeCells = safeCells;

  factory _$ClassicRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClassicRulesImplFromJson(json);

  @override
  @JsonKey()
  final int unlockRoll;
  @override
  @JsonKey()
  final bool extraTurnOnSix;
  @override
  @JsonKey()
  final bool threeSixesRule;
  @override
  @JsonKey()
  final bool exactFinish;
  @override
  @JsonKey()
  final bool captureEnabled;
  final List<int> _safeCells;
  @override
  @JsonKey()
  List<int> get safeCells {
    if (_safeCells is EqualUnmodifiableListView) return _safeCells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safeCells);
  }

  @override
  @JsonKey()
  final int mainPathLength;
  @override
  @JsonKey()
  final int homeStretchLength;
  @override
  @JsonKey()
  final int maxConsecutiveSixes;

  @override
  String toString() {
    return 'ClassicRules(unlockRoll: $unlockRoll, extraTurnOnSix: $extraTurnOnSix, threeSixesRule: $threeSixesRule, exactFinish: $exactFinish, captureEnabled: $captureEnabled, safeCells: $safeCells, mainPathLength: $mainPathLength, homeStretchLength: $homeStretchLength, maxConsecutiveSixes: $maxConsecutiveSixes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClassicRulesImpl &&
            (identical(other.unlockRoll, unlockRoll) ||
                other.unlockRoll == unlockRoll) &&
            (identical(other.extraTurnOnSix, extraTurnOnSix) ||
                other.extraTurnOnSix == extraTurnOnSix) &&
            (identical(other.threeSixesRule, threeSixesRule) ||
                other.threeSixesRule == threeSixesRule) &&
            (identical(other.exactFinish, exactFinish) ||
                other.exactFinish == exactFinish) &&
            (identical(other.captureEnabled, captureEnabled) ||
                other.captureEnabled == captureEnabled) &&
            const DeepCollectionEquality().equals(
              other._safeCells,
              _safeCells,
            ) &&
            (identical(other.mainPathLength, mainPathLength) ||
                other.mainPathLength == mainPathLength) &&
            (identical(other.homeStretchLength, homeStretchLength) ||
                other.homeStretchLength == homeStretchLength) &&
            (identical(other.maxConsecutiveSixes, maxConsecutiveSixes) ||
                other.maxConsecutiveSixes == maxConsecutiveSixes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    unlockRoll,
    extraTurnOnSix,
    threeSixesRule,
    exactFinish,
    captureEnabled,
    const DeepCollectionEquality().hash(_safeCells),
    mainPathLength,
    homeStretchLength,
    maxConsecutiveSixes,
  );

  /// Create a copy of ClassicRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClassicRulesImplCopyWith<_$ClassicRulesImpl> get copyWith =>
      __$$ClassicRulesImplCopyWithImpl<_$ClassicRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClassicRulesImplToJson(this);
  }
}

abstract class _ClassicRules implements ClassicRules {
  const factory _ClassicRules({
    final int unlockRoll,
    final bool extraTurnOnSix,
    final bool threeSixesRule,
    final bool exactFinish,
    final bool captureEnabled,
    final List<int> safeCells,
    final int mainPathLength,
    final int homeStretchLength,
    final int maxConsecutiveSixes,
  }) = _$ClassicRulesImpl;

  factory _ClassicRules.fromJson(Map<String, dynamic> json) =
      _$ClassicRulesImpl.fromJson;

  @override
  int get unlockRoll;
  @override
  bool get extraTurnOnSix;
  @override
  bool get threeSixesRule;
  @override
  bool get exactFinish;
  @override
  bool get captureEnabled;
  @override
  List<int> get safeCells;
  @override
  int get mainPathLength;
  @override
  int get homeStretchLength;
  @override
  int get maxConsecutiveSixes;

  /// Create a copy of ClassicRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClassicRulesImplCopyWith<_$ClassicRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PowerRules _$PowerRulesFromJson(Map<String, dynamic> json) {
  return _PowerRules.fromJson(json);
}

/// @nodoc
mixin _$PowerRules {
  bool get enabled => throw _privateConstructorUsedError;
  int get momentumMax => throw _privateConstructorUsedError;
  MomentumEarn get earn => throw _privateConstructorUsedError;
  MomentumSpend get spend => throw _privateConstructorUsedError;
  PowerFeatures get features => throw _privateConstructorUsedError;

  /// Serializes this PowerRules to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PowerRulesCopyWith<PowerRules> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerRulesCopyWith<$Res> {
  factory $PowerRulesCopyWith(
    PowerRules value,
    $Res Function(PowerRules) then,
  ) = _$PowerRulesCopyWithImpl<$Res, PowerRules>;
  @useResult
  $Res call({
    bool enabled,
    int momentumMax,
    MomentumEarn earn,
    MomentumSpend spend,
    PowerFeatures features,
  });

  $MomentumEarnCopyWith<$Res> get earn;
  $MomentumSpendCopyWith<$Res> get spend;
  $PowerFeaturesCopyWith<$Res> get features;
}

/// @nodoc
class _$PowerRulesCopyWithImpl<$Res, $Val extends PowerRules>
    implements $PowerRulesCopyWith<$Res> {
  _$PowerRulesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? momentumMax = null,
    Object? earn = null,
    Object? spend = null,
    Object? features = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            momentumMax: null == momentumMax
                ? _value.momentumMax
                : momentumMax // ignore: cast_nullable_to_non_nullable
                      as int,
            earn: null == earn
                ? _value.earn
                : earn // ignore: cast_nullable_to_non_nullable
                      as MomentumEarn,
            spend: null == spend
                ? _value.spend
                : spend // ignore: cast_nullable_to_non_nullable
                      as MomentumSpend,
            features: null == features
                ? _value.features
                : features // ignore: cast_nullable_to_non_nullable
                      as PowerFeatures,
          )
          as $Val,
    );
  }

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MomentumEarnCopyWith<$Res> get earn {
    return $MomentumEarnCopyWith<$Res>(_value.earn, (value) {
      return _then(_value.copyWith(earn: value) as $Val);
    });
  }

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MomentumSpendCopyWith<$Res> get spend {
    return $MomentumSpendCopyWith<$Res>(_value.spend, (value) {
      return _then(_value.copyWith(spend: value) as $Val);
    });
  }

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PowerFeaturesCopyWith<$Res> get features {
    return $PowerFeaturesCopyWith<$Res>(_value.features, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PowerRulesImplCopyWith<$Res>
    implements $PowerRulesCopyWith<$Res> {
  factory _$$PowerRulesImplCopyWith(
    _$PowerRulesImpl value,
    $Res Function(_$PowerRulesImpl) then,
  ) = __$$PowerRulesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    int momentumMax,
    MomentumEarn earn,
    MomentumSpend spend,
    PowerFeatures features,
  });

  @override
  $MomentumEarnCopyWith<$Res> get earn;
  @override
  $MomentumSpendCopyWith<$Res> get spend;
  @override
  $PowerFeaturesCopyWith<$Res> get features;
}

/// @nodoc
class __$$PowerRulesImplCopyWithImpl<$Res>
    extends _$PowerRulesCopyWithImpl<$Res, _$PowerRulesImpl>
    implements _$$PowerRulesImplCopyWith<$Res> {
  __$$PowerRulesImplCopyWithImpl(
    _$PowerRulesImpl _value,
    $Res Function(_$PowerRulesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? momentumMax = null,
    Object? earn = null,
    Object? spend = null,
    Object? features = null,
  }) {
    return _then(
      _$PowerRulesImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        momentumMax: null == momentumMax
            ? _value.momentumMax
            : momentumMax // ignore: cast_nullable_to_non_nullable
                  as int,
        earn: null == earn
            ? _value.earn
            : earn // ignore: cast_nullable_to_non_nullable
                  as MomentumEarn,
        spend: null == spend
            ? _value.spend
            : spend // ignore: cast_nullable_to_non_nullable
                  as MomentumSpend,
        features: null == features
            ? _value.features
            : features // ignore: cast_nullable_to_non_nullable
                  as PowerFeatures,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PowerRulesImpl implements _PowerRules {
  const _$PowerRulesImpl({
    this.enabled = true,
    this.momentumMax = 10,
    required this.earn,
    required this.spend,
    required this.features,
  });

  factory _$PowerRulesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PowerRulesImplFromJson(json);

  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final int momentumMax;
  @override
  final MomentumEarn earn;
  @override
  final MomentumSpend spend;
  @override
  final PowerFeatures features;

  @override
  String toString() {
    return 'PowerRules(enabled: $enabled, momentumMax: $momentumMax, earn: $earn, spend: $spend, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerRulesImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.momentumMax, momentumMax) ||
                other.momentumMax == momentumMax) &&
            (identical(other.earn, earn) || other.earn == earn) &&
            (identical(other.spend, spend) || other.spend == spend) &&
            (identical(other.features, features) ||
                other.features == features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, enabled, momentumMax, earn, spend, features);

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerRulesImplCopyWith<_$PowerRulesImpl> get copyWith =>
      __$$PowerRulesImplCopyWithImpl<_$PowerRulesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PowerRulesImplToJson(this);
  }
}

abstract class _PowerRules implements PowerRules {
  const factory _PowerRules({
    final bool enabled,
    final int momentumMax,
    required final MomentumEarn earn,
    required final MomentumSpend spend,
    required final PowerFeatures features,
  }) = _$PowerRulesImpl;

  factory _PowerRules.fromJson(Map<String, dynamic> json) =
      _$PowerRulesImpl.fromJson;

  @override
  bool get enabled;
  @override
  int get momentumMax;
  @override
  MomentumEarn get earn;
  @override
  MomentumSpend get spend;
  @override
  PowerFeatures get features;

  /// Create a copy of PowerRules
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerRulesImplCopyWith<_$PowerRulesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MomentumEarn _$MomentumEarnFromJson(Map<String, dynamic> json) {
  return _MomentumEarn.fromJson(json);
}

/// @nodoc
mixin _$MomentumEarn {
  int get capture => throw _privateConstructorUsedError;
  int get reachHome => throw _privateConstructorUsedError;
  int get completeLap => throw _privateConstructorUsedError;
  int get safeStar => throw _privateConstructorUsedError;
  int get destroyShield => throw _privateConstructorUsedError;

  /// Serializes this MomentumEarn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MomentumEarn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MomentumEarnCopyWith<MomentumEarn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentumEarnCopyWith<$Res> {
  factory $MomentumEarnCopyWith(
    MomentumEarn value,
    $Res Function(MomentumEarn) then,
  ) = _$MomentumEarnCopyWithImpl<$Res, MomentumEarn>;
  @useResult
  $Res call({
    int capture,
    int reachHome,
    int completeLap,
    int safeStar,
    int destroyShield,
  });
}

/// @nodoc
class _$MomentumEarnCopyWithImpl<$Res, $Val extends MomentumEarn>
    implements $MomentumEarnCopyWith<$Res> {
  _$MomentumEarnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MomentumEarn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capture = null,
    Object? reachHome = null,
    Object? completeLap = null,
    Object? safeStar = null,
    Object? destroyShield = null,
  }) {
    return _then(
      _value.copyWith(
            capture: null == capture
                ? _value.capture
                : capture // ignore: cast_nullable_to_non_nullable
                      as int,
            reachHome: null == reachHome
                ? _value.reachHome
                : reachHome // ignore: cast_nullable_to_non_nullable
                      as int,
            completeLap: null == completeLap
                ? _value.completeLap
                : completeLap // ignore: cast_nullable_to_non_nullable
                      as int,
            safeStar: null == safeStar
                ? _value.safeStar
                : safeStar // ignore: cast_nullable_to_non_nullable
                      as int,
            destroyShield: null == destroyShield
                ? _value.destroyShield
                : destroyShield // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MomentumEarnImplCopyWith<$Res>
    implements $MomentumEarnCopyWith<$Res> {
  factory _$$MomentumEarnImplCopyWith(
    _$MomentumEarnImpl value,
    $Res Function(_$MomentumEarnImpl) then,
  ) = __$$MomentumEarnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int capture,
    int reachHome,
    int completeLap,
    int safeStar,
    int destroyShield,
  });
}

/// @nodoc
class __$$MomentumEarnImplCopyWithImpl<$Res>
    extends _$MomentumEarnCopyWithImpl<$Res, _$MomentumEarnImpl>
    implements _$$MomentumEarnImplCopyWith<$Res> {
  __$$MomentumEarnImplCopyWithImpl(
    _$MomentumEarnImpl _value,
    $Res Function(_$MomentumEarnImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MomentumEarn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capture = null,
    Object? reachHome = null,
    Object? completeLap = null,
    Object? safeStar = null,
    Object? destroyShield = null,
  }) {
    return _then(
      _$MomentumEarnImpl(
        capture: null == capture
            ? _value.capture
            : capture // ignore: cast_nullable_to_non_nullable
                  as int,
        reachHome: null == reachHome
            ? _value.reachHome
            : reachHome // ignore: cast_nullable_to_non_nullable
                  as int,
        completeLap: null == completeLap
            ? _value.completeLap
            : completeLap // ignore: cast_nullable_to_non_nullable
                  as int,
        safeStar: null == safeStar
            ? _value.safeStar
            : safeStar // ignore: cast_nullable_to_non_nullable
                  as int,
        destroyShield: null == destroyShield
            ? _value.destroyShield
            : destroyShield // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MomentumEarnImpl implements _MomentumEarn {
  const _$MomentumEarnImpl({
    this.capture = 2,
    this.reachHome = 3,
    this.completeLap = 2,
    this.safeStar = 1,
    this.destroyShield = 3,
  });

  factory _$MomentumEarnImpl.fromJson(Map<String, dynamic> json) =>
      _$$MomentumEarnImplFromJson(json);

  @override
  @JsonKey()
  final int capture;
  @override
  @JsonKey()
  final int reachHome;
  @override
  @JsonKey()
  final int completeLap;
  @override
  @JsonKey()
  final int safeStar;
  @override
  @JsonKey()
  final int destroyShield;

  @override
  String toString() {
    return 'MomentumEarn(capture: $capture, reachHome: $reachHome, completeLap: $completeLap, safeStar: $safeStar, destroyShield: $destroyShield)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MomentumEarnImpl &&
            (identical(other.capture, capture) || other.capture == capture) &&
            (identical(other.reachHome, reachHome) ||
                other.reachHome == reachHome) &&
            (identical(other.completeLap, completeLap) ||
                other.completeLap == completeLap) &&
            (identical(other.safeStar, safeStar) ||
                other.safeStar == safeStar) &&
            (identical(other.destroyShield, destroyShield) ||
                other.destroyShield == destroyShield));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    capture,
    reachHome,
    completeLap,
    safeStar,
    destroyShield,
  );

  /// Create a copy of MomentumEarn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MomentumEarnImplCopyWith<_$MomentumEarnImpl> get copyWith =>
      __$$MomentumEarnImplCopyWithImpl<_$MomentumEarnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MomentumEarnImplToJson(this);
  }
}

abstract class _MomentumEarn implements MomentumEarn {
  const factory _MomentumEarn({
    final int capture,
    final int reachHome,
    final int completeLap,
    final int safeStar,
    final int destroyShield,
  }) = _$MomentumEarnImpl;

  factory _MomentumEarn.fromJson(Map<String, dynamic> json) =
      _$MomentumEarnImpl.fromJson;

  @override
  int get capture;
  @override
  int get reachHome;
  @override
  int get completeLap;
  @override
  int get safeStar;
  @override
  int get destroyShield;

  /// Create a copy of MomentumEarn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MomentumEarnImplCopyWith<_$MomentumEarnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MomentumSpend _$MomentumSpendFromJson(Map<String, dynamic> json) {
  return _MomentumSpend.fromJson(json);
}

/// @nodoc
mixin _$MomentumSpend {
  int get reverseMove => throw _privateConstructorUsedError;
  int get shield => throw _privateConstructorUsedError;
  int get goldenDice => throw _privateConstructorUsedError;
  int get breakBlockade => throw _privateConstructorUsedError;
  int get doubleMove => throw _privateConstructorUsedError;
  int get safeLanding => throw _privateConstructorUsedError;
  int get momentumBoost => throw _privateConstructorUsedError;
  int get reRoll => throw _privateConstructorUsedError;

  /// Serializes this MomentumSpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MomentumSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MomentumSpendCopyWith<MomentumSpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MomentumSpendCopyWith<$Res> {
  factory $MomentumSpendCopyWith(
    MomentumSpend value,
    $Res Function(MomentumSpend) then,
  ) = _$MomentumSpendCopyWithImpl<$Res, MomentumSpend>;
  @useResult
  $Res call({
    int reverseMove,
    int shield,
    int goldenDice,
    int breakBlockade,
    int doubleMove,
    int safeLanding,
    int momentumBoost,
    int reRoll,
  });
}

/// @nodoc
class _$MomentumSpendCopyWithImpl<$Res, $Val extends MomentumSpend>
    implements $MomentumSpendCopyWith<$Res> {
  _$MomentumSpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MomentumSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reverseMove = null,
    Object? shield = null,
    Object? goldenDice = null,
    Object? breakBlockade = null,
    Object? doubleMove = null,
    Object? safeLanding = null,
    Object? momentumBoost = null,
    Object? reRoll = null,
  }) {
    return _then(
      _value.copyWith(
            reverseMove: null == reverseMove
                ? _value.reverseMove
                : reverseMove // ignore: cast_nullable_to_non_nullable
                      as int,
            shield: null == shield
                ? _value.shield
                : shield // ignore: cast_nullable_to_non_nullable
                      as int,
            goldenDice: null == goldenDice
                ? _value.goldenDice
                : goldenDice // ignore: cast_nullable_to_non_nullable
                      as int,
            breakBlockade: null == breakBlockade
                ? _value.breakBlockade
                : breakBlockade // ignore: cast_nullable_to_non_nullable
                      as int,
            doubleMove: null == doubleMove
                ? _value.doubleMove
                : doubleMove // ignore: cast_nullable_to_non_nullable
                      as int,
            safeLanding: null == safeLanding
                ? _value.safeLanding
                : safeLanding // ignore: cast_nullable_to_non_nullable
                      as int,
            momentumBoost: null == momentumBoost
                ? _value.momentumBoost
                : momentumBoost // ignore: cast_nullable_to_non_nullable
                      as int,
            reRoll: null == reRoll
                ? _value.reRoll
                : reRoll // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MomentumSpendImplCopyWith<$Res>
    implements $MomentumSpendCopyWith<$Res> {
  factory _$$MomentumSpendImplCopyWith(
    _$MomentumSpendImpl value,
    $Res Function(_$MomentumSpendImpl) then,
  ) = __$$MomentumSpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int reverseMove,
    int shield,
    int goldenDice,
    int breakBlockade,
    int doubleMove,
    int safeLanding,
    int momentumBoost,
    int reRoll,
  });
}

/// @nodoc
class __$$MomentumSpendImplCopyWithImpl<$Res>
    extends _$MomentumSpendCopyWithImpl<$Res, _$MomentumSpendImpl>
    implements _$$MomentumSpendImplCopyWith<$Res> {
  __$$MomentumSpendImplCopyWithImpl(
    _$MomentumSpendImpl _value,
    $Res Function(_$MomentumSpendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MomentumSpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reverseMove = null,
    Object? shield = null,
    Object? goldenDice = null,
    Object? breakBlockade = null,
    Object? doubleMove = null,
    Object? safeLanding = null,
    Object? momentumBoost = null,
    Object? reRoll = null,
  }) {
    return _then(
      _$MomentumSpendImpl(
        reverseMove: null == reverseMove
            ? _value.reverseMove
            : reverseMove // ignore: cast_nullable_to_non_nullable
                  as int,
        shield: null == shield
            ? _value.shield
            : shield // ignore: cast_nullable_to_non_nullable
                  as int,
        goldenDice: null == goldenDice
            ? _value.goldenDice
            : goldenDice // ignore: cast_nullable_to_non_nullable
                  as int,
        breakBlockade: null == breakBlockade
            ? _value.breakBlockade
            : breakBlockade // ignore: cast_nullable_to_non_nullable
                  as int,
        doubleMove: null == doubleMove
            ? _value.doubleMove
            : doubleMove // ignore: cast_nullable_to_non_nullable
                  as int,
        safeLanding: null == safeLanding
            ? _value.safeLanding
            : safeLanding // ignore: cast_nullable_to_non_nullable
                  as int,
        momentumBoost: null == momentumBoost
            ? _value.momentumBoost
            : momentumBoost // ignore: cast_nullable_to_non_nullable
                  as int,
        reRoll: null == reRoll
            ? _value.reRoll
            : reRoll // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MomentumSpendImpl extends _MomentumSpend {
  const _$MomentumSpendImpl({
    this.reverseMove = 2,
    this.shield = 3,
    this.goldenDice = 4,
    this.breakBlockade = 3,
    this.doubleMove = 3,
    this.safeLanding = 2,
    this.momentumBoost = 2,
    this.reRoll = 2,
  }) : super._();

  factory _$MomentumSpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MomentumSpendImplFromJson(json);

  @override
  @JsonKey()
  final int reverseMove;
  @override
  @JsonKey()
  final int shield;
  @override
  @JsonKey()
  final int goldenDice;
  @override
  @JsonKey()
  final int breakBlockade;
  @override
  @JsonKey()
  final int doubleMove;
  @override
  @JsonKey()
  final int safeLanding;
  @override
  @JsonKey()
  final int momentumBoost;
  @override
  @JsonKey()
  final int reRoll;

  @override
  String toString() {
    return 'MomentumSpend(reverseMove: $reverseMove, shield: $shield, goldenDice: $goldenDice, breakBlockade: $breakBlockade, doubleMove: $doubleMove, safeLanding: $safeLanding, momentumBoost: $momentumBoost, reRoll: $reRoll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MomentumSpendImpl &&
            (identical(other.reverseMove, reverseMove) ||
                other.reverseMove == reverseMove) &&
            (identical(other.shield, shield) || other.shield == shield) &&
            (identical(other.goldenDice, goldenDice) ||
                other.goldenDice == goldenDice) &&
            (identical(other.breakBlockade, breakBlockade) ||
                other.breakBlockade == breakBlockade) &&
            (identical(other.doubleMove, doubleMove) ||
                other.doubleMove == doubleMove) &&
            (identical(other.safeLanding, safeLanding) ||
                other.safeLanding == safeLanding) &&
            (identical(other.momentumBoost, momentumBoost) ||
                other.momentumBoost == momentumBoost) &&
            (identical(other.reRoll, reRoll) || other.reRoll == reRoll));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reverseMove,
    shield,
    goldenDice,
    breakBlockade,
    doubleMove,
    safeLanding,
    momentumBoost,
    reRoll,
  );

  /// Create a copy of MomentumSpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MomentumSpendImplCopyWith<_$MomentumSpendImpl> get copyWith =>
      __$$MomentumSpendImplCopyWithImpl<_$MomentumSpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MomentumSpendImplToJson(this);
  }
}

abstract class _MomentumSpend extends MomentumSpend {
  const factory _MomentumSpend({
    final int reverseMove,
    final int shield,
    final int goldenDice,
    final int breakBlockade,
    final int doubleMove,
    final int safeLanding,
    final int momentumBoost,
    final int reRoll,
  }) = _$MomentumSpendImpl;
  const _MomentumSpend._() : super._();

  factory _MomentumSpend.fromJson(Map<String, dynamic> json) =
      _$MomentumSpendImpl.fromJson;

  @override
  int get reverseMove;
  @override
  int get shield;
  @override
  int get goldenDice;
  @override
  int get breakBlockade;
  @override
  int get doubleMove;
  @override
  int get safeLanding;
  @override
  int get momentumBoost;
  @override
  int get reRoll;

  /// Create a copy of MomentumSpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MomentumSpendImplCopyWith<_$MomentumSpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PowerFeatures _$PowerFeaturesFromJson(Map<String, dynamic> json) {
  return _PowerFeatures.fromJson(json);
}

/// @nodoc
mixin _$PowerFeatures {
  bool get shield => throw _privateConstructorUsedError;
  bool get portal => throw _privateConstructorUsedError;
  bool get goldenDice => throw _privateConstructorUsedError;
  bool get comboBonus => throw _privateConstructorUsedError;
  bool get momentum => throw _privateConstructorUsedError;
  bool get reverseMovement => throw _privateConstructorUsedError;
  bool get breakBlockade => throw _privateConstructorUsedError;
  bool get safeLanding => throw _privateConstructorUsedError;
  bool get doubleMove => throw _privateConstructorUsedError;
  bool get momentumBoost => throw _privateConstructorUsedError;

  /// Serializes this PowerFeatures to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PowerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PowerFeaturesCopyWith<PowerFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerFeaturesCopyWith<$Res> {
  factory $PowerFeaturesCopyWith(
    PowerFeatures value,
    $Res Function(PowerFeatures) then,
  ) = _$PowerFeaturesCopyWithImpl<$Res, PowerFeatures>;
  @useResult
  $Res call({
    bool shield,
    bool portal,
    bool goldenDice,
    bool comboBonus,
    bool momentum,
    bool reverseMovement,
    bool breakBlockade,
    bool safeLanding,
    bool doubleMove,
    bool momentumBoost,
  });
}

/// @nodoc
class _$PowerFeaturesCopyWithImpl<$Res, $Val extends PowerFeatures>
    implements $PowerFeaturesCopyWith<$Res> {
  _$PowerFeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PowerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shield = null,
    Object? portal = null,
    Object? goldenDice = null,
    Object? comboBonus = null,
    Object? momentum = null,
    Object? reverseMovement = null,
    Object? breakBlockade = null,
    Object? safeLanding = null,
    Object? doubleMove = null,
    Object? momentumBoost = null,
  }) {
    return _then(
      _value.copyWith(
            shield: null == shield
                ? _value.shield
                : shield // ignore: cast_nullable_to_non_nullable
                      as bool,
            portal: null == portal
                ? _value.portal
                : portal // ignore: cast_nullable_to_non_nullable
                      as bool,
            goldenDice: null == goldenDice
                ? _value.goldenDice
                : goldenDice // ignore: cast_nullable_to_non_nullable
                      as bool,
            comboBonus: null == comboBonus
                ? _value.comboBonus
                : comboBonus // ignore: cast_nullable_to_non_nullable
                      as bool,
            momentum: null == momentum
                ? _value.momentum
                : momentum // ignore: cast_nullable_to_non_nullable
                      as bool,
            reverseMovement: null == reverseMovement
                ? _value.reverseMovement
                : reverseMovement // ignore: cast_nullable_to_non_nullable
                      as bool,
            breakBlockade: null == breakBlockade
                ? _value.breakBlockade
                : breakBlockade // ignore: cast_nullable_to_non_nullable
                      as bool,
            safeLanding: null == safeLanding
                ? _value.safeLanding
                : safeLanding // ignore: cast_nullable_to_non_nullable
                      as bool,
            doubleMove: null == doubleMove
                ? _value.doubleMove
                : doubleMove // ignore: cast_nullable_to_non_nullable
                      as bool,
            momentumBoost: null == momentumBoost
                ? _value.momentumBoost
                : momentumBoost // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PowerFeaturesImplCopyWith<$Res>
    implements $PowerFeaturesCopyWith<$Res> {
  factory _$$PowerFeaturesImplCopyWith(
    _$PowerFeaturesImpl value,
    $Res Function(_$PowerFeaturesImpl) then,
  ) = __$$PowerFeaturesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool shield,
    bool portal,
    bool goldenDice,
    bool comboBonus,
    bool momentum,
    bool reverseMovement,
    bool breakBlockade,
    bool safeLanding,
    bool doubleMove,
    bool momentumBoost,
  });
}

/// @nodoc
class __$$PowerFeaturesImplCopyWithImpl<$Res>
    extends _$PowerFeaturesCopyWithImpl<$Res, _$PowerFeaturesImpl>
    implements _$$PowerFeaturesImplCopyWith<$Res> {
  __$$PowerFeaturesImplCopyWithImpl(
    _$PowerFeaturesImpl _value,
    $Res Function(_$PowerFeaturesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PowerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shield = null,
    Object? portal = null,
    Object? goldenDice = null,
    Object? comboBonus = null,
    Object? momentum = null,
    Object? reverseMovement = null,
    Object? breakBlockade = null,
    Object? safeLanding = null,
    Object? doubleMove = null,
    Object? momentumBoost = null,
  }) {
    return _then(
      _$PowerFeaturesImpl(
        shield: null == shield
            ? _value.shield
            : shield // ignore: cast_nullable_to_non_nullable
                  as bool,
        portal: null == portal
            ? _value.portal
            : portal // ignore: cast_nullable_to_non_nullable
                  as bool,
        goldenDice: null == goldenDice
            ? _value.goldenDice
            : goldenDice // ignore: cast_nullable_to_non_nullable
                  as bool,
        comboBonus: null == comboBonus
            ? _value.comboBonus
            : comboBonus // ignore: cast_nullable_to_non_nullable
                  as bool,
        momentum: null == momentum
            ? _value.momentum
            : momentum // ignore: cast_nullable_to_non_nullable
                  as bool,
        reverseMovement: null == reverseMovement
            ? _value.reverseMovement
            : reverseMovement // ignore: cast_nullable_to_non_nullable
                  as bool,
        breakBlockade: null == breakBlockade
            ? _value.breakBlockade
            : breakBlockade // ignore: cast_nullable_to_non_nullable
                  as bool,
        safeLanding: null == safeLanding
            ? _value.safeLanding
            : safeLanding // ignore: cast_nullable_to_non_nullable
                  as bool,
        doubleMove: null == doubleMove
            ? _value.doubleMove
            : doubleMove // ignore: cast_nullable_to_non_nullable
                  as bool,
        momentumBoost: null == momentumBoost
            ? _value.momentumBoost
            : momentumBoost // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PowerFeaturesImpl extends _PowerFeatures {
  const _$PowerFeaturesImpl({
    this.shield = true,
    this.portal = true,
    this.goldenDice = true,
    this.comboBonus = true,
    this.momentum = true,
    this.reverseMovement = true,
    this.breakBlockade = true,
    this.safeLanding = true,
    this.doubleMove = true,
    this.momentumBoost = true,
  }) : super._();

  factory _$PowerFeaturesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PowerFeaturesImplFromJson(json);

  @override
  @JsonKey()
  final bool shield;
  @override
  @JsonKey()
  final bool portal;
  @override
  @JsonKey()
  final bool goldenDice;
  @override
  @JsonKey()
  final bool comboBonus;
  @override
  @JsonKey()
  final bool momentum;
  @override
  @JsonKey()
  final bool reverseMovement;
  @override
  @JsonKey()
  final bool breakBlockade;
  @override
  @JsonKey()
  final bool safeLanding;
  @override
  @JsonKey()
  final bool doubleMove;
  @override
  @JsonKey()
  final bool momentumBoost;

  @override
  String toString() {
    return 'PowerFeatures(shield: $shield, portal: $portal, goldenDice: $goldenDice, comboBonus: $comboBonus, momentum: $momentum, reverseMovement: $reverseMovement, breakBlockade: $breakBlockade, safeLanding: $safeLanding, doubleMove: $doubleMove, momentumBoost: $momentumBoost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerFeaturesImpl &&
            (identical(other.shield, shield) || other.shield == shield) &&
            (identical(other.portal, portal) || other.portal == portal) &&
            (identical(other.goldenDice, goldenDice) ||
                other.goldenDice == goldenDice) &&
            (identical(other.comboBonus, comboBonus) ||
                other.comboBonus == comboBonus) &&
            (identical(other.momentum, momentum) ||
                other.momentum == momentum) &&
            (identical(other.reverseMovement, reverseMovement) ||
                other.reverseMovement == reverseMovement) &&
            (identical(other.breakBlockade, breakBlockade) ||
                other.breakBlockade == breakBlockade) &&
            (identical(other.safeLanding, safeLanding) ||
                other.safeLanding == safeLanding) &&
            (identical(other.doubleMove, doubleMove) ||
                other.doubleMove == doubleMove) &&
            (identical(other.momentumBoost, momentumBoost) ||
                other.momentumBoost == momentumBoost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    shield,
    portal,
    goldenDice,
    comboBonus,
    momentum,
    reverseMovement,
    breakBlockade,
    safeLanding,
    doubleMove,
    momentumBoost,
  );

  /// Create a copy of PowerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerFeaturesImplCopyWith<_$PowerFeaturesImpl> get copyWith =>
      __$$PowerFeaturesImplCopyWithImpl<_$PowerFeaturesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PowerFeaturesImplToJson(this);
  }
}

abstract class _PowerFeatures extends PowerFeatures {
  const factory _PowerFeatures({
    final bool shield,
    final bool portal,
    final bool goldenDice,
    final bool comboBonus,
    final bool momentum,
    final bool reverseMovement,
    final bool breakBlockade,
    final bool safeLanding,
    final bool doubleMove,
    final bool momentumBoost,
  }) = _$PowerFeaturesImpl;
  const _PowerFeatures._() : super._();

  factory _PowerFeatures.fromJson(Map<String, dynamic> json) =
      _$PowerFeaturesImpl.fromJson;

  @override
  bool get shield;
  @override
  bool get portal;
  @override
  bool get goldenDice;
  @override
  bool get comboBonus;
  @override
  bool get momentum;
  @override
  bool get reverseMovement;
  @override
  bool get breakBlockade;
  @override
  bool get safeLanding;
  @override
  bool get doubleMove;
  @override
  bool get momentumBoost;

  /// Create a copy of PowerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerFeaturesImplCopyWith<_$PowerFeaturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
