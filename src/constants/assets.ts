export const ArenaAssets = {
  logo: require('../../assets/images/ludo_logo.png'),
  splash: require('../../assets/images/splash_arena.png'),
  board: require('../../assets/images/ludo_board.png'),
  settingsGear: require('../../assets/images/settings_gear.png'),
  dice: [
    require('../../assets/images/dice_1.png'),
    require('../../assets/images/dice_2.png'),
    require('../../assets/images/dice_3.png'),
    require('../../assets/images/dice_4.png'),
    require('../../assets/images/dice_5.png'),
    require('../../assets/images/dice_6.png'),
  ],
} as const;

export function diceFace(value: number) {
  const i = Math.min(6, Math.max(1, Math.floor(value))) - 1;
  return ArenaAssets.dice[i];
}

export const APP_VERSION = '1.0.2';
