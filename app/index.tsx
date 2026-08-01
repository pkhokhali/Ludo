import { useRootNavigationState, useRouter } from 'expo-router';
import { useEffect, useRef, useState } from 'react';
import {
  Animated,
  ImageBackground,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { APP_VERSION, ArenaAssets } from '@/src/constants/assets';
import { ViewfinderCorners } from '@/src/components/ui';
import { colors, fonts, spacing } from '@/src/theme';

const SPLASH_MS = 2200;

export default function SplashScreen() {
  const router = useRouter();
  const nav = useRootNavigationState();
  const progress = useRef(new Animated.Value(0.08)).current;
  const [pct, setPct] = useState(0.08);
  const navigated = useRef(false);

  const goHome = () => {
    if (navigated.current) return;
    if (!nav?.key) return;
    navigated.current = true;
    router.replace('/home');
  };

  useEffect(() => {
    const id = progress.addListener(({ value }) => setPct(value));
    Animated.timing(progress, {
      toValue: 1,
      duration: SPLASH_MS,
      useNativeDriver: false,
    }).start();

    // Hard navigation fallback — don't rely on animation `finished`
    // (can be false on remount / interrupted timing).
    const timer = setTimeout(goHome, SPLASH_MS + 150);

    return () => {
      progress.removeListener(id);
      clearTimeout(timer);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [progress]);

  // If navigation becomes ready after the timer already fired, leave splash.
  useEffect(() => {
    if (!nav?.key || navigated.current) return;
    const timer = setTimeout(goHome, SPLASH_MS + 150);
    return () => clearTimeout(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [nav?.key]);

  return (
    <View style={styles.root}>
      <ImageBackground
        source={ArenaAssets.splash}
        style={StyleSheet.absoluteFill}
        resizeMode="cover"
      />
      <View style={styles.vignette} />
      <ViewfinderCorners inset={18} />
      <SafeAreaView style={styles.safe}>
        <Text style={styles.mode}>ARENA MODE</Text>
        <View style={styles.spacer} />
        <Text style={styles.title}>LUDO</Text>
        <Text style={styles.tag}>ROLL  •  RACE  •  RULE THE BOARD</Text>
        <Text style={styles.loading}>LOADING</Text>
        <View style={styles.barTrack}>
          <Animated.View
            style={[
              styles.barFill,
              {
                width: progress.interpolate({
                  inputRange: [0, 1],
                  outputRange: ['0%', '100%'],
                }),
              },
            ]}
          />
          <View style={[styles.flare, { left: `${Math.min(pct * 100, 98)}%` }]} />
        </View>
        <Text style={styles.ver}>v {APP_VERSION}</Text>
      </SafeAreaView>
    </View>
  );
}

const styles = StyleSheet.create({
  root: { flex: 1, backgroundColor: colors.bg },
  vignette: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    backgroundColor: 'rgba(5,8,20,0.12)',
  },
  safe: {
    flex: 1,
    paddingHorizontal: spacing.xl,
    paddingTop: spacing.lg,
    paddingBottom: spacing.xl,
    justifyContent: 'flex-end',
  },
  mode: {
    position: 'absolute',
    top: 56,
    alignSelf: 'center',
    fontFamily: fonts.bodyBold,
    fontSize: 12,
    letterSpacing: 4,
    color: colors.cyan,
  },
  spacer: { flex: 1 },
  title: {
    fontFamily: fonts.display,
    fontSize: 52,
    fontStyle: 'italic',
    letterSpacing: 4,
    color: colors.text,
    textAlign: 'center',
    textShadowColor: colors.cyan,
    textShadowRadius: 18,
  },
  tag: {
    marginTop: 6,
    marginBottom: 36,
    textAlign: 'center',
    fontFamily: fonts.bodyMed,
    fontSize: 11,
    letterSpacing: 2.2,
    color: colors.text,
  },
  loading: {
    textAlign: 'center',
    fontFamily: fonts.body,
    fontSize: 11,
    letterSpacing: 3,
    color: colors.textSecondary,
    marginBottom: 10,
  },
  barTrack: {
    height: 6,
    borderRadius: 10,
    backgroundColor: '#1A2433',
    overflow: 'hidden',
  },
  barFill: {
    height: '100%',
    backgroundColor: colors.cyan,
    borderRadius: 10,
  },
  flare: {
    position: 'absolute',
    top: -2,
    width: 10,
    height: 10,
    borderRadius: 5,
    backgroundColor: '#fff',
    opacity: 0.85,
  },
  ver: {
    marginTop: 14,
    textAlign: 'center',
    fontFamily: fonts.body,
    fontSize: 11,
    color: colors.textSecondary,
  },
});
