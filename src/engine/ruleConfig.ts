import type { RuleConfig } from './types';

export const defaultRuleConfig: RuleConfig = {
  classic: {
    unlockRoll: 6,
    extraTurnOnSix: true,
    threeSixesRule: true,
    exactFinish: true,
    captureEnabled: true,
    safeCells: [1, 9, 14, 22, 27, 35, 40, 48],
    mainPathLength: 52,
    homeStretchLength: 5,
    maxConsecutiveSixes: 3,
  },
  power: { enabled: true },
};

export function withUnlockOnOneOrSix(config: RuleConfig, enabled: boolean): RuleConfig {
  return {
    ...config,
    classic: { ...config.classic, unlockAlsoOnOne: enabled, unlockRoll: 6 },
  };
}
