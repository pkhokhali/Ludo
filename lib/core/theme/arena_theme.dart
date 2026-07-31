import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Builds the dark premium ThemeData for Ludo Arena Classic look.
ThemeData buildArenaTheme({ArenaThemeId themeId = ArenaThemeId.classic}) {
  final isCyber = themeId == ArenaThemeId.cyberNeon;
  final accent = isCyber ? const Color(0xFF00E5FF) : ArenaColors.gold;
  final background = isCyber ? const Color(0xFF050814) : ArenaColors.background;

  final colorScheme = ColorScheme.dark(
    primary: accent,
    secondary: isCyber ? PlayerColors.blueGlow : ArenaColors.goldLight,
    surface: ArenaColors.surface,
    error: PlayerColors.red,
    onPrimary: ArenaColors.backgroundDeep,
    onSecondary: ArenaColors.backgroundDeep,
    onSurface: ArenaColors.textPrimary,
    onError: ArenaColors.textPrimary,
  );

  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
  ).textTheme;

  final display = _safeTextTheme(() => GoogleFonts.cinzelTextTheme(base), base);
  final body = _safeTextTheme(() => GoogleFonts.outfitTextTheme(base), base);

  final textTheme = TextTheme(
    displayLarge: display.displayLarge?.copyWith(
      color: ArenaColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 40,
      letterSpacing: 1.2,
      height: 1.1,
    ),
    headlineMedium: display.headlineMedium?.copyWith(
      color: ArenaColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: 0.6,
    ),
    titleLarge: body.titleLarge?.copyWith(
      color: ArenaColors.textPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.2,
    ),
    bodyLarge: body.bodyLarge?.copyWith(
      color: ArenaColors.textPrimary,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    bodyMedium: body.bodyMedium?.copyWith(
      color: ArenaColors.textSecondary,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelLarge: body.labelLarge?.copyWith(
      color: ArenaColors.textPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.4,
    ),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: background,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: display.titleLarge?.copyWith(
        color: ArenaColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
        shadows: [
          Shadow(color: accent.withValues(alpha: 0.45), blurRadius: 12),
        ],
      ),
      iconTheme: IconThemeData(color: accent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: ArenaColors.backgroundDeep,
        elevation: 6,
        shadowColor: accent.withValues(alpha: 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: _safeTextStyle(
          () => GoogleFonts.outfit(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
          ),
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
          ),
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color: ArenaColors.surfaceGlass,
      elevation: 8,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: ArenaColors.border),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: ArenaColors.border,
      thickness: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ArenaColors.surface,
      contentTextStyle: _safeTextStyle(
        () => GoogleFonts.outfit(color: ArenaColors.textPrimary),
        const TextStyle(color: ArenaColors.textPrimary),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

TextTheme _safeTextTheme(TextTheme Function() build, TextTheme fallback) {
  try {
    return build();
  } catch (_) {
    return fallback;
  }
}

TextStyle _safeTextStyle(TextStyle Function() build, TextStyle fallback) {
  try {
    return build();
  } catch (_) {
    return fallback;
  }
}
