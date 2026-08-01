import { GameEngine } from '../gameEngine';
import { createGameState } from '../gameStateFactory';
import { defaultRuleConfig } from '../ruleConfig';
import { START_CELLS } from '../boardGeometry';
import { MAIN_PATH_LENGTH_CHECK } from './helpers';

describe('Board geometry', () => {
  it('has 52 main path cells mapped in layout helper', () => {
    expect(MAIN_PATH_LENGTH_CHECK).toBe(52);
  });

  it('maps engine start cells to corners', () => {
    expect(START_CELLS.red).toBe(0);
    expect(START_CELLS.blue).toBe(13);
    expect(START_CELLS.green).toBe(26);
    expect(START_CELLS.yellow).toBe(39);
  });
});

describe('GameEngine', () => {
  const baseConfig = {
    mode: 'classic' as const,
    playerCount: 2,
    slots: [
      {
        seat: 'red' as const,
        name: 'You',
        type: 'human' as const,
        aiDifficulty: 'medium' as const,
      },
      {
        seat: 'blue' as const,
        name: 'Bot',
        type: 'ai' as const,
        aiDifficulty: 'easy' as const,
      },
    ],
  };

  it('rolls forced dice and unlocks on 6', () => {
    const engine = new GameEngine(defaultRuleConfig, () => 0);
    let state = createGameState(baseConfig);
    const rolled = engine.rollDice(state, 6);
    expect(rolled.error).toBeUndefined();
    expect(rolled.state.lastDiceValue).toBe(6);
    expect(rolled.state.phase).toBe('selectingToken');

    const tokenId = rolled.state.tokens.find((t) => t.seat === 'red')!.id;
    const moved = engine.moveToken(rolled.state, tokenId);
    expect(moved.error).toBeUndefined();
    const token = moved.state.tokens.find((t) => t.id === tokenId)!;
    expect(token.status).toBe('onBoard');
    expect(token.position).toBe(START_CELLS.red);
  });

  it('does not unlock on non-six', () => {
    const engine = new GameEngine(defaultRuleConfig);
    const state = createGameState(baseConfig);
    const rolled = engine.rollDice(state, 3);
    expect(rolled.state.phase).toBe('rolling');
    expect(
      rolled.state.tokens.every((t) => t.seat !== 'red' || t.status === 'yard'),
    ).toBe(true);
  });

  it('three sixes ends turn', () => {
    const engine = new GameEngine(defaultRuleConfig);
    let state = createGameState(baseConfig);
    // Force empty legal moves by... actually with all in yard, 6 always unlocks.
    // Simulate consecutive sixes via state mutation for penalty check.
    state = { ...state, consecutiveSixes: 2 };
    const rolled = engine.rollDice(state, 6);
    expect(rolled.events.some((e) => e.type === 'threeSixesPenalty')).toBe(true);
    expect(rolled.state.currentPlayerIndex).toBe(1);
  });
});
