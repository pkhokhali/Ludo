import { ClassicRulesEngine } from './classicRules';
import type {
  EngineResult,
  GameEvent,
  GameState,
  RuleConfig,
  Token,
} from './types';

export class GameEngine {
  readonly rules: ClassicRulesEngine;

  constructor(
    config: RuleConfig,
    private random: () => number = Math.random,
  ) {
    this.rules = new ClassicRulesEngine(config);
  }

  rollDice(state: GameState, forcedValue?: number): EngineResult {
    const err = this.rules.canRoll(state);
    if (err) return { state, events: [], error: err };

    const player = state.players[state.currentPlayerIndex];
    const value = forcedValue ?? Math.floor(this.random() * 6) + 1;
    const events: GameEvent[] = [
      { type: 'diceRolled', playerId: player.id, value },
    ];

    if (this.rules.isThreeSixesPenalty(state, value)) {
      events.push({ type: 'threeSixesPenalty', playerId: player.id });
      const next = this.advanceTurn({
        ...state,
        lastDiceValue: value,
        consecutiveSixes: 0,
        phase: 'rolling',
        updatedAt: new Date().toISOString(),
      });
      events.push({
        type: 'turnEnded',
        playerId: next.players[next.currentPlayerIndex].id,
      });
      return { state: next, events };
    }

    const consecutive =
      value === this.rules.classic.unlockRoll
        ? state.consecutiveSixes + 1
        : 0;

    const legal = this.rules.getLegalMoves(state, value);
    if (legal.length === 0) {
      const extra =
        value === this.rules.classic.unlockRoll &&
        this.rules.classic.extraTurnOnSix;
      if (extra) {
        return {
          state: {
            ...state,
            lastDiceValue: value,
            consecutiveSixes: consecutive,
            phase: 'rolling',
            updatedAt: new Date().toISOString(),
          },
          events: [...events, { type: 'extraTurn', playerId: player.id }],
        };
      }
      const next = this.advanceTurn({
        ...state,
        lastDiceValue: value,
        consecutiveSixes: 0,
        phase: 'rolling',
        updatedAt: new Date().toISOString(),
      });
      events.push({ type: 'turnEnded', playerId: player.id });
      return { state: next, events };
    }

    return {
      state: {
        ...state,
        lastDiceValue: value,
        consecutiveSixes: consecutive,
        phase: 'selectingToken',
        updatedAt: new Date().toISOString(),
      },
      events,
    };
  }

  moveToken(state: GameState, tokenId: string): EngineResult {
    const dice = state.lastDiceValue;
    if (dice == null || state.phase !== 'selectingToken') {
      return { state, events: [], error: 'No pending dice move' };
    }

    const legal = this.rules
      .getLegalMoves(state, dice)
      .find((m) => m.tokenId === tokenId);
    if (!legal) {
      return { state, events: [], error: 'Illegal move for this token' };
    }

    const events: GameEvent[] = [];
    const player = state.players[state.currentPlayerIndex];
    let tokens = state.tokens.map((t) => ({ ...t }));

    if (legal.unlocks) {
      events.push({ type: 'tokenUnlocked', tokenId: legal.tokenId });
    }
    events.push({
      type: 'tokenMoved',
      tokenId: legal.tokenId,
      to: legal.toPosition,
    });

    tokens = tokens.map((t) =>
      t.id === legal.tokenId
        ? {
            ...t,
            status: legal.toStatus,
            position: legal.toPosition,
            pathProgress: legal.pathProgress,
            homeProgress: legal.homeProgress,
          }
        : t,
    );

    if (legal.captureTokenId) {
      events.push({
        type: 'capture',
        attackerId: legal.tokenId,
        victimId: legal.captureTokenId,
      });
      tokens = tokens.map((t) =>
        t.id === legal.captureTokenId
          ? ({
              ...t,
              status: 'yard',
              position: -1,
              pathProgress: 0,
              homeProgress: 0,
            } satisfies Token)
          : t,
      );
    }

    if (legal.finishes) {
      events.push({ type: 'tokenFinished', tokenId: legal.tokenId });
    }

    let next: GameState = {
      ...state,
      tokens,
      lastDiceValue: null,
      phase: 'rolling',
      updatedAt: new Date().toISOString(),
    };

    if (this.rules.hasPlayerWon(next, player.id)) {
      next = {
        ...next,
        phase: 'finished',
        winnerSeat: player.seat,
      };
      events.push({ type: 'gameFinished', winnerSeat: player.seat });
      return { state: next, events };
    }

    const keepTurn =
      dice === this.rules.classic.unlockRoll &&
      this.rules.classic.extraTurnOnSix;
    if (keepTurn) {
      events.push({ type: 'extraTurn', playerId: player.id });
      return { state: next, events };
    }

    next = this.advanceTurn({ ...next, consecutiveSixes: 0 });
    events.push({ type: 'turnEnded', playerId: player.id });
    return { state: next, events };
  }

  private advanceTurn(state: GameState): GameState {
    const n = state.players.length;
    return {
      ...state,
      currentPlayerIndex: (state.currentPlayerIndex + 1) % n,
      consecutiveSixes: 0,
      lastDiceValue: null,
      phase: 'rolling',
      updatedAt: new Date().toISOString(),
    };
  }
}
