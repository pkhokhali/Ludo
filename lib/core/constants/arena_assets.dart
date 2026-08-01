/// Asset path constants for Ludo Arena design pack.
abstract final class ArenaAssets {
  static const String logo = 'assets/images/ludo_logo.png';
  static const String splash = 'assets/images/splash_arena.png';
  static const String board = 'assets/images/ludo_board.png';
  static const String settingsGear = 'assets/images/settings_gear.png';

  static const List<String> diceFaces = [
    'assets/images/dice_1.png',
    'assets/images/dice_2.png',
    'assets/images/dice_3.png',
    'assets/images/dice_4.png',
    'assets/images/dice_5.png',
    'assets/images/dice_6.png',
  ];

  static String diceFace(int value) =>
      diceFaces[(value.clamp(1, 6) - 1)];
}
