# Ludo Arena

**The Next Generation Ludo Experience**

Production-quality offline Ludo for Android (Phase 1), with LAN multiplayer planned for Phase 2.

## Tech Stack

- Flutter (stable) + Dart
- Riverpod · Go Router · Hive · SharedPreferences
- flutter_animate · Lottie · Rive · just_audio
- Google Mobile Ads (AdMob)

## Architecture

Clean Architecture with modular engines:

| Engine | Responsibility |
|--------|----------------|
| Rule Engine | Configurable Classic + Power rules (no hardcoding) |
| Game Engine | Turn loop, dice, moves, win detection |
| AI Engine | Easy → Expert strategies |
| Animation Engine | GameEvent → SFX / haptics |

LAN (Phase 2) reuses the same engines via a host-authoritative network adapter.

## Phase 1 Scope (v1.0)

- Classic + Power modes, AI Match, Pass & Play
- Profile, Statistics, Achievements, Settings, Help, About
- AdMob banners + interstitials (never during gameplay)
- Auto-save / resume last match
- Shop / Daily Reward / Lucky Spin → **v1.1**

## Module Build Status

- [x] Module 0 — Project foundation
- [x] Module 1 — Domain models & RuleConfig
- [x] Module 2 — Rule Engine (Classic)
- [x] Module 3 — Rule Engine (Power)
- [x] Module 4 — Game Engine
- [x] Module 5 — AI Engine
- [x] Module 6 — UI shell polish
- [x] Module 7 — Board, tokens, floor dice
- [x] Module 8 — Animations, audio, haptics
- [x] Module 9 — Profile / stats / achievements
- [x] Module 10 — Save / resume
- [x] Module 11 — AdMob
- [x] Module 12 — Play Store polish

## Getting Started

```bash
flutter pub get
flutter run
```

### Download test APK (GitHub Actions)

1. Open **Actions** → **Build APK** on the repo
2. Open the latest successful run (or click **Run workflow**)
3. Download the **LudoArena-APK** artifact
4. Unzip and install `LudoArena-*.apk` on your Android device (enable Install unknown apps)

Package ID: `com.ludoarena.app` · Min SDK 24

See [PLAY_STORE_CHECKLIST.md](PLAY_STORE_CHECKLIST.md) and [PRIVACY.md](PRIVACY.md) before publishing.

## Design Notes

- Glossy 3D peg tokens (reference-matched)
- Dice rolls **on the board floor** (physics bounce), not a static button
- Dark navy + gold premium UI (Cyber Neon theme toggle in Settings)
