import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ludo_arena/core/routing/app_router.dart';
import 'package:ludo_arena/core/services/providers.dart';
import 'package:ludo_arena/core/theme/arena_theme.dart';

/// Root application widget — theme + Go Router.
class LudoArenaApp extends ConsumerStatefulWidget {
  const LudoArenaApp({super.key});

  @override
  ConsumerState<LudoArenaApp> createState() => _LudoArenaAppState();
}

class _LudoArenaAppState extends ConsumerState<LudoArenaApp> {
  late final _router = createAppRouter();

  @override
  Widget build(BuildContext context) {
    final themeId = ref.watch(themeIdProvider);

    return MaterialApp.router(
      title: 'Ludo Arena',
      debugShowCheckedModeBanner: false,
      theme: buildArenaTheme(themeId: themeId),
      routerConfig: _router,
    );
  }
}
