import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

/// Audio service using just_audio. Missing assets fall back silently.
class AudioService {
  AudioService();

  final AudioPlayer _sfx = AudioPlayer();
  final AudioPlayer _music = AudioPlayer();
  bool _soundEnabled = true;
  bool _musicEnabled = true;

  static const Map<String, String> _sfxAssets = {
    'dice': 'assets/sounds/dice.mp3',
    'move': 'assets/sounds/move.mp3',
    'capture': 'assets/sounds/capture.mp3',
    'unlock': 'assets/sounds/unlock.mp3',
    'six': 'assets/sounds/six.mp3',
    'penalty': 'assets/sounds/penalty.mp3',
    'momentum': 'assets/sounds/momentum.mp3',
    'power': 'assets/sounds/power.mp3',
    'victory': 'assets/sounds/victory.mp3',
    'click': 'assets/sounds/click.mp3',
    'portal': 'assets/sounds/portal.mp3',
    'shield': 'assets/sounds/shield.mp3',
  };

  void configure({required bool sound, required bool music}) {
    _soundEnabled = sound;
    _musicEnabled = music;
    if (!music) {
      stopMusic();
    }
  }

  Future<void> playSfx(String assetKey) async {
    if (!_soundEnabled) return;
    final path = _sfxAssets[assetKey];
    if (path == null) return;
    try {
      await rootBundle.load(path);
      await _sfx.setAsset(path);
      await _sfx.seek(Duration.zero);
      await _sfx.play();
    } catch (e) {
      // Assets optional until sound pack is added.
      debugPrint('[AudioService] sfx skip $assetKey: $e');
      await SystemSound.play(SystemSoundType.click);
    }
  }

  Future<void> playMusic(String assetKey) async {
    if (!_musicEnabled) return;
    try {
      await _music.setAsset('assets/sounds/$assetKey.mp3');
      await _music.setLoopMode(LoopMode.one);
      await _music.play();
    } catch (e) {
      debugPrint('[AudioService] music skip: $e');
    }
  }

  Future<void> stopMusic() async {
    try {
      await _music.stop();
    } catch (_) {}
  }

  Future<void> dispose() async {
    await _sfx.dispose();
    await _music.dispose();
  }
}
