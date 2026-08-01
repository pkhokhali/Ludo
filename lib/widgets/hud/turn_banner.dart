import 'package:flutter/material.dart';
import 'package:ludo_arena/core/constants/arena_assets.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';
import 'package:ludo_arena/widgets/dice/floor_dice_widget.dart';

class TurnBanner extends StatelessWidget {
  const TurnBanner({super.key, required this.playerName, required this.seat});

  final String playerName;
  final PlayerSeat seat;

  @override
  Widget build(BuildContext context) {
    final color = BoardLayout.seatColor(seat);
    final glow = BoardLayout.seatGlow(seat);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ArenaColors.surfaceGlass,
            color.withValues(alpha: 0.18),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withValues(alpha: 0.75)),
        boxShadow: [
          BoxShadow(color: glow.withValues(alpha: 0.4), blurRadius: 14),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(color: glow.withValues(alpha: 0.8), blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'CURRENT TURN',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: ArenaColors.textSecondary,
                        fontSize: 9,
                        letterSpacing: 1.2,
                      ),
                ),
                Text(
                  playerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ArenaColors.goldLight,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Compact cream dice face shown in the top HUD (not the floor die).
class DiceHudBadge extends StatelessWidget {
  const DiceHudBadge({super.key, this.value});

  final int? value;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null;
    if (hasValue) {
      final face = value!.clamp(1, 6);
      return SizedBox(
        width: 44,
        height: 44,
        child: Image.asset(
          ArenaAssets.diceFace(face),
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, _, _) => CustomPaint(
            painter: CreamDicePainter(value: face, showShadow: true),
          ),
        ),
      );
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ArenaColors.surfaceGlass,
        border: Border.all(color: ArenaColors.border),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.casino_rounded,
        color: ArenaColors.gold.withValues(alpha: 0.55),
        size: 22,
      ),
    );
  }
}
