import { ClassicRulesEngine } from './classicRules';
import type { AiDifficulty, GameState, LegalMove, RuleConfig } from './types';

type Weights = {
  capture: number;
  finish: number;
  unlock: number;
  progress: number;
  noise: number;
};

const WEIGHTS: Record<AiDifficulty, Weights> = {
  easy: { capture: 8, finish: 12, unlock: 6, progress: 1, noise: 14 },
  medium: { capture: 16, finish: 20, unlock: 10, progress: 2, noise: 7 },
  hard: { capture: 28, finish: 32, unlock: 14, progress: 3, noise: 2.5 },
  expert: { capture: 40, finish: 45, unlock: 18, progress: 4, noise: 0.4 },
};

export type AiAction =
  | { type: 'roll' }
  | { type: 'move'; tokenId: string }
  | null;

export class AiEngine {
  private rules: ClassicRulesEngine;

  constructor(
    config: RuleConfig,
    private random: () => number = Math.random,
  ) {
    this.rules = new ClassicRulesEngine(config);
  }

  decide(state: GameState): AiAction {
    const player = state.players[state.currentPlayerIndex];
    if (player.type !== 'ai' || state.phase === 'finished') return null;

    if (state.phase === 'rolling') return { type: 'roll' };

    if (state.phase === 'selectingToken' && state.lastDiceValue != null) {
      const move = this.pickMove(state, state.lastDiceValue, player.aiDifficulty);
      return move ? { type: 'move', tokenId: move.tokenId } : null;
    }
    return null;
  }

  private pickMove(
    state: GameState,
    dice: number,
    difficulty: AiDifficulty,
  ): LegalMove | null {
    const moves = this.rules.getLegalMoves(state, dice);
    if (moves.length === 0) return null;
    const w = WEIGHTS[difficulty];
    let best = moves[0];
    let bestScore = -Infinity;
    for (const m of moves) {
      let score = m.pathProgress * w.progress;
      if (m.unlocks) score += w.unlock;
      if (m.finishes) score += w.finish;
      if (m.captureTokenId) score += w.capture;
      score += this.random() * w.noise;
      if (score > bestScore) {
        bestScore = score;
        best = m;
      }
    }
    return best;
  }
}
