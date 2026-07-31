import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ludo_arena/models/enums.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String id,
    required PlayerSeat seat,
    required int index,
    @Default(TokenStatus.yard) TokenStatus status,

    /// Absolute board cell id when onBoard / homeStretch; -1 in yard/finished.
    @Default(-1) int position,

    /// Steps advanced on the main path (0..mainPathLength-1).
    @Default(0) int pathProgress,

    /// Steps into home stretch (0..homeStretchLength).
    @Default(0) int homeProgress,
    @Default(false) bool hasShield,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
