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
| Animation Engine | GameEvent → motion / SFX / haptics |

LAN (Phase 2) reuses the same engines via a host-authoritative network adapter.

## Phase 1 Scope (v1.0)

- Classic + Power modes, AI Match, Pass & Play
- Profile, Statistics, Settings, Help, About
- AdMob banners + interstitials (never during gameplay)
- Shop / Daily Reward / Lucky Spin → **v1.1**

## Module Build Status

- [x] Module 0 — Project foundation
- [ ] Module 1 — Domain models & RuleConfig
- [ ] Module 2 — Rule Engine (Classic)
- [ ] Module 3 — Rule Engine (Power)
- [ ] Module 4 — Game Engine
- [ ] Module 5 — AI Engine
- [ ] Module 6 — UI shell polish
- [ ] Module 7 — Board, tokens, floor dice
- [ ] Module 8 — Animations, audio, haptics
- [ ] Module 9 — Profile / stats / achievements
- [ ] Module 10 — Save / resume
- [ ] Module 11 — AdMob
- [ ] Module 12 — Play Store polish

## Getting Started

```bash
flutter pub get
flutter run
```

Package ID: `com.ludoarena.app` · Min SDK 24

## Design Notes

- Glossy 3D peg tokens (reference-matched)
- Dice rolls **on the board floor** (physics bounce), not a static button
- Dark navy + gold premium UI
