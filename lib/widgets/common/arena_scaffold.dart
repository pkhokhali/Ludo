import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';

/// Transparent AppBar + [ArenaBackground] shell for menu screens.
class ArenaScaffold extends ConsumerWidget {
  const ArenaScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.showAppBar = true,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;

    return Scaffold(
      extendBodyBehindAppBar: showAppBar,
      appBar: showAppBar
          ? AppBar(
              title: title != null ? Text(title!) : null,
              actions: actions,
            )
          : null,
      floatingActionButton: floatingActionButton,
      body: ArenaBackground(
        cyber: cyber,
        child: body,
      ),
    );
  }
}
