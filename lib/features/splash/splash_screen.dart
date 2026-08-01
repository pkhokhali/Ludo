import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/arena_brand_mark.dart';
import 'package:ludo_arena/widgets/dice/floor_dice_widget.dart';
import 'package:ludo_arena/widgets/token/token_widget.dart';

/// Cinematic arena splash — dice tumble, tokens converge, brand reveal.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _pulse;
  late final AnimationController _diceSpin;
  int _diceFace = 6;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _diceSpin = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
    _diceSpin.addListener(() {
      if (_diceSpin.value > 0.08 &&
          (_diceSpin.value * 12).floor() !=
              ((_diceSpin.value - 0.01) * 12).floor()) {
        setState(() => _diceFace = 1 + math.Random().nextInt(6));
      }
    });

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
    _pulse.dispose();
    _diceSpin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: ArenaBackground(
        cyber: cyber,
        child: SafeArea(
          child: Stack(
            children: [
              // Soft spotlight
              AnimatedBuilder(
                animation: _pulse,
                builder: (context, _) {
                  final t = _pulse.value;
                  return Center(
                    child: Container(
                      width: size.width * (0.55 + t * 0.08),
                      height: size.width * (0.55 + t * 0.08),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            ArenaColors.gold.withValues(alpha: 0.18 + t * 0.08),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Orbiting seat tokens
              ...List.generate(4, (i) {
                final seat = PlayerSeat.values[i];
                return _OrbitingToken(
                  seat: seat,
                  index: i,
                  pulse: _pulse,
                );
              }),

              // Main brand stack
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ArenaBrandMark(size: 108)
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .scale(begin: const Offset(0.7, 0.7))
                        .then()
                        .shimmer(
                          duration: 1200.ms,
                          color: ArenaColors.goldLight.withValues(alpha: 0.4),
                        ),
                    const SizedBox(height: 22),
                    Text(
                      AppConstants.appName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: ArenaColors.goldLight,
                            fontSize: 40,
                            letterSpacing: 3.2,
                          ),
                    ).animate().fadeIn(delay: 180.ms, duration: 500.ms),
                    const SizedBox(height: 8),
                    Text(
                      'ENTER THE ARENA',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: ArenaColors.gold,
                            letterSpacing: 4,
                            fontSize: 12,
                          ),
                    ).animate().fadeIn(delay: 320.ms, duration: 450.ms),
                    const SizedBox(height: 28),
                    // Rolling wood dice
                    AnimatedBuilder(
                      animation: _diceSpin,
                      builder: (context, child) {
                        final twist = math.sin(_diceSpin.value * math.pi * 2) * 0.45;
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateZ(twist)
                            ..rotateX(_diceSpin.value * math.pi * 2),
                          child: child,
                        );
                      },
                      child: FloorDiceWidget(
                        value: _diceFace,
                        rolling: true,
                        size: 64,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 400.ms)
                        .slideY(begin: 0.4, end: 0),
                    const SizedBox(height: 18),
                    Text(
                      AppConstants.tagline,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ).animate().fadeIn(delay: 500.ms, duration: 500.ms),
                  ],
                ),
              ),

              // Bottom loading bar
              Positioned(
                left: 48,
                right: 48,
                bottom: 28,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: (
                        const LinearProgressIndicator(
                          minHeight: 4,
                          backgroundColor: ArenaColors.surface,
                          color: ArenaColors.gold,
                        )
                      )
                          .animate(onPlay: (c) => c.repeat())
                          .shimmer(
                            duration: 1200.ms,
                            color: ArenaColors.goldLight,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Loading match arena…',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrbitingToken extends StatelessWidget {
  const _OrbitingToken({
    required this.seat,
    required this.index,
    required this.pulse,
  });

  final PlayerSeat seat;
  final int index;
  final AnimationController pulse;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, child) {
        final size = MediaQuery.sizeOf(context);
        final cx = size.width / 2;
        final cy = size.height / 2 - 24;
        final radius = math.min(size.width, size.height) * 0.34;
        final angle =
            (index * math.pi / 2) + pulse.value * math.pi * 0.35 - math.pi / 4;
        final x = cx + radius * math.cos(angle) - 18;
        final y = cy + radius * math.sin(angle) - 24;
        return Positioned(
          left: x,
          top: y,
          child: child!,
        );
      },
      child: TokenWidget(seat: seat, size: 36)
          .animate()
          .fadeIn(delay: (120 * index).ms, duration: 450.ms)
          .scale(begin: const Offset(0.4, 0.4)),
    );
  }
}
