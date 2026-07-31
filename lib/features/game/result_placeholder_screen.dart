import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';

/// Victory / defeat shell (Module 7–8 polish).
class ResultPlaceholderScreen extends StatelessWidget {
  const ResultPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A0A2E), ArenaColors.background],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.emoji_events, size: 88, color: ArenaColors.gold),
                const SizedBox(height: 16),
                Text(
                  'Victory!',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: ArenaColors.goldLight,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Full celebration effects arrive in Module 8.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                PremiumButton(
                  label: 'Back to Home',
                  onPressed: () => context.go(AppRoutes.home),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
