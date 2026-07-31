import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/player.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.player,
    required this.active,
    this.compact = false,
  });

  final Player player;
  final bool active;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final color = BoardLayout.seatColor(player.seat);
    final glow = BoardLayout.seatGlow(player.seat);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      child: GlassCard(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 8 : 10,
          vertical: compact ? 6 : 8,
        ),
        borderRadius: 14,
        borderColor: active ? glow : color.withValues(alpha: 0.35),
        glowColor: active ? glow : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: compact ? 28 : 30,
              height: compact ? 28 : 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.lerp(color, Colors.white, 0.25)!,
                    color,
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.45),
                ),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: glow.withValues(alpha: 0.55),
                          blurRadius: 10,
                        ),
                      ]
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                player.name.isNotEmpty ? player.name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    player.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: active
                          ? ArenaColors.goldLight
                          : ArenaColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: compact ? 11 : 12,
                    ),
                  ),
                  Text(
                    'M${player.momentum}',
                    style: const TextStyle(
                      color: ArenaColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            if (active) ...[
              const SizedBox(width: 6),
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: glow,
                  boxShadow: [
                    BoxShadow(color: glow.withValues(alpha: 0.7), blurRadius: 6),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
