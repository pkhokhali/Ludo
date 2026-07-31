import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Player count, AI difficulty, and mode-specific setup (shell).
class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int _players = 4;
  String _difficulty = 'medium';

  @override
  Widget build(BuildContext context) {
    final mode = GoRouterState.of(context).uri.queryParameters['mode'] ?? 'classic';

    return Scaffold(
      appBar: AppBar(title: Text('Setup · $mode')),
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
                    onSelectionChanged: (s) => setState(() => _players = s.first),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (mode == 'ai')
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
                      children: ['easy', 'medium', 'hard', 'expert']
                          .map(
                            (d) => ChoiceChip(
                              label: Text(d.toUpperCase()),
                              selected: _difficulty == d,
                              selectedColor: ArenaColors.gold.withValues(alpha: 0.35),
                              onSelected: (_) => setState(() => _difficulty = d),
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
              onPressed: () => context.go(AppRoutes.gamePath('local')),
            ),
          ],
        ),
      ),
    );
  }
}
