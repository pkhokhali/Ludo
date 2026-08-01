import { create } from 'zustand';

type ProfileState = {
  name: string;
  level: number;
  xp: number;
  coins: number;
  wins: number;
  matches: number;
  setName: (name: string) => void;
};

export const useProfileStore = create<ProfileState>((set) => ({
  name: 'Arena Pilot',
  level: 7,
  xp: 1840,
  coins: 1250,
  wins: 42,
  matches: 118,
  setName: (name) => set({ name }),
}));
