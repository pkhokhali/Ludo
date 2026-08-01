import type { PlayerSeat } from './types';

/** 15×15 grid helpers — engine seat corners (red BL, blue TL, green TR, yellow BR). */
export const GRID = 15;

const MAIN_PATH: [number, number][] = (() => {
  const p: [number, number][] = [];
  for (let y = 13; y >= 9; y--) p.push([6, y]);
  for (let x = 5; x >= 0; x--) p.push([x, 8]);
  p.push([0, 7], [0, 6]);
  p.push([0, 5]);
  for (let x = 1; x <= 5; x++) p.push([x, 6]);
  for (let y = 5; y >= 0; y--) p.push([6, y]);
  p.push([7, 0]);
  p.push([8, 0]);
  for (let y = 1; y <= 5; y++) p.push([8, y]);
  for (let x = 9; x <= 14; x++) p.push([x, 6]);
  p.push([14, 7]);
  p.push([14, 8]);
  for (let y = 9; y <= 13; y++) p.push([14, y]);
  for (let x = 13; x >= 9; x--) p.push([x, 14]);
  p.push([8, 14], [7, 14]);
  return p;
})();

const HOME_STRETCH: Record<PlayerSeat, [number, number][]> = {
  red: [
    [7, 13],
    [7, 12],
    [7, 11],
    [7, 10],
    [7, 9],
  ],
  blue: [
    [1, 7],
    [2, 7],
    [3, 7],
    [4, 7],
    [5, 7],
  ],
  green: [
    [7, 1],
    [7, 2],
    [7, 3],
    [7, 4],
    [7, 5],
  ],
  yellow: [
    [13, 7],
    [12, 7],
    [11, 7],
    [10, 7],
    [9, 7],
  ],
};

const YARD: Record<PlayerSeat, [number, number][]> = {
  red: [
    [1.9, 10.9],
    [3.25, 10.9],
    [1.9, 12.25],
    [3.25, 12.25],
  ],
  blue: [
    [1.9, 1.9],
    [3.25, 1.9],
    [1.9, 3.25],
    [3.25, 3.25],
  ],
  green: [
    [10.9, 1.9],
    [12.25, 1.9],
    [10.9, 3.25],
    [12.25, 3.25],
  ],
  yellow: [
    [10.9, 10.9],
    [12.25, 10.9],
    [10.9, 12.25],
    [12.25, 12.25],
  ],
};

export function cellToPixel(
  cell: [number, number],
  size: number,
): { x: number; y: number } {
  const cs = size / GRID;
  return { x: (cell[0] + 0.5) * cs, y: (cell[1] + 0.5) * cs };
}

export function tokenCell(
  seat: PlayerSeat,
  index: number,
  status: string,
  pathProgress: number,
  homeProgress: number,
  position: number,
): [number, number] {
  if (status === 'yard') return YARD[seat][index % 4];
  if (status === 'finished') return [7, 7];
  if (status === 'homeStretch') {
    return HOME_STRETCH[seat][Math.min(homeProgress, 4)];
  }
  if (status === 'onBoard' && position >= 0 && position < 52) {
    return MAIN_PATH[position];
  }
  if (pathProgress >= 0 && pathProgress < 52) {
    const start = { red: 0, blue: 13, green: 26, yellow: 39 }[seat];
    return MAIN_PATH[(start + pathProgress) % 52];
  }
  return YARD[seat][index % 4];
}
