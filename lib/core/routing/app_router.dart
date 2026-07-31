import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/features/game/gameplay_screen.dart';
import 'package:ludo_arena/features/game/mode_screen.dart';
import 'package:ludo_arena/features/game/result_placeholder_screen.dart';
import 'package:ludo_arena/features/game/rules_screen.dart';
import 'package:ludo_arena/features/game/setup_screen.dart';
import 'package:ludo_arena/features/home/home_screen.dart';
import 'package:ludo_arena/features/profile/profile_screen.dart';
import 'package:ludo_arena/features/settings/about_screen.dart';
import 'package:ludo_arena/features/settings/help_screen.dart';
import 'package:ludo_arena/features/settings/settings_screen.dart';
import 'package:ludo_arena/features/splash/splash_screen.dart';
import 'package:ludo_arena/features/statistics/statistics_screen.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.mode,
        builder: (context, state) => const ModeScreen(),
      ),
      GoRoute(
        path: AppRoutes.setup,
        builder: (context, state) => const SetupScreen(),
      ),
      GoRoute(
        path: AppRoutes.rules,
        builder: (context, state) => const RulesScreen(),
      ),
      GoRoute(
        path: AppRoutes.game,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'local';
          return GameplayScreen(gameId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.result,
        builder: (context, state) => const ResultPlaceholderScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.statistics,
        builder: (context, state) => const StatisticsScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.help,
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        path: AppRoutes.about,
        builder: (context, state) => const AboutScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.uri}'),
      ),
    ),
  );
}
