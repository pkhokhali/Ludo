import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/token.dart';

/// Result of validating a proposed action against RuleConfig.
class ValidationResult {
  const ValidationResult.ok({this.notes = const []})
      : isValid = true,
        reason = null;

  const ValidationResult.invalid(this.reason)
      : isValid = false,
        notes = const [];

  final bool isValid;
  final String? reason;
  final List<String> notes;
}

/// A legal token move for the current dice value.
class LegalMove {
  const LegalMove({
    required this.token,
    required this.fromPosition,
    required this.toPosition,
    required this.toStatus,
    required this.pathProgress,
    required this.homeProgress,
    this.capturesTokenId,
    this.unlocks = false,
    this.finishes = false,
    this.entersHomeStretch = false,
  });

  final Token token;
  final int fromPosition;
  final int toPosition;
  final TokenStatus toStatus;
  final int pathProgress;
  final int homeProgress;
  final String? capturesTokenId;
  final bool unlocks;
  final bool finishes;
  final bool entersHomeStretch;
}

/// Outcome after applying classic movement math.
class MoveOutcome {
  const MoveOutcome({
    required this.state,
    required this.events,
  });

  final GameState state;
  final List<Object> events;
}
