import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/common/arena_brand_mark.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(gameControllerProvider);
    final winnerId = session?.state.winnerPlayerId;
    final players = session?.state.players ?? [];
    final winnerMatches = players.where((p) => p.id == winnerId);
    final winner = winnerMatches.isEmpty ? null : winnerMatches.first;
    final humanWon = winner != null && winner.type == PlayerType.human;

    return ArenaScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (humanWon)
                const ArenaBrandMark(size: 100)
                    .animate()
                    .scale(duration: 500.ms)
                    .then()
                    .shimmer(duration: 1200.ms)
              else
                Icon(
                  Icons.sentiment_dissatisfied_rounded,
                  size: 96,
                  color: ArenaColors.textSecondary,
                )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .scale(begin: const Offset(0.85, 0.85)),
              const SizedBox(height: 24),
              GlassCard(
                glowColor: humanWon ? ArenaColors.gold : null,
                child: Column(
                  children: [
                    Text(
                      humanWon ? 'Victory!' : 'Defeat',
                      style:
                          Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: humanWon
                                    ? ArenaColors.goldLight
                                    : ArenaColors.textPrimary,
                                fontSize: 36,
                              ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      winner != null
                          ? '${winner.name} takes the crown'
                          : 'Match complete',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 120.ms, duration: 400.ms),
              const SizedBox(height: 36),
              PremiumButton(
                label: 'Back to Home',
                icon: Icons.home_rounded,
                onPressed: () async {
                  final prefs = ref.read(preferencesServiceProvider);
                  final ads = ref.read(adsServiceProvider);
                  final shown = await ads.maybeShowInterstitial(
                    matchesSinceLastAd: prefs.matchesSinceLastAd,
                    everyN: prefs.interstitialEveryN,
                  );
                  if (shown) {
                    await prefs.setMatchesSinceLastAd(0);
                  }
                  if (context.mounted) context.go(AppRoutes.home);
                },
              ).animate().fadeIn(delay: 220.ms, duration: 400.ms),
            ],
          ),
        ),
      ),
    );
  }
}
