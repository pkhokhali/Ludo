import 'package:flutter/material.dart';

/// Player seat colors matching the gameplay reference (Image 1).
abstract final class PlayerColors {
  static const Color red = Color(0xFFC62828);
  static const Color redHighlight = Color(0xFFFF5252);
  static const Color redGlow = Color(0xFFFF1744);

  static const Color blue = Color(0xFF1565C0);
  static const Color blueHighlight = Color(0xFF448AFF);
  static const Color blueGlow = Color(0xFF2979FF);

  static const Color green = Color(0xFF2E7D32);
  static const Color greenHighlight = Color(0xFF69F0AE);
  static const Color greenGlow = Color(0xFF00E676);

  static const Color yellow = Color(0xFFF9A825);
  static const Color yellowHighlight = Color(0xFFFFEA00);
  static const Color yellowGlow = Color(0xFFFFD600);

  static const List<Color> seats = [red, blue, green, yellow];
  static const List<Color> seatGlows = [redGlow, blueGlow, greenGlow, yellowGlow];
}

/// Navy / gold premium palette from the reference screenshot.
abstract final class ArenaColors {
  static const Color background = Color(0xFF0D1B2A);
  static const Color backgroundDeep = Color(0xFF071018);
  static const Color surface = Color(0xFF1B2838);
  static const Color surfaceGlass = Color(0xCC152232);
  static const Color border = Color(0x33FFFFFF);
  static const Color gold = Color(0xFFD4A017);
  static const Color goldLight = Color(0xFFF0C75E);
  static const Color goldDark = Color(0xFF8B6914);
  static const Color pathTile = Color(0xFFF5F0E8);
  static const Color pathTileShadow = Color(0xFFD8D0C4);
  static const Color safeStar = Color(0xFF9E9E9E);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color coin = Color(0xFFFFC107);
  static const Color gem = Color(0xFF42A5F5);
}

/// Theme identifiers for Classic + Cyber Neon (v1.0).
enum ArenaThemeId {
  classic,
  cyberNeon,
}

extension ArenaThemeIdX on ArenaThemeId {
  String get storageKey => name;

  String get displayName => switch (this) {
        ArenaThemeId.classic => 'Classic',
        ArenaThemeId.cyberNeon => 'Cyber Neon',
      };
}
