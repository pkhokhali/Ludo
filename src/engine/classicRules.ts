import {
  BoardGeometry,
  START_CELLS,
  finishId,
  homeStretchId,
} from './boardGeometry';
import type {
  GameState,
  LegalMove,
  PlayerSeat,
  RuleConfig,
  Token,
} from './types';

export class ClassicRulesEngine {
  readonly geometry: BoardGeometry;

  constructor(readonly config: RuleConfig) {
    this.geometry = new BoardGeometry(config.classic);
  }

  get classic() {
    return this.config.classic;
  }

  canRoll(state: GameState): string | null {
    if (state.phase === 'finished') return 'Game is finished';
    if (state.phase !== 'rolling') return 'Not in rolling phase';
    return null;
  }

  isThreeSixesPenalty(state: GameState, diceValue: number): boolean {
    if (!this.classic.threeSixesRule) return false;
    if (diceValue !== this.classic.unlockRoll) return false;
    return state.consecutiveSixes + 1 >= this.classic.maxConsecutiveSixes;
  }

  getLegalMoves(state: GameState, diceValue: number): LegalMove[] {
    const player = state.players[state.currentPlayerIndex];
    const tokens = state.tokens.filter((t) => t.seat === player.seat);
    const moves: LegalMove[] = [];
    for (const token of tokens) {
      const move = this.legalMoveForToken(state, token, diceValue);
      if (move) moves.push(move);
    }
    return moves;
  }

  private legalMoveForToken(
    state: GameState,
    token: Token,
    dice: number,
  ): LegalMove | null {
    switch (token.status) {
      case 'yard':
        return this.unlockMove(token, dice);
      case 'onBoard':
        return this.boardMove(state, token, dice);
      case 'homeStretch':
        return this.homeStretchMove(token, dice);
      case 'finished':
        return null;
    }
  }

  private canUnlock(dice: number): boolean {
    if (dice === this.classic.unlockRoll) return true;
    return Boolean(this.classic.unlockAlsoOnOne && dice === 1);
  }

  private unlockMove(token: Token, dice: number): LegalMove | null {
    if (!this.canUnlock(dice)) return null;
    const start = START_CELLS[token.seat];
    return {
      tokenId: token.id,
      fromPosition: -1,
      toPosition: start,
      toStatus: 'onBoard',
      pathProgress: 0,
      homeProgress: 0,
      unlocks: true,
    };
  }

  private boardMove(
    state: GameState,
    token: Token,
    dice: number,
  ): LegalMove | null {
    const nextProgress = token.pathProgress + dice;
    const entryProgress = this.classic.mainPathLength - 1;

    if (nextProgress > entryProgress) {
      const intoHome = nextProgress - entryProgress - 1;
      if (intoHome >= this.classic.homeStretchLength) {
        if (!this.classic.exactFinish) return null;
        if (intoHome > this.classic.homeStretchLength) return null;
        return {
          tokenId: token.id,
          fromPosition: token.position,
          toPosition: finishId(token.seat),
          toStatus: 'finished',
          pathProgress: token.pathProgress,
          homeProgress: this.classic.homeStretchLength,
          finishes: true,
        };
      }
      if (intoHome < 0) return null;
      return {
        tokenId: token.id,
        fromPosition: token.position,
        toPosition: homeStretchId(token.seat, intoHome),
        toStatus: 'homeStretch',
        pathProgress: entryProgress,
        homeProgress: intoHome,
        entersHomeStretch: true,
      };
    }

    const toPos = this.geometry.absoluteFromProgress(token.seat, nextProgress);
    if (this.isBlockaded(state, token.seat, toPos)) return null;
    const captureTokenId = this.captureTarget(state, token, toPos) ?? undefined;

    return {
      tokenId: token.id,
      fromPosition: token.position,
      toPosition: toPos,
      toStatus: 'onBoard',
      pathProgress: nextProgress,
      homeProgress: 0,
      captureTokenId,
    };
  }

  private homeStretchMove(token: Token, dice: number): LegalMove | null {
    const next = token.homeProgress + dice;
    if (next < this.classic.homeStretchLength) {
      return {
        tokenId: token.id,
        fromPosition: token.position,
        toPosition: homeStretchId(token.seat, next),
        toStatus: 'homeStretch',
        pathProgress: token.pathProgress,
        homeProgress: next,
      };
    }
    if (this.classic.exactFinish && next !== this.classic.homeStretchLength) {
      return null;
    }
    if (next > this.classic.homeStretchLength) return null;
    return {
      tokenId: token.id,
      fromPosition: token.position,
      toPosition: finishId(token.seat),
      toStatus: 'finished',
      pathProgress: token.pathProgress,
      homeProgress: this.classic.homeStretchLength,
      finishes: true,
    };
  }

  private captureTarget(
    state: GameState,
    mover: Token,
    toPos: number,
  ): string | null {
    if (!this.classic.captureEnabled) return null;
    if (this.geometry.isSafeCell(toPos)) return null;
    const victims = state.tokens.filter(
      (t) =>
        t.seat !== mover.seat &&
        t.status === 'onBoard' &&
        t.position === toPos,
    );
    return victims.length === 1 ? victims[0].id : null;
  }

  private isBlockaded(
    state: GameState,
    moverSeat: PlayerSeat,
    toPos: number,
  ): boolean {
    const stack = state.tokens.filter(
      (t) =>
        t.seat !== moverSeat &&
        t.status === 'onBoard' &&
        t.position === toPos,
    );
    return stack.length >= 2;
  }

  hasPlayerWon(state: GameState, playerId: string): boolean {
    const player = state.players.find((p) => p.id === playerId)!;
    return state.tokens
      .filter((t) => t.seat === player.seat)
      .every((t) => t.status === 'finished');
  }
}
