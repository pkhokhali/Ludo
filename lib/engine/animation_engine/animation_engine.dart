import 'package:ludo_arena/core/services/audio_service.dart';
import 'package:ludo_arena/core/services/haptic_service.dart';
import 'package:ludo_arena/models/game_event.dart';

/// Maps [GameEvent]s → SFX + haptics. Pure orchestration (Module 8).
class AnimationEngine {
  AnimationEngine({
    required this.audio,
    required this.haptics,
  });

  final AudioService audio;
  final HapticService haptics;

  Future<void> handle(List<GameEvent> events) async {
    for (final e in events) {
      await e.map(
        diceRolled: (_) async {
          await audio.playSfx('dice');
          await haptics.diceBounce();
        },
        tokenMoved: (_) async {
          await audio.playSfx('move');
          await haptics.selection();
        },
        tokenUnlocked: (_) async {
          await audio.playSfx('unlock');
          await haptics.medium();
        },
        captured: (_) async {
          await audio.playSfx('capture');
          await haptics.capture();
        },
        sixRolled: (_) async {
          await audio.playSfx('six');
          await haptics.medium();
        },
        threeSixesPenalty: (_) async {
          await audio.playSfx('penalty');
          await haptics.heavy();
        },
        momentumChanged: (ev) async {
          if (ev.delta > 0) {
            await audio.playSfx('momentum');
            await haptics.light();
          }
        },
        powerUsed: (_) async {
          await audio.playSfx('power');
          await haptics.medium();
        },
        playerWon: (_) async {
          await audio.playSfx('victory');
          await haptics.victory();
        },
        turnChanged: (_) async {
          await haptics.selection();
        },
      );
    }
  }
}
