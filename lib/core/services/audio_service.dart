import 'package:flutter/foundation.dart';

/// Audio facade. Real just_audio wiring lands in Module 8.
class AudioService {
  bool _soundEnabled = true;
  bool _musicEnabled = true;

  void configure({required bool sound, required bool music}) {
    _soundEnabled = sound;
    _musicEnabled = music;
  }

  Future<void> playSfx(String assetKey) async {
    if (!_soundEnabled) return;
    debugPrint('[AudioService] sfx: $assetKey');
  }

  Future<void> playMusic(String assetKey) async {
    if (!_musicEnabled) return;
    debugPrint('[AudioService] music: $assetKey');
  }

  Future<void> stopMusic() async {}

  Future<void> dispose() async {}
}
