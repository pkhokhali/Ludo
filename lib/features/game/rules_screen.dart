import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/engine/rule_engine/rule_config_providers.dart';
import 'package:ludo_arena/models/rule_config.dart';
import 'package:ludo_arena/widgets/common/arena_rule_widgets.dart';
import 'package:ludo_arena/widgets/common/arena_scaffold.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';
import 'package:ludo_arena/widgets/dice/floor_dice_widget.dart';

/// Game rules editor — Neo-Classic list with help popups + check/X toggles.
class RulesScreen extends ConsumerStatefulWidget {
  const RulesScreen({super.key});

  @override
  ConsumerState<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends ConsumerState<RulesScreen> {
  RuleConfig? _config;
  bool _loading = true;

  static const _defaultSafe = [1, 9, 14, 22, 27, 35, 40, 48];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final config = await ref.read(ruleConfigRepositoryProvider).load();
    if (!mounted) return;
    setState(() {
      _config = config;
      _loading = false;
    });
  }

  Future<void> _persist(RuleConfig next) async {
    setState(() => _config = next);
    await ref.read(ruleConfigRepositoryProvider).saveOverride(next);
    ref.invalidate(ruleConfigProvider);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || _config == null) {
      return const ArenaScaffold(
        title: 'Game Rules',
        body: Center(
          child: CircularProgressIndicator(color: ArenaColors.gold),
        ),
      );
    }

    final classic = _config!.classic;
    final power = _config!.power;
    final features = power.features;
    final showStars = classic.safeCells.isNotEmpty;

    return ArenaScaffold(
      title: 'Game Rules',
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const ArenaSectionBanner('Start coins at'),
                const SizedBox(height: 10),
                GlassCard(
                  child: Row(
                    children: [
                      _DiceUnlockChoice(
                        face: 1,
                        selected: classic.unlockRoll == 1,
                        onTap: () => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(unlockRoll: 1),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      _DiceUnlockChoice(
                        face: 6,
                        selected: classic.unlockRoll == 6,
                        onTap: () => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(unlockRoll: 6),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const ArenaHelpChip(
                        title: 'Start coins at',
                        body:
                            'Choose which dice face unlocks a token from the yard. '
                            'Classic Ludo uses 6. Some house rules allow 1.',
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 320.ms),
                const SizedBox(height: 16),
                const ArenaSectionBanner('Game Rules'),
                const SizedBox(height: 10),
                GlassCard(
                  child: Column(
                    children: [
                      ArenaRuleRow(
                        label: '6 also gives another turn',
                        enabled: classic.extraTurnOnSix,
                        helpTitle: 'Extra turn on 6',
                        helpBody:
                            'When enabled, rolling a 6 grants another roll after '
                            'you finish moving (unless three-sixes penalty applies).',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(extraTurnOnSix: v),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: '6 also brings a coin out',
                        enabled: classic.unlockRoll == 6,
                        helpTitle: '6 brings a coin out',
                        helpBody:
                            'A roll of 6 unlocks a token from the yard onto the '
                            'start cell. Disable by switching Start coins to 1.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(unlockRoll: v ? 6 : 1),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Show safe cells (stars)',
                        enabled: showStars,
                        helpTitle: 'Safe cells',
                        helpBody:
                            'Safe cells (stars) cannot be captured. Turning this '
                            'off clears marked safe cells on the board.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(
                              safeCells: v ? _defaultSafe : const <int>[],
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Skip a turn on 3 consecutive 6s',
                        enabled: classic.threeSixesRule,
                        helpTitle: 'Three sixes rule',
                        helpBody:
                            'If you roll three 6s in a row, your turn ends and '
                            'those rolls are cancelled.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(threeSixesRule: v),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Capture opponents enabled',
                        enabled: classic.captureEnabled,
                        helpTitle: 'Captures',
                        helpBody:
                            'Landing on an opponent on a non-safe cell sends '
                            'their token back to the yard.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(captureEnabled: v),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Exact count required to finish',
                        enabled: classic.exactFinish,
                        helpTitle: 'Exact finish',
                        helpBody:
                            'You must roll the exact number needed to enter the '
                            'finish. Overshooting keeps the token in place.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            classic: classic.copyWith(exactFinish: v),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const ArenaSectionBanner('Power Features'),
                const SizedBox(height: 10),
                GlassCard(
                  child: Column(
                    children: [
                      ArenaRuleRow(
                        label: 'Momentum system',
                        enabled: features.momentum,
                        helpTitle: 'Momentum',
                        helpBody:
                            'Earn Momentum from captures and milestones, then '
                            'spend it on Power abilities.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(momentum: v),
                              enabled: v,
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Shield',
                        enabled: features.shield,
                        helpTitle: 'Shield',
                        helpBody:
                            'Spend Momentum to protect a token from the next capture.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(shield: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Portal',
                        enabled: features.portal,
                        helpTitle: 'Portal',
                        helpBody:
                            'Teleport a token forward using a portal cell when enabled.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(portal: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Golden Dice',
                        enabled: features.goldenDice,
                        helpTitle: 'Golden Dice',
                        helpBody:
                            'Spend Momentum for a guaranteed high roll.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(goldenDice: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: '2 coins form a barrier',
                        enabled: features.breakBlockade,
                        helpTitle: 'Barrier / Blockade',
                        helpBody:
                            'Two tokens of the same colour on one cell form a '
                            'barrier. Opponents cannot land on or pass it until '
                            'broken. Break Blockade power can smash barriers.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(breakBlockade: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Safe Landing',
                        enabled: features.safeLanding,
                        helpTitle: 'Safe Landing',
                        helpBody:
                            'Spend Momentum to treat your next landing as a safe cell.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(safeLanding: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Double Move',
                        enabled: features.doubleMove,
                        helpTitle: 'Double Move',
                        helpBody:
                            'Spend Momentum to apply the dice value twice in one turn.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(doubleMove: v),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ArenaRuleRow(
                        label: 'Reverse Movement',
                        enabled: features.reverseMovement,
                        helpTitle: 'Reverse',
                        helpBody:
                            'Spend Momentum to move a token backwards along the path.',
                        onChanged: (v) => _persist(
                          _config!.copyWith(
                            power: power.copyWith(
                              features: features.copyWith(reverseMovement: v),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 80.ms, duration: 320.ms),
                const SizedBox(height: 12),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _FooterButton(
                  label: 'Exit',
                  color: PlayerColors.red,
                  onTap: () => context.pop(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _FooterButton(
                  label: 'Play',
                  color: const Color(0xFF2E7D32),
                  onTap: () => context.pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DiceUnlockChoice extends StatelessWidget {
  const _DiceUnlockChoice({
    required this.face,
    required this.selected,
    required this.onTap,
  });

  final int face;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? const Color(0xFF2E7D32) : ArenaColors.border,
                width: selected ? 2.5 : 1,
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: const Color(0xFF2E7D32).withValues(alpha: 0.35),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
            child: FloorDiceWidget(value: face, rolling: false, size: 44),
          ),
          if (selected)
            const Positioned(
              right: -4,
              top: -4,
              child: Icon(
                Icons.check_circle,
                color: Color(0xFF2E7D32),
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

class _FooterButton extends StatelessWidget {
  const _FooterButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.lerp(color, Colors.white, 0.2)!,
                color,
                Color.lerp(color, Colors.black, 0.2)!,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
