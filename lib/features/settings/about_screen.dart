import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_brand_mark.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topPad = MediaQuery.paddingOf(context).top + kToolbarHeight + 12;

    return ArenaScaffold(
      title: 'About',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, topPad, 20, 24),
        children: [
          GlassCard(
            glowColor: ArenaColors.gold,
            child: Column(
              children: [
                const ArenaBrandMark(size: 72),
                const SizedBox(height: 16),
                Text(
                  AppConstants.appName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ArenaColors.goldLight,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppConstants.tagline,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Divider(height: 28),
                Text(
                  'Version 1.0.0 (Phase 1 — Offline)\n'
                  'Package: ${AppConstants.packageName}\n\n'
                  'Built with Flutter · Riverpod · Go Router · Hive\n\n'
                  'Privacy: see PRIVACY.md in the project repo. '
                  'Replace with your hosted policy before Play Store launch.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05, end: 0),
        ],
      ),
    );
  }
}
