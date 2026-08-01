import { Image, StyleSheet, View } from 'react-native';
import Animated, {
  useAnimatedStyle,
  useSharedValue,
  withSequence,
  withTiming,
} from 'react-native-reanimated';
import { useEffect } from 'react';
import { diceFace } from '@/src/constants/assets';
import { colors } from '@/src/theme';

type Props = {
  value: number;
  size?: number;
  rolling?: boolean;
};

export function DiceFace({ value, size = 64, rolling }: Props) {
  const rot = useSharedValue(0);

  useEffect(() => {
    if (rolling) {
      rot.value = withSequence(
        withTiming(18, { duration: 80 }),
        withTiming(-16, { duration: 80 }),
        withTiming(12, { duration: 80 }),
        withTiming(0, { duration: 80 }),
      );
    }
  }, [rolling, rot]);

  const style = useAnimatedStyle(() => ({
    transform: [{ rotate: `${rot.value}deg` }],
  }));

  return (
    <Animated.View style={[{ width: size, height: size }, style]}>
      {rolling ? <View style={[styles.glow, { borderRadius: size }]} /> : null}
      <Image
        source={diceFace(value)}
        style={{ width: size, height: size }}
        resizeMode="contain"
      />
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  glow: {
    position: 'absolute',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    backgroundColor: colors.cyanDim,
    transform: [{ scale: 1.15 }],
  },
});
