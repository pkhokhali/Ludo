import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_colors.dart';
import 'package:ludo_arena/widgets/common/arena_background.dart';

/// Arena shell: full-bleed background, AppBar, and safe bottom inset for nav.
class ArenaScaffold extends ConsumerWidget {
  const ArenaScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.showAppBar = true,
    this.padding = const EdgeInsets.fromLTRB(20, 8, 20, 16),
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showAppBar;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyber = ref.watch(themeIdProvider) == ArenaThemeId.cyberNeon;

    return ArenaBackground(
      cyber: cyber,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: showAppBar
            ? AppBar(
                title: title != null ? Text(title!) : null,
                actions: actions,
                forceMaterialTransparency: true,
              )
            : null,
        floatingActionButton: floatingActionButton,
        body: SafeArea(
          top: !showAppBar,
          bottom: true,
          child: Padding(
            padding: padding,
            child: body,
          ),
        ),
      ),
    );
  }
}
