import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key, required this.player, required this.active});

  final Player player;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final glow = BoardLayout.seatGlow(player.seat);
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      borderRadius: 14,
      borderColor: active ? glow : null,
      glowColor: active ? glow : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: BoardLayout.seatColor(player.seat),
            child: Text(
              player.name.isNotEmpty ? player.name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                player.name,
                style: const TextStyle(
                  color: ArenaColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                '${player.coinsEarned} · M${player.momentum}',
                style: const TextStyle(
                  color: ArenaColors.textSecondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
