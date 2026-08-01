import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/constants/arena_assets.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';

/// Arena Mode splash — design-pack full-bleed art + loading bar.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _load;

  @override
  void initState() {
    super.initState();
    _load = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AnimationDurations.splashMs),
    )..forward();

    Future<void>.delayed(
      const Duration(milliseconds: AnimationDurations.splashMs),
      () {
        if (!mounted) return;
        context.go(AppRoutes.home);
      },
    );
  }

  @override
  void dispose() {
    _load.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050814),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ArenaAssets.splash,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            errorBuilder: (_, _, _) => const ColoredBox(color: Color(0xFF050814)),
          ),
          // Soft vignette so loading UI stays readable on any crop.
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xCC050814),
                ],
                stops: [0.0, 0.55, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 28, 24),
              child: Column(
                children: [
                  Text(
                    'ARENA MODE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: const Color(0xFF00E5FF),
                          letterSpacing: 4,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                  ).animate().fadeIn(duration: 400.ms),
                  const Spacer(),
                  Text(
                    'LUDO',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 52,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 4,
                          shadows: const [
                            Shadow(color: Color(0xFF00E5FF), blurRadius: 18),
                          ],
                        ),
                  ).animate().fadeIn(delay: 120.ms, duration: 500.ms),
                  const SizedBox(height: 6),
                  Text(
                    'ROLL  •  RACE  •  RULE THE BOARD',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ArenaColors.textPrimary,
                          letterSpacing: 2.2,
                          fontSize: 11,
                        ),
                  ).animate().fadeIn(delay: 220.ms, duration: 450.ms),
                  const SizedBox(height: 36),
                  Text(
                    'LOADING',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ArenaColors.textSecondary,
                          letterSpacing: 3,
                          fontSize: 11,
                        ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedBuilder(
                    animation: _load,
                    builder: (context, _) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _load.value.clamp(0.05, 1.0),
                          minHeight: 6,
                          backgroundColor: const Color(0xFF1A2433),
                          color: const Color(0xFF00E5FF),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'v 1.0.2',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ArenaColors.textSecondary,
                          fontSize: 11,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
