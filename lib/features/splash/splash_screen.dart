import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/arena_brand_mark.dart';

/// Brand splash — navigates to Home after intro animation.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      const Duration(milliseconds: AnimationDurations.splashMs),
      () {
        if (!mounted) return;
        context.go(AppRoutes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;

    return Scaffold(
      body: ArenaBackground(
        cyber: cyber,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ArenaBrandMark(size: 128)
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .scale(begin: const Offset(0.72, 0.72))
                    .then()
                    .shimmer(
                      duration: 1400.ms,
                      color: ArenaColors.goldLight.withValues(alpha: 0.35),
                    ),
                const SizedBox(height: 32),
                Text(
                  AppConstants.appName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: ArenaColors.goldLight,
                        fontSize: 42,
                        letterSpacing: 2.4,
                      ),
                ).animate().fadeIn(delay: 220.ms, duration: 520.ms),
                const SizedBox(height: 12),
                Text(
                  AppConstants.tagline,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        letterSpacing: 0.4,
                      ),
                ).animate().fadeIn(delay: 420.ms, duration: 520.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
