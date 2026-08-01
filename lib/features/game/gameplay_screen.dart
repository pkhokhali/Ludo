import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/token.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';
import 'package:ludo_arena/widgets/board/board_painter.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/common/premium_button.dart';
import 'package:ludo_arena/widgets/dice/floor_dice_widget.dart';
import 'package:ludo_arena/widgets/hud/player_card.dart';
import 'package:ludo_arena/widgets/hud/turn_banner.dart';
import 'package:ludo_arena/widgets/token/token_widget.dart';

/// Full gameplay screen — board, peg tokens, floor dice.
class GameplayScreen extends ConsumerStatefulWidget {
  const GameplayScreen({super.key, required this.gameId});

  final String gameId;

  @override
  ConsumerState<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends ConsumerState<GameplayScreen>
    with TickerProviderStateMixin {
  final _dice = DiceRollController();
  Offset _dicePos = Offset.zero;
  bool _diceVisible = false;

  @override
  void initState() {
    super.initState();
    _dice.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _dice.dispose();
    super.dispose();
  }

  Future<void> _onBoardTap(GameSession session, Size boardSize) async {
    final gs = session.state;
    if (gs.isFinished) {
      context.go(AppRoutes.result);
      return;
    }
    final player = gs.players[gs.currentPlayerIndex];
    if (player.type != PlayerType.human) return;

    if (gs.phase == GamePhase.rolling && !gs.awaitingMove) {
      await ref.read(gameControllerProvider.notifier).requestRoll();
      final updated = ref.read(gameControllerProvider);
      final face = updated?.pendingDiceFace ?? updated?.state.lastDiceValue;
      if (face == null || !mounted) return;

      final seat = player.seat;
      final from = BoardLayout.toPixel(
        BoardLayout.yardPedestal(seat, 0) + const Offset(2.5, -1),
        boardSize.shortestSide,
      );
      final to =
          BoardLayout.toPixel(const Offset(7, 7.8), boardSize.shortestSide);
      setState(() {
        _diceVisible = true;
        _dicePos = from;
      });
      await _dice.play(from: from, to: to, finalFace: face, vsync: this);
      setState(() => _dicePos = _dice.position);
      ref.read(gameControllerProvider.notifier).finishDiceAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(gameControllerProvider);
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;

    if (session == null) {
      return Scaffold(
        body: ArenaBackground(
          cyber: cyber,
          child: const Center(
            child: CircularProgressIndicator(color: ArenaColors.gold),
          ),
        ),
      );
    }

    final gs = session.state;
    final player = gs.players[gs.currentPlayerIndex];
    final moves = ref.read(gameControllerProvider.notifier).legalMoves();
    final legalIds = {for (final m in moves) m.token.id};
    final highlightCells = {
      for (final m in moves)
        if (m.toStatus == TokenStatus.onBoard) m.toPosition,
    };
    final awaitingRoll =
        gs.phase == GamePhase.rolling && player.type == PlayerType.human;

    if (gs.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go(AppRoutes.result);
      });
    }

    return Scaffold(
      body: ArenaBackground(
        cyber: cyber,
        child: SafeArea(
          minimum: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  children: [
                    _HudIconButton(
                      icon: Icons.pause_rounded,
                      onPressed: () => _showPause(context),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TurnBanner(
                        playerName: player.name,
                        seat: player.seat,
                      ),
                    ),
                    const SizedBox(width: 8),
                    DiceHudBadge(value: gs.lastDiceValue),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final side = constraints.biggest.shortestSide * 0.98;
                    final boardSize = Size(side, side);
                    return Center(
                      child: SizedBox(
                        width: side,
                        height: side,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _onBoardTap(session, boardSize),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              RepaintBoundary(
                                child: CustomPaint(
                                  size: boardSize,
                                  painter: BoardPainter(
                                    safeCells: session
                                        .ruleConfig.classic.safeCells
                                        .toSet(),
                                    highlightedCells: highlightCells,
                                  ),
                                ),
                              ),
                              ..._tokenWidgets(gs, boardSize, legalIds),
                              if (_diceVisible)
                                Positioned(
                                  left: (_dice.rolling
                                          ? _dice.position.dx
                                          : _dicePos.dx) -
                                      24,
                                  top: (_dice.rolling
                                          ? _dice.position.dy
                                          : _dicePos.dy) -
                                      24,
                                  child: FloorDiceWidget(
                                    value: _dice.face,
                                    rolling: _dice.rolling,
                                    size: 54,
                                  ),
                                ),
                              if (awaitingRoll && !_dice.rolling)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 10,
                                  child: Center(
                                    child: _RollHint()
                                        .animate(
                                          onPlay: (c) =>
                                              c.repeat(reverse: true),
                                        )
                                        .fade(
                                          begin: 0.55,
                                          end: 1,
                                          duration: 900.ms,
                                        )
                                        .scale(
                                          begin: const Offset(0.98, 0.98),
                                          end: const Offset(1.02, 1.02),
                                          duration: 900.ms,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
                child: SizedBox(
                  height: 56,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: gs.players.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, i) {
                      final p = gs.players[i];
                      return SizedBox(
                        width: (MediaQuery.sizeOf(context).width - 40) /
                            gs.players.length.clamp(2, 4),
                        child: PlayerCard(
                          player: p,
                          active: i == gs.currentPlayerIndex,
                          compact: true,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: _BottomAction(
                        icon: Icons.menu_book_rounded,
                        label: 'Rules',
                        onTap: () => context.push(AppRoutes.rules),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _BottomAction(
                        icon: Icons.home_rounded,
                        label: 'Exit',
                        onTap: () => _showPause(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _tokenWidgets(
    GameState gs,
    Size boardSize,
    Set<String> legalIds,
  ) {
    final s = boardSize.shortestSide;
    final tokenSize = s / BoardLayout.grid * 0.85;
    final widgets = <Widget>[];

    for (final token in gs.tokens) {
      if (token.status == TokenStatus.finished) continue;
      final cell = _cellFor(token);
      final px = BoardLayout.toPixel(cell, s);
      final selected = legalIds.contains(token.id);
      widgets.add(
        Positioned(
          left: px.dx - tokenSize / 2,
          top: px.dy - tokenSize * 0.85,
          child: TokenWidget(
            seat: token.seat,
            size: tokenSize,
            selected: selected,
            onTap: selected
                ? () => ref
                    .read(gameControllerProvider.notifier)
                    .moveToken(token.id)
                : null,
          ),
        ),
      );
    }
    return widgets;
  }

  Offset _cellFor(Token token) {
    return switch (token.status) {
      TokenStatus.yard => BoardLayout.yardPedestal(token.seat, token.index),
      TokenStatus.onBoard => BoardLayout.pathCell(token.position),
      TokenStatus.homeStretch =>
        BoardLayout.homeStretch(token.seat, token.homeProgress),
      TokenStatus.finished => BoardLayout.finish(token.seat),
    };
  }

  void _showPause(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black54,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          glowColor: ArenaColors.gold,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Paused',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: ArenaColors.goldLight,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Match is on hold',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 22),
              PremiumButton(
                label: 'Resume',
                icon: Icons.play_arrow_rounded,
                onPressed: () => Navigator.pop(ctx),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context.go(AppRoutes.home);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: ArenaColors.goldLight,
                  side: BorderSide(
                    color: ArenaColors.gold.withValues(alpha: 0.5),
                  ),
                  minimumSize: const Size(double.infinity, 46),
                ),
                child: const Text('Exit to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HudIconButton extends StatelessWidget {
  const _HudIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ArenaColors.surfaceGlass,
      shape: const CircleBorder(
        side: BorderSide(color: ArenaColors.border),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: ArenaColors.gold, size: 22),
        ),
      ),
    );
  }
}

class _RollHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ArenaColors.backgroundDeep.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: ArenaColors.gold.withValues(alpha: 0.55)),
        boxShadow: [
          BoxShadow(
            color: ArenaColors.gold.withValues(alpha: 0.25),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.touch_app_rounded,
            size: 18,
            color: ArenaColors.goldLight.withValues(alpha: 0.95),
          ),
          const SizedBox(width: 8),
          Text(
            'Tap board to roll',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ArenaColors.goldLight,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      borderRadius: 16,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: ArenaColors.goldLight, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ArenaColors.textPrimary,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
