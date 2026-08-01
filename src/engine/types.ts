export type PlayerSeat = 'red' | 'blue' | 'green' | 'yellow';
export type GameMode = 'classic' | 'power' | 'quick' | 'ai' | 'passPlay';
export type AiDifficulty = 'easy' | 'medium' | 'hard' | 'expert';
export type PlayerType = 'human' | 'ai';
export type TokenStatus = 'yard' | 'onBoard' | 'homeStretch' | 'finished';
export type GamePhase = 'rolling' | 'selectingToken' | 'animating' | 'finished';

export const SEATS: PlayerSeat[] = ['red', 'blue', 'green', 'yellow'];

export type ClassicRules = {
  /** Primary unlock face (usually 6). */
  unlockRoll: number;
  /** When true, 1 also unlocks from yard. */
  unlockAlsoOnOne?: boolean;
  extraTurnOnSix: boolean;
  threeSixesRule: boolean;
  exactFinish: boolean;
  captureEnabled: boolean;
  safeCells: number[];
  mainPathLength: number;
  homeStretchLength: number;
  maxConsecutiveSixes: number;
};

export type RuleConfig = {
  classic: ClassicRules;
  power: { enabled: boolean };
};

export type Token = {
  id: string;
  seat: PlayerSeat;
  index: number;
  status: TokenStatus;
  /** Absolute main-path cell, or stretch/finish id, or -1 in yard. */
  position: number;
  pathProgress: number;
  homeProgress: number;
};

export type Player = {
  id: string;
  seat: PlayerSeat;
  name: string;
  type: PlayerType;
  aiDifficulty: AiDifficulty;
};

export type GameConfig = {
  mode: GameMode;
  playerCount: number;
  slots: Array<{
    seat: PlayerSeat;
    name: string;
    type: PlayerType;
    aiDifficulty: AiDifficulty;
  }>;
};

export type GameState = {
  id: string;
  config: GameConfig;
  players: Player[];
  tokens: Token[];
  phase: GamePhase;
  currentPlayerIndex: number;
  lastDiceValue: number | null;
  consecutiveSixes: number;
  winnerSeat: PlayerSeat | null;
  startedAt: string;
  updatedAt: string;
};

export type LegalMove = {
  tokenId: string;
  fromPosition: number;
  toPosition: number;
  toStatus: TokenStatus;
  pathProgress: number;
  homeProgress: number;
  unlocks?: boolean;
  finishes?: boolean;
  entersHomeStretch?: boolean;
  captureTokenId?: string;
};

export type GameEvent =
  | { type: 'diceRolled'; playerId: string; value: number }
  | { type: 'tokenMoved'; tokenId: string; to: number }
  | { type: 'tokenUnlocked'; tokenId: string }
  | { type: 'capture'; attackerId: string; victimId: string }
  | { type: 'tokenFinished'; tokenId: string }
  | { type: 'turnEnded'; playerId: string }
  | { type: 'extraTurn'; playerId: string }
  | { type: 'threeSixesPenalty'; playerId: string }
  | { type: 'gameFinished'; winnerSeat: PlayerSeat };

export type EngineResult = {
  state: GameState;
  events: GameEvent[];
  error?: string;
};
