import { Image, StyleSheet, View } from 'react-native';
import Animated, {
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withTiming,
} from 'react-native-reanimated';
import { useEffect } from 'react';
import { ArenaAssets } from '@/src/constants/assets';
import { colors } from '@/src/theme';

type Props = { size?: number; breathe?: boolean };

export function BrandMark({ size = 110, breathe = true }: Props) {
  const pulse = useSharedValue(1);

  useEffect(() => {
    if (!breathe) return;
    pulse.value = withRepeat(
      withTiming(1.06, { duration: 1600, easing: Easing.inOut(Easing.sin) }),
      -1,
      true,
    );
  }, [breathe, pulse]);

  const glowStyle = useAnimatedStyle(() => ({
    transform: [{ scale: pulse.value }],
    opacity: 0.35 + (pulse.value - 1) * 2,
  }));

  return (
    <View style={{ width: size, height: size, alignItems: 'center', justifyContent: 'center' }}>
      <Animated.View
        style={[
          styles.glow,
          { width: size * 0.85, height: size * 0.85, borderRadius: size },
          glowStyle,
        ]}
      />
      <Image
        source={ArenaAssets.logo}
        style={{ width: size, height: size }}
        resizeMode="contain"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  glow: {
    position: 'absolute',
    backgroundColor: colors.cyan,
    shadowColor: colors.cyan,
    shadowOpacity: 0.8,
    shadowRadius: 24,
  },
});
