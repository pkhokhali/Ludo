// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BoardCell _$BoardCellFromJson(Map<String, dynamic> json) {
  return _BoardCell.fromJson(json);
}

/// @nodoc
mixin _$BoardCell {
  int get id => throw _privateConstructorUsedError;
  CellKind get kind => throw _privateConstructorUsedError;
  PlayerSeat? get ownerSeat => throw _privateConstructorUsedError;
  bool get isPortal => throw _privateConstructorUsedError;
  int? get portalTargetId => throw _privateConstructorUsedError;

  /// Serializes this BoardCell to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardCellCopyWith<BoardCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCellCopyWith<$Res> {
  factory $BoardCellCopyWith(BoardCell value, $Res Function(BoardCell) then) =
      _$BoardCellCopyWithImpl<$Res, BoardCell>;
  @useResult
  $Res call({
    int id,
    CellKind kind,
    PlayerSeat? ownerSeat,
    bool isPortal,
    int? portalTargetId,
  });
}

/// @nodoc
class _$BoardCellCopyWithImpl<$Res, $Val extends BoardCell>
    implements $BoardCellCopyWith<$Res> {
  _$BoardCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? ownerSeat = freezed,
    Object? isPortal = null,
    Object? portalTargetId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            kind: null == kind
                ? _value.kind
                : kind // ignore: cast_nullable_to_non_nullable
                      as CellKind,
            ownerSeat: freezed == ownerSeat
                ? _value.ownerSeat
                : ownerSeat // ignore: cast_nullable_to_non_nullable
                      as PlayerSeat?,
            isPortal: null == isPortal
                ? _value.isPortal
                : isPortal // ignore: cast_nullable_to_non_nullable
                      as bool,
            portalTargetId: freezed == portalTargetId
                ? _value.portalTargetId
                : portalTargetId // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardCellImplCopyWith<$Res>
    implements $BoardCellCopyWith<$Res> {
  factory _$$BoardCellImplCopyWith(
    _$BoardCellImpl value,
    $Res Function(_$BoardCellImpl) then,
  ) = __$$BoardCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    CellKind kind,
    PlayerSeat? ownerSeat,
    bool isPortal,
    int? portalTargetId,
  });
}

/// @nodoc
class __$$BoardCellImplCopyWithImpl<$Res>
    extends _$BoardCellCopyWithImpl<$Res, _$BoardCellImpl>
    implements _$$BoardCellImplCopyWith<$Res> {
  __$$BoardCellImplCopyWithImpl(
    _$BoardCellImpl _value,
    $Res Function(_$BoardCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? kind = null,
    Object? ownerSeat = freezed,
    Object? isPortal = null,
    Object? portalTargetId = freezed,
  }) {
    return _then(
      _$BoardCellImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        kind: null == kind
            ? _value.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as CellKind,
        ownerSeat: freezed == ownerSeat
            ? _value.ownerSeat
            : ownerSeat // ignore: cast_nullable_to_non_nullable
                  as PlayerSeat?,
        isPortal: null == isPortal
            ? _value.isPortal
            : isPortal // ignore: cast_nullable_to_non_nullable
                  as bool,
        portalTargetId: freezed == portalTargetId
            ? _value.portalTargetId
            : portalTargetId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardCellImpl implements _BoardCell {
  const _$BoardCellImpl({
    required this.id,
    required this.kind,
    this.ownerSeat,
    this.isPortal = false,
    this.portalTargetId,
  });

  factory _$BoardCellImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardCellImplFromJson(json);

  @override
  final int id;
  @override
  final CellKind kind;
  @override
  final PlayerSeat? ownerSeat;
  @override
  @JsonKey()
  final bool isPortal;
  @override
  final int? portalTargetId;

  @override
  String toString() {
    return 'BoardCell(id: $id, kind: $kind, ownerSeat: $ownerSeat, isPortal: $isPortal, portalTargetId: $portalTargetId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardCellImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.ownerSeat, ownerSeat) ||
                other.ownerSeat == ownerSeat) &&
            (identical(other.isPortal, isPortal) ||
                other.isPortal == isPortal) &&
            (identical(other.portalTargetId, portalTargetId) ||
                other.portalTargetId == portalTargetId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, kind, ownerSeat, isPortal, portalTargetId);

  /// Create a copy of BoardCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardCellImplCopyWith<_$BoardCellImpl> get copyWith =>
      __$$BoardCellImplCopyWithImpl<_$BoardCellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardCellImplToJson(this);
  }
}

abstract class _BoardCell implements BoardCell {
  const factory _BoardCell({
    required final int id,
    required final CellKind kind,
    final PlayerSeat? ownerSeat,
    final bool isPortal,
    final int? portalTargetId,
  }) = _$BoardCellImpl;

  factory _BoardCell.fromJson(Map<String, dynamic> json) =
      _$BoardCellImpl.fromJson;

  @override
  int get id;
  @override
  CellKind get kind;
  @override
  PlayerSeat? get ownerSeat;
  @override
  bool get isPortal;
  @override
  int? get portalTargetId;

  /// Create a copy of BoardCell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardCellImplCopyWith<_$BoardCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
