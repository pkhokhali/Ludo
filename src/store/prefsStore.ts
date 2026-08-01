import { create } from 'zustand';

export type ThemeId = 'arena' | 'classic';
export type DiceStyle = 'cream' | 'neon';
export type CoinSpeed = 'slow' | 'normal' | 'fast';

type PrefsState = {
  soundEnabled: boolean;
  musicEnabled: boolean;
  hapticsEnabled: boolean;
  continuousRolling: boolean;
  diceRollingStyle: DiceStyle;
  coinMoveSpeed: CoinSpeed;
  themeId: ThemeId;
  unlockOnOneOrSix: boolean;
  powerMode: boolean;
  setSound: (v: boolean) => void;
  setMusic: (v: boolean) => void;
  setHaptics: (v: boolean) => void;
  setContinuousRolling: (v: boolean) => void;
  setDiceStyle: (v: DiceStyle) => void;
  setCoinSpeed: (v: CoinSpeed) => void;
  setThemeId: (v: ThemeId) => void;
  setUnlockOnOneOrSix: (v: boolean) => void;
  setPowerMode: (v: boolean) => void;
};

export const usePrefsStore = create<PrefsState>((set) => ({
  soundEnabled: true,
  musicEnabled: true,
  hapticsEnabled: true,
  continuousRolling: false,
  diceRollingStyle: 'cream',
  coinMoveSpeed: 'normal',
  themeId: 'arena',
  unlockOnOneOrSix: false,
  powerMode: false,
  setSound: (soundEnabled) => set({ soundEnabled }),
  setMusic: (musicEnabled) => set({ musicEnabled }),
  setHaptics: (hapticsEnabled) => set({ hapticsEnabled }),
  setContinuousRolling: (continuousRolling) => set({ continuousRolling }),
  setDiceStyle: (diceRollingStyle) => set({ diceRollingStyle }),
  setCoinSpeed: (coinMoveSpeed) => set({ coinMoveSpeed }),
  setThemeId: (themeId) => set({ themeId }),
  setUnlockOnOneOrSix: (unlockOnOneOrSix) => set({ unlockOnOneOrSix }),
  setPowerMode: (powerMode) => set({ powerMode }),
}));
