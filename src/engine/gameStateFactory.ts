import type { GameConfig, GameState, Player, Token } from './types';

export function createGameState(
  config: GameConfig,
  id = `game_${Date.now()}`,
): GameState {
  const slots =
    config.slots.length > 0
      ? config.slots
      : (['red', 'blue', 'green', 'yellow'] as const)
          .slice(0, config.playerCount)
          .map((seat, i) => ({
            seat,
            name: `Player ${i + 1}`,
            type: 'human' as const,
            aiDifficulty: 'medium' as const,
          }));

  const players: Player[] = slots.map((slot) => ({
    id: `p${slot.seat}`,
    seat: slot.seat,
    name: slot.name,
    type: slot.type,
    aiDifficulty: slot.aiDifficulty,
  }));

  const tokens: Token[] = [];
  for (const slot of slots) {
    for (let t = 0; t < 4; t++) {
      tokens.push({
        id: `${slot.seat}_${t}`,
        seat: slot.seat,
        index: t,
        status: 'yard',
        position: -1,
        pathProgress: 0,
        homeProgress: 0,
      });
    }
  }

  const now = new Date().toISOString();
  return {
    id,
    config: { ...config, slots, playerCount: players.length },
    players,
    tokens,
    phase: 'rolling',
    currentPlayerIndex: 0,
    lastDiceValue: null,
    consecutiveSixes: 0,
    winnerSeat: null,
    startedAt: now,
    updatedAt: now,
  };
}
