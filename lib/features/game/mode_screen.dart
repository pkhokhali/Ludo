import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/mode_select_card.dart';

/// Game mode picker — Classic, Power, Quick, AI, Pass & Play.
class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modes = const [
      _ModeItem(
        'Classic',
        'Traditional Ludo rules',
        Icons.grid_view_rounded,
        'classic',
        PlayerColors.red,
      ),
      _ModeItem(
        'Power Mode',
        'Shields, portals, momentum',
        Icons.bolt_rounded,
        'power',
        PlayerColors.blue,
      ),
      _ModeItem(
        'Quick Match',
        'Faster rounds',
        Icons.speed_rounded,
        'quick',
        PlayerColors.green,
      ),
      _ModeItem(
        'AI Match',
        'Human vs AI',
        Icons.smart_toy_rounded,
        'ai',
        PlayerColors.yellow,
      ),
      _ModeItem(
        'Pass & Play',
        'Share one device',
        Icons.people_rounded,
        'pass_play',
        ArenaColors.gold,
      ),
    ];

    return ArenaScaffold(
      title: 'Game Mode',
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.paddingOf(context).top + kToolbarHeight + 12,
          20,
          24,
        ),
        itemCount: modes.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final m = modes[index];
          return ModeSelectCard(
            title: m.title,
            subtitle: m.subtitle,
            icon: m.icon,
            accent: m.accent,
            onTap: () => context.push('${AppRoutes.setup}?mode=${m.id}'),
          )
              .animate()
              .fadeIn(delay: (80 * index).ms, duration: 360.ms)
              .slideX(begin: 0.06, end: 0);
        },
      ),
    );
  }
}

class _ModeItem {
  const _ModeItem(this.title, this.subtitle, this.icon, this.id, this.accent);
  final String title;
  final String subtitle;
  final IconData icon;
  final String id;
  final Color accent;
}
