import 'package:flutter/material.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/glass_card.dart';

/// Yellow/gold section banner like Neo-Classic "Options:" / "Game Rules:".
class ArenaSectionBanner extends StatelessWidget {
  const ArenaSectionBanner(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ArenaColors.goldLight, ArenaColors.gold, ArenaColors.goldDark],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ArenaColors.gold.withValues(alpha: 0.35),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ArenaColors.backgroundDeep,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
      ),
    );
  }
}

/// Green check / red X circular status control.
class ArenaStatusToggle extends StatelessWidget {
  const ArenaStatusToggle({
    super.key,
    required this.enabled,
    required this.onChanged,
  });

  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final color = enabled ? const Color(0xFF2E7D32) : PlayerColors.red;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => onChanged(!enabled),
        child: Ink(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.lerp(color, Colors.white, 0.25)!,
                color,
                Color.lerp(color, Colors.black, 0.2)!,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.45),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(
            enabled ? Icons.check_rounded : Icons.close_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}

/// Gold "?" help chip that opens an explanation dialog.
class ArenaHelpChip extends StatelessWidget {
  const ArenaHelpChip({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => showArenaHelpDialog(context, title: title, body: body),
        child: Ink(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [ArenaColors.goldLight, ArenaColors.goldDark],
            ),
            border: Border.all(color: Colors.white24),
            boxShadow: [
              BoxShadow(
                color: ArenaColors.gold.withValues(alpha: 0.35),
                blurRadius: 6,
              ),
            ],
          ),
          child: const Icon(
            Icons.question_mark_rounded,
            size: 16,
            color: ArenaColors.backgroundDeep,
          ),
        ),
      ),
    );
  }
}

/// Rule row: label + optional help + status toggle.
class ArenaRuleRow extends StatelessWidget {
  const ArenaRuleRow({
    super.key,
    required this.label,
    required this.enabled,
    required this.onChanged,
    this.helpTitle,
    this.helpBody,
  });

  final String label;
  final bool enabled;
  final ValueChanged<bool> onChanged;
  final String? helpTitle;
  final String? helpBody;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: enabled
                        ? ArenaColors.textPrimary
                        : ArenaColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
          ),
          if (helpTitle != null && helpBody != null) ...[
            ArenaHelpChip(title: helpTitle!, body: helpBody!),
            const SizedBox(width: 8),
          ],
          ArenaStatusToggle(enabled: enabled, onChanged: onChanged),
        ],
      ),
    );
  }
}

/// Large settings On/Off tile (Sounds / Music / Vibration).
class ArenaSettingToggleTile extends StatelessWidget {
  const ArenaSettingToggleTile({
    super.key,
    required this.label,
    required this.enabled,
    required this.onChanged,
  });

  final String label;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onChanged(!enabled),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: enabled
                    ? [
                        ArenaColors.gold.withValues(alpha: 0.55),
                        ArenaColors.goldDark.withValues(alpha: 0.75),
                      ]
                    : [
                        ArenaColors.surface,
                        ArenaColors.surface.withValues(alpha: 0.85),
                      ],
              ),
              border: Border.all(
                color: enabled ? ArenaColors.goldLight : ArenaColors.border,
                width: 1.4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: enabled
                              ? ArenaColors.backgroundDeep
                              : ArenaColors.textPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                ArenaStatusToggle(enabled: enabled, onChanged: onChanged),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Compact pill selector button.
class ArenaChoicePill extends StatelessWidget {
  const ArenaChoicePill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: selected
                ? ArenaColors.gold.withValues(alpha: 0.28)
                : ArenaColors.surface.withValues(alpha: 0.55),
            border: Border.all(
              color: selected ? ArenaColors.gold : ArenaColors.border,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: selected
                          ? ArenaColors.goldLight
                          : ArenaColors.textSecondary,
                    ),
              ),
              if (selected) ...[
                const SizedBox(width: 6),
                const Icon(Icons.check_circle, size: 16, color: Color(0xFF2E7D32)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showArenaHelpDialog(
  BuildContext context, {
  required String title,
  required String body,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black54,
    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GlassCard(
              glowColor: ArenaColors.gold,
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 22),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 420),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: ArenaColors.goldLight,
                              fontSize: 20,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        body,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: -6,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.pop(ctx),
                  child: Ink(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: PlayerColors.red,
                      boxShadow: [
                        BoxShadow(color: Colors.black45, blurRadius: 8),
                      ],
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
