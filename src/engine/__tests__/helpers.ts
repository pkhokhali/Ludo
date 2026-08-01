import { tokenCell } from '../boardLayout';

/** Sanity: walking all absolute path ids 0..51 yields unique cells. */
export const MAIN_PATH_LENGTH_CHECK = (() => {
  const cells = new Set<string>();
  for (let i = 0; i < 52; i++) {
    const c = tokenCell('red', 0, 'onBoard', 0, 0, i);
    cells.add(`${c[0]},${c[1]}`);
  }
  return cells.size;
})();
