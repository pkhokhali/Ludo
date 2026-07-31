import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_config.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Player count, AI difficulty, and mode-specific setup.
class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  int _players = 4;
  AiDifficulty _difficulty = AiDifficulty.medium;

  GameMode _parseMode(String raw) => switch (raw) {
        'power' => GameMode.power,
        'quick' => GameMode.quick,
        'ai' => GameMode.ai,
        'pass_play' => GameMode.passPlay,
        _ => GameMode.classic,
      };

  GameConfig _buildConfig(GameMode mode) {
    final seats = PlayerSeat.values.take(_players).toList();
    final slots = <PlayerSlotConfig>[];

    for (var i = 0; i < seats.length; i++) {
      final seat = seats[i];
      if (mode == GameMode.ai) {
        slots.add(
          PlayerSlotConfig(
            seat: seat,
            type: i == 0 ? PlayerType.human : PlayerType.ai,
            name: i == 0 ? 'You' : 'CPU $i',
            aiDifficulty: i == 0 ? null : _difficulty,
          ),
        );
      } else {
        slots.add(
          PlayerSlotConfig(
            seat: seat,
            type: PlayerType.human,
            name: 'Player ${i + 1}',
          ),
        );
      }
    }

    return GameConfig(
      mode: mode,
      playerCount: _players,
      slots: slots,
    );
  }

  Future<void> _start(GameMode mode) async {
    final config = _buildConfig(mode);
    await ref.read(gameControllerProvider.notifier).start(config);
    if (!mounted) return;
    context.go(AppRoutes.gamePath('local'));
  }

  String _modeLabel(GameMode mode) => switch (mode) {
        GameMode.power => 'Power',
        GameMode.quick => 'Quick',
        GameMode.ai => 'AI',
        GameMode.passPlay => 'Pass & Play',
        GameMode.classic => 'Classic',
      };

  @override
  Widget build(BuildContext context) {
    final modeRaw =
        GoRouterState.of(context).uri.queryParameters['mode'] ?? 'classic';
    final mode = _parseMode(modeRaw);
    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'Setup · ${_modeLabel(mode)}',
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              glowColor: ArenaColors.gold,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Players',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Choose how many seats join the match',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [2, 3, 4].map((count) {
                      final selected = _players == count;
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: count == 4 ? 0 : 8),
                          child: _PlayerCountTile(
                            count: count,
                            selected: selected,
                            onTap: () => setState(() => _players = count),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 360.ms).slideY(begin: 0.06, end: 0),
            const SizedBox(height: 16),
            if (mode == GameMode.ai)
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Difficulty',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: AiDifficulty.values.map((d) {
                        final selected = _difficulty == d;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: d == AiDifficulty.values.last ? 0 : 8,
                            ),
                            child: _DifficultyChip(
                              label: d.name.toUpperCase(),
                              selected: selected,
                              onTap: () => setState(() => _difficulty = d),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 80.ms, duration: 360.ms)
                  .slideY(begin: 0.06, end: 0),
            const Spacer(),
            OutlinedButton(
              onPressed: () => context.push(AppRoutes.rules),
              style: OutlinedButton.styleFrom(
                foregroundColor: ArenaColors.goldLight,
                side: BorderSide(
                  color: ArenaColors.gold.withValues(alpha: 0.5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Rule Settings'),
            ),
            const SizedBox(height: 12),
            PremiumButton(
              label: 'Start Match',
              icon: Icons.sports_esports_rounded,
              onPressed: () => _start(mode),
            ).animate().fadeIn(delay: 140.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}

class _PlayerCountTile extends StatelessWidget {
  const _PlayerCountTile({
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final seats = PlayerColors.seats.take(count).toList();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: selected
                ? ArenaColors.gold.withValues(alpha: 0.18)
                : ArenaColors.surface.withValues(alpha: 0.45),
            border: Border.all(
              color: selected ? ArenaColors.gold : ArenaColors.border,
              width: selected ? 1.6 : 1,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: ArenaColors.gold.withValues(alpha: 0.28),
                      blurRadius: 12,
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: selected
                          ? ArenaColors.goldLight
                          : ArenaColors.textPrimary,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: seats
                    .map(
                      (c) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: c,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: c.withValues(alpha: 0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DifficultyChip extends StatelessWidget {
  const _DifficultyChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: selected
                ? ArenaColors.gold.withValues(alpha: 0.28)
                : ArenaColors.surface.withValues(alpha: 0.4),
            border: Border.all(
              color: selected ? ArenaColors.gold : ArenaColors.border,
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: selected
                      ? ArenaColors.goldLight
                      : ArenaColors.textSecondary,
                ),
          ),
        ),
      ),
    );
  }
}
