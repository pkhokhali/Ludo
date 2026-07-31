import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_config.dart';
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

  @override
  Widget build(BuildContext context) {
    final modeRaw =
        GoRouterState.of(context).uri.queryParameters['mode'] ?? 'classic';
    final mode = _parseMode(modeRaw);

    return Scaffold(
      appBar: AppBar(title: Text('Setup · ${mode.name}')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Players', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 2, label: Text('2')),
                      ButtonSegment(value: 3, label: Text('3')),
                      ButtonSegment(value: 4, label: Text('4')),
                    ],
                    selected: {_players},
                    onSelectionChanged: (s) =>
                        setState(() => _players = s.first),
                  ),
                ],
              ),
            ),
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
                    Wrap(
                      spacing: 8,
                      children: AiDifficulty.values
                          .map(
                            (d) => ChoiceChip(
                              label: Text(d.name.toUpperCase()),
                              selected: _difficulty == d,
                              selectedColor:
                                  ArenaColors.gold.withValues(alpha: 0.35),
                              onSelected: (_) =>
                                  setState(() => _difficulty = d),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            OutlinedButton(
              onPressed: () => context.push(AppRoutes.rules),
              child: const Text('Rule Settings'),
            ),
            const SizedBox(height: 12),
            PremiumButton(
              label: 'Start Match',
              icon: Icons.sports_esports,
              onPressed: () => _start(mode),
            ),
          ],
        ),
      ),
    );
  }
}
