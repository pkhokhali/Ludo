import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/routing/app_routes.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/features/game/game_controller.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/models/game_state.dart';
import 'package:ludo_arena/models/token.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';
import 'package:ludo_arena/widgets/board/board_painter.dart';
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
      final to = BoardLayout.toPixel(const Offset(7, 7.8), boardSize.shortestSide);
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

    if (session == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: ArenaColors.gold)),
      );
    }

    final gs = session.state;
    final player = gs.players[gs.currentPlayerIndex];
    final legalIds = {
      for (final m in ref.read(gameControllerProvider.notifier).legalMoves())
        m.token.id,
    };

    if (gs.isFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.go(AppRoutes.result);
      });
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ArenaColors.backgroundDeep,
              ArenaColors.background,
              Color(0xFF152238),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => _showPause(context),
                      icon: const Icon(Icons.pause, color: ArenaColors.gold),
                    ),
                    Expanded(
                      child: TurnBanner(
                        playerName: player.name,
                        seat: player.seat,
                      ),
                    ),
                    Text(
                      gs.lastDiceValue != null ? '🎲 ${gs.lastDiceValue}' : '',
                      style: const TextStyle(color: ArenaColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final side = constraints.biggest.shortestSide * 0.96;
                    final boardSize = Size(side, side);
                    return Center(
                      child: SizedBox(
                        width: side,
                        height: side,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => _onBoardTap(session, boardSize),
                          child: Stack(
                            children: [
                              RepaintBoundary(
                                child: CustomPaint(
                                  size: boardSize,
                                  painter: BoardPainter(
                                    safeCells: session.ruleConfig.classic.safeCells
                                        .toSet(),
                                  ),
                                ),
                              ),
                              ..._tokenWidgets(gs, boardSize, legalIds),
                              if (_diceVisible)
                                Positioned(
                                  left: _dice.rolling ? _dice.position.dx - 24 : _dicePos.dx - 24,
                                  top: _dice.rolling ? _dice.position.dy - 24 : _dicePos.dy - 24,
                                  child: FloorDiceWidget(
                                    value: _dice.face,
                                    rolling: _dice.rolling,
                                    size: 48,
                                  ),
                                ),
                              // Corner player cards
                              ..._playerCards(gs),
                              if (gs.phase == GamePhase.rolling &&
                                  player.type == PlayerType.human)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 12,
                                  child: Center(
                                    child: Text(
                                      'Tap the board to roll',
                                      style: TextStyle(
                                        color: ArenaColors.goldLight
                                            .withValues(alpha: 0.9),
                                        fontWeight: FontWeight.w600,
                                        shadows: const [
                                          Shadow(
                                            color: Colors.black54,
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const _ActionChip(icon: Icons.emoji_emotions_outlined, label: 'Emoji'),
                    const _ActionChip(icon: Icons.chat_bubble_outline, label: 'Chat'),
                    _ActionChip(
                      icon: Icons.exit_to_app,
                      label: 'Exit',
                      onTap: () => context.go(AppRoutes.home),
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
                ? () =>
                    ref.read(gameControllerProvider.notifier).moveToken(token.id)
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

  List<Widget> _playerCards(GameState gs) {
    final cards = <Widget>[];
    for (var i = 0; i < gs.players.length; i++) {
      final p = gs.players[i];
      final active = i == gs.currentPlayerIndex;
      final alignment = switch (p.seat) {
        PlayerSeat.red => Alignment.bottomLeft,
        PlayerSeat.blue => Alignment.topLeft,
        PlayerSeat.yellow => Alignment.topRight,
        PlayerSeat.green => Alignment.bottomRight,
      };
      cards.add(
        Align(
          alignment: alignment,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: PlayerCard(player: p, active: active),
          ),
        ),
      );
    }
    return cards;
  }

  void _showPause(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: ArenaColors.surface,
        title: const Text('Paused'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Resume'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.go(AppRoutes.home);
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: ArenaColors.surface,
            child: Icon(icon, color: ArenaColors.goldLight, size: 20),
          ),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
