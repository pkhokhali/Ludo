import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

/// Game mode picker — Classic, Power, Quick, AI, Pass & Play.
class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modes = const [
      _ModeItem('Classic', 'Traditional Ludo rules', Icons.grid_view, 'classic'),
      _ModeItem('Power Mode', 'Shields, portals, momentum', Icons.bolt, 'power'),
      _ModeItem('Quick Match', 'Faster rounds', Icons.speed, 'quick'),
      _ModeItem('AI Match', 'Human vs AI', Icons.smart_toy, 'ai'),
      _ModeItem('Pass & Play', 'Share one device', Icons.people, 'pass_play'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Game Mode')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: modes.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final m = modes[index];
          return GlassCard(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: ArenaColors.gold.withValues(alpha: 0.2),
                child: Icon(m.icon, color: ArenaColors.goldLight),
              ),
              title: Text(m.title),
              subtitle: Text(m.subtitle),
              trailing: const Icon(Icons.chevron_right, color: ArenaColors.gold),
              onTap: () => context.push(
                '${AppRoutes.setup}?mode=${m.id}',
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ModeItem {
  const _ModeItem(this.title, this.subtitle, this.icon, this.id);
  final String title;
  final String subtitle;
  final IconData icon;
  final String id;
}
