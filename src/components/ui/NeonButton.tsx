import { LinearGradient } from 'expo-linear-gradient';
import { Pressable, StyleProp, StyleSheet, Text, ViewStyle } from 'react-native';
import Animated, {
  useAnimatedStyle,
  useSharedValue,
  withSpring,
} from 'react-native-reanimated';
import { colors, fonts, radii, spacing } from '@/src/theme';

type Props = {
  label: string;
  onPress: () => void;
  variant?: 'primary' | 'ghost' | 'danger';
  disabled?: boolean;
  style?: StyleProp<ViewStyle>;
};

const AnimatedPressable = Animated.createAnimatedComponent(Pressable);

export function NeonButton({
  label,
  onPress,
  variant = 'primary',
  disabled,
  style,
}: Props) {
  const scale = useSharedValue(1);
  const anim = useAnimatedStyle(() => ({ transform: [{ scale: scale.value }] }));

  return (
    <AnimatedPressable
      disabled={disabled}
      onPress={onPress}
      onPressIn={() => {
        scale.value = withSpring(0.96);
      }}
      onPressOut={() => {
        scale.value = withSpring(1);
      }}
      style={[anim, disabled && styles.disabled, style]}
    >
      {variant === 'primary' ? (
        <LinearGradient
          colors={[colors.cyan, '#00B8D4']}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 1 }}
          style={styles.primary}
        >
          <Text style={styles.primaryLabel}>{label}</Text>
        </LinearGradient>
      ) : (
        <LinearGradient
          colors={
            variant === 'danger'
              ? ['rgba(255,82,82,0.18)', 'rgba(255,82,82,0.08)']
              : [colors.cyanSoft, 'rgba(0,229,255,0.05)']
          }
          style={[
            styles.ghost,
            variant === 'danger' && styles.dangerBorder,
          ]}
        >
          <Text
            style={[
              styles.ghostLabel,
              variant === 'danger' && { color: colors.danger },
            ]}
          >
            {label}
          </Text>
        </LinearGradient>
      )}
    </AnimatedPressable>
  );
}

const styles = StyleSheet.create({
  primary: {
    minHeight: 52,
    borderRadius: radii.lg,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: spacing.xl,
    shadowColor: colors.cyan,
    shadowOpacity: 0.45,
    shadowRadius: 14,
    shadowOffset: { width: 0, height: 0 },
    elevation: 8,
  },
  primaryLabel: {
    fontFamily: fonts.title,
    fontSize: 18,
    letterSpacing: 1.4,
    color: colors.bg,
    textTransform: 'uppercase',
  },
  ghost: {
    minHeight: 48,
    borderRadius: radii.lg,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: spacing.xl,
    borderWidth: 1,
    borderColor: colors.borderStrong,
  },
  ghostLabel: {
    fontFamily: fonts.title,
    fontSize: 16,
    letterSpacing: 1.2,
    color: colors.cyan,
    textTransform: 'uppercase',
  },
  dangerBorder: {
    borderColor: 'rgba(255,82,82,0.55)',
  },
  disabled: { opacity: 0.45 },
});
