import 'package:ludo_arena/engine/rule_engine/board_geometry.dart';
import 'package:ludo_arena/engine/rule_engine/validation_result.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/models/rule_config.dart';
import 'package:ludo_arena/models/token.dart';

/// Classic Ludo rules — pure Dart, config-driven, no Flutter imports.
class ClassicRuleEngine {
  ClassicRuleEngine(this.config) : geometry = BoardGeometry(config.classic);

  final RuleConfig config;
  final BoardGeometry geometry;

  ClassicRules get classic => config.classic;

  Player currentPlayer(GameState state) =>
      state.players[state.currentPlayerIndex];

  List<Token> tokensFor(GameState state, PlayerSeat seat) =>
      state.tokens.where((t) => t.seat == seat).toList();

  /// Whether rolling is allowed for the current player.
  ValidationResult canRoll(GameState state) {
    if (state.isFinished) {
      return const ValidationResult.invalid('Game is finished');
    }
    if (state.phase != GamePhase.rolling) {
      return const ValidationResult.invalid('Not in rolling phase');
    }
    return const ValidationResult.ok();
  }

  /// Three consecutive 6s rule — returns true if this six triggers a penalty.
  bool isThreeSixesPenalty(GameState state, int diceValue) {
    if (!classic.threeSixesRule) return false;
    if (diceValue != classic.unlockRoll) return false;
    return state.consecutiveSixes + 1 >= classic.maxConsecutiveSixes;
  }

  /// Legal moves for [diceValue] for the current player.
  List<LegalMove> getLegalMoves(GameState state, int diceValue) {
    final player = currentPlayer(state);
    final tokens = tokensFor(state, player.seat);
    final moves = <LegalMove>[];

    for (final token in tokens) {
      final move = _legalMoveForToken(state, token, diceValue);
      if (move != null) moves.add(move);
    }
    return moves;
  }

  LegalMove? _legalMoveForToken(GameState state, Token token, int dice) {
    switch (token.status) {
      case TokenStatus.yard:
        return _unlockMove(token, dice);
      case TokenStatus.onBoard:
        return _boardMove(state, token, dice);
      case TokenStatus.homeStretch:
        return _homeStretchMove(token, dice);
      case TokenStatus.finished:
        return null;
    }
  }

  LegalMove? _unlockMove(Token token, int dice) {
    if (dice != classic.unlockRoll) return null;
    final start = BoardGeometry.startCells[token.seat]!;
    return LegalMove(
      token: token,
      fromPosition: -1,
      toPosition: start,
      toStatus: TokenStatus.onBoard,
      pathProgress: 0,
      homeProgress: 0,
      unlocks: true,
    );
  }

  LegalMove? _boardMove(GameState state, Token token, int dice) {
    final nextProgress = token.pathProgress + dice;
    final entryProgress = classic.mainPathLength - 1;

    // Enter home stretch when passing / landing on home entry.
    // Path: progress 0 at start; after mainPathLength-1 steps at home entry.
    // Moving past home entry goes into home stretch.
    if (nextProgress > entryProgress) {
      final intoHome = nextProgress - entryProgress - 1;
      // intoHome is steps onto stretch after leaving entry (0 = first stretch cell)
      if (intoHome >= classic.homeStretchLength) {
        if (!classic.exactFinish) return null;
        // Overshoot finish from board — invalid when exact finish required
        if (intoHome > classic.homeStretchLength) return null;
        // Land exactly on finish
        return LegalMove(
          token: token,
          fromPosition: token.position,
          toPosition: BoardGeometry.finishId(token.seat),
          toStatus: TokenStatus.finished,
          pathProgress: token.pathProgress,
          homeProgress: classic.homeStretchLength,
          finishes: true,
        );
      }
      if (intoHome < 0) return null;
      return LegalMove(
        token: token,
        fromPosition: token.position,
        toPosition: BoardGeometry.homeStretchId(token.seat, intoHome),
        toStatus: TokenStatus.homeStretch,
        pathProgress: entryProgress,
        homeProgress: intoHome,
        entersHomeStretch: true,
      );
    }

    final toPos = geometry.absoluteFromProgress(token.seat, nextProgress);
    final captureId = _captureTarget(state, token, toPos);

    // Blockade: two+ same-color tokens on destination block entry (classic).
    if (_isBlockaded(state, token.seat, toPos)) {
      return null;
    }

    return LegalMove(
      token: token,
      fromPosition: token.position,
      toPosition: toPos,
      toStatus: TokenStatus.onBoard,
      pathProgress: nextProgress,
      homeProgress: 0,
      capturesTokenId: captureId,
    );
  }

  LegalMove? _homeStretchMove(Token token, int dice) {
    final next = token.homeProgress + dice;
    if (next < classic.homeStretchLength) {
      return LegalMove(
        token: token,
        fromPosition: token.position,
        toPosition: BoardGeometry.homeStretchId(token.seat, next),
        toStatus: TokenStatus.homeStretch,
        pathProgress: token.pathProgress,
        homeProgress: next,
      );
    }
    if (classic.exactFinish && next != classic.homeStretchLength) {
      return null;
    }
    if (next > classic.homeStretchLength) return null;

    return LegalMove(
      token: token,
      fromPosition: token.position,
      toPosition: BoardGeometry.finishId(token.seat),
      toStatus: TokenStatus.finished,
      pathProgress: token.pathProgress,
      homeProgress: classic.homeStretchLength,
      finishes: true,
    );
  }

  String? _captureTarget(GameState state, Token mover, int toPos) {
    if (!classic.captureEnabled) return null;
    if (geometry.isSafeCell(toPos)) return null;

    final victims = state.tokens.where(
      (t) =>
          t.seat != mover.seat &&
          t.status == TokenStatus.onBoard &&
          t.position == toPos &&
          !t.hasShield,
    );
    // Capture single opponent token; multi-stack handled as blockade of others.
    if (victims.length == 1) return victims.first.id;
    return null;
  }

  bool _isBlockaded(GameState state, PlayerSeat moverSeat, int toPos) {
    final stack = state.tokens
        .where(
          (t) =>
              t.seat != moverSeat &&
              t.status == TokenStatus.onBoard &&
              t.position == toPos,
        )
        .toList();
    return stack.length >= 2;
  }

  ValidationResult validateMove(
    GameState state,
    String tokenId,
    int diceValue,
  ) {
    if (state.phase != GamePhase.selectingToken &&
        state.phase != GamePhase.rolling) {
      // Allow selecting after roll when awaitingMove
    }
    if (!state.awaitingMove && state.lastDiceValue == null) {
      return const ValidationResult.invalid('Dice has not been rolled');
    }
    final dice = diceValue;
    final moves = getLegalMoves(state, dice);
    final match = moves.where((m) => m.token.id == tokenId);
    if (match.isEmpty) {
      return const ValidationResult.invalid('Illegal move for this token');
    }
    return const ValidationResult.ok();
  }

  /// True when all of a player's tokens are finished.
  bool hasPlayerWon(GameState state, String playerId) {
    final player = state.players.firstWhere((p) => p.id == playerId);
    final tokens = tokensFor(state, player.seat);
    return tokens.every((t) => t.status == TokenStatus.finished);
  }
}
