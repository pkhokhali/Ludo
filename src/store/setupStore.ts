import { create } from 'zustand';
import type { AiDifficulty, GameMode, PlayerSeat } from '@/src/engine/types';

export type SlotConfig = {
  seat: PlayerSeat;
  name: string;
  type: 'human' | 'ai';
  aiDifficulty: AiDifficulty;
  enabled: boolean;
};

type SetupState = {
  mode: GameMode;
  slots: SlotConfig[];
  setMode: (mode: GameMode) => void;
  setSlotType: (seat: PlayerSeat, type: 'human' | 'ai') => void;
  setDifficulty: (seat: PlayerSeat, d: AiDifficulty) => void;
  setEnabled: (seat: PlayerSeat, enabled: boolean) => void;
  activeSlots: () => SlotConfig[];
};

const defaultSlots: SlotConfig[] = [
  { seat: 'red', name: 'You', type: 'human', aiDifficulty: 'medium', enabled: true },
  { seat: 'blue', name: 'Nova', type: 'ai', aiDifficulty: 'medium', enabled: true },
  { seat: 'green', name: 'Volt', type: 'ai', aiDifficulty: 'easy', enabled: true },
  { seat: 'yellow', name: 'Blitz', type: 'ai', aiDifficulty: 'hard', enabled: false },
];

export const useSetupStore = create<SetupState>((set, get) => ({
  mode: 'classic',
  slots: defaultSlots,
  setMode: (mode) => set({ mode }),
  setSlotType: (seat, type) =>
    set({
      slots: get().slots.map((s) => (s.seat === seat ? { ...s, type } : s)),
    }),
  setDifficulty: (seat, aiDifficulty) =>
    set({
      slots: get().slots.map((s) => (s.seat === seat ? { ...s, aiDifficulty } : s)),
    }),
  setEnabled: (seat, enabled) =>
    set({
      slots: get().slots.map((s) => (s.seat === seat ? { ...s, enabled } : s)),
    }),
  activeSlots: () => get().slots.filter((s) => s.enabled),
}));
