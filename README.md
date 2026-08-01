# Ludo Arena

Professional arena-style Ludo built with **Expo (React Native)** + TypeScript.

## Stack

- Expo Router navigation
- Zustand session / prefs / profile stores
- Reanimated motion + Arena design system (Orbitron / Rajdhani / DM Sans)
- Pure TypeScript classic game engine + weighted AI

## Run

```bash
npm install
npm start
```

Then open Android emulator, iOS simulator, or Expo Go.

```bash
npm test
npm run typecheck
```

## Debug APK (GitHub Actions)

On every push to `main` (or via **Actions → Build APK → Run workflow**), CI builds a debug APK and uploads it as an artifact:

1. Open the **Build APK** workflow run
2. Scroll to **Artifacts**
3. Download **ludo-arena-apk**

Local standalone APK (embeds JS — no Metro required):

```bash
cd android
.\gradlew assembleDebug
```

## App id

`com.ludoarena.app` · version `1.0.2`

## Design

Navy / cyan Arena Mode chrome, cream board with engine-aligned seats (red BL, blue TL, green TR, yellow BR), cream/red dice assets under `assets/images/`.
