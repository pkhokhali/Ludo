import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';

class TurnBanner extends StatelessWidget {
  const TurnBanner({super.key, required this.playerName, required this.seat});

  final String playerName;
  final PlayerSeat seat;

  @override
  Widget build(BuildContext context) {
    final color = BoardLayout.seatColor(seat);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: ArenaColors.surfaceGlass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.7)),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 12),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Current Turn',
            style: TextStyle(color: ArenaColors.textSecondary, fontSize: 10),
          ),
          Text(
            playerName,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
