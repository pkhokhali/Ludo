import type { ClassicRules, PlayerSeat } from './types';
import { SEATS } from './types';

export const START_CELLS: Record<PlayerSeat, number> = {
  red: 0,
  blue: 13,
  green: 26,
  yellow: 39,
};

export function homeStretchId(seat: PlayerSeat, step: number): number {
  const idx = SEATS.indexOf(seat);
  return 100 + idx * 10 + step;
}

export function finishId(seat: PlayerSeat): number {
  const idx = SEATS.indexOf(seat);
  return 100 + idx * 10 + 9;
}

export class BoardGeometry {
  constructor(private rules: ClassicRules) {}

  get mainPathLength() {
    return this.rules.mainPathLength;
  }

  get homeStretchLength() {
    return this.rules.homeStretchLength;
  }

  isSafeCell(absoluteCellId: number): boolean {
    return (
      this.rules.safeCells.includes(absoluteCellId) ||
      Object.values(START_CELLS).includes(absoluteCellId)
    );
  }

  absoluteFromProgress(seat: PlayerSeat, pathProgress: number): number {
    const start = START_CELLS[seat];
    return (start + pathProgress) % this.mainPathLength;
  }
}
