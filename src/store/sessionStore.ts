import { create } from 'zustand';
import {
  AiEngine,
  GameEngine,
  createGameState,
  defaultRuleConfig,
  withUnlockOnOneOrSix,
  type GameConfig,
  type GameEvent,
  type GameState,
  type LegalMove,
  type RuleConfig,
} from '@/src/engine';

type SessionState = {
  state: GameState | null;
  events: GameEvent[];
  legalMoves: LegalMove[];
  rolling: boolean;
  config: RuleConfig;
  startGame: (config: GameConfig, opts?: { unlockOneOrSix?: boolean }) => void;
  roll: () => void;
  move: (tokenId: string) => void;
  reset: () => void;
  tickAi: () => void;
};

function engineFrom(config: RuleConfig) {
  return new GameEngine(config);
}

export const useSessionStore = create<SessionState>((set, get) => ({
  state: null,
  events: [],
  legalMoves: [],
  rolling: false,
  config: defaultRuleConfig,

  startGame: (config, opts) => {
    let ruleConfig = defaultRuleConfig;
    if (opts?.unlockOneOrSix) {
      ruleConfig = withUnlockOnOneOrSix(ruleConfig, true);
    }
    if (config.mode === 'power') {
      ruleConfig = { ...ruleConfig, power: { enabled: true } };
    }
    const state = createGameState(config);
    set({
      state,
      config: ruleConfig,
      events: [],
      legalMoves: [],
      rolling: false,
    });
  },

  roll: () => {
    const { state, config } = get();
    if (!state || state.phase !== 'rolling') return;
    set({ rolling: true });
    const engine = engineFrom(config);
    // Brief roll delay for UI juice
    setTimeout(() => {
      const result = engine.rollDice(state);
      const legal =
        result.state.phase === 'selectingToken' && result.state.lastDiceValue != null
          ? engine.rules.getLegalMoves(result.state, result.state.lastDiceValue)
          : [];
      set({
        state: result.state,
        events: result.events,
        legalMoves: legal,
        rolling: false,
      });
    }, 450);
  },

  move: (tokenId) => {
    const { state, config } = get();
    if (!state) return;
    const engine = engineFrom(config);
    const result = engine.moveToken(state, tokenId);
    if (result.error) return;
    set({
      state: result.state,
      events: result.events,
      legalMoves: [],
      rolling: false,
    });
  },

  reset: () => set({ state: null, events: [], legalMoves: [], rolling: false }),

  tickAi: () => {
    const { state, config, rolling } = get();
    if (!state || rolling || state.phase === 'finished') return;
    const player = state.players[state.currentPlayerIndex];
    if (player.type !== 'ai') return;
    const ai = new AiEngine(config);
    const action = ai.decide(state);
    if (!action) return;
    if (action.type === 'roll') get().roll();
    else if (action.type === 'move') get().move(action.tokenId);
  },
}));
