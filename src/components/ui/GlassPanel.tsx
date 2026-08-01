import { ReactNode } from 'react';
import { StyleProp, StyleSheet, View, ViewStyle } from 'react-native';
import { colors, radii, spacing } from '@/src/theme';

type Props = {
  children: ReactNode;
  style?: StyleProp<ViewStyle>;
  padded?: boolean;
};

export function GlassPanel({ children, style, padded = true }: Props) {
  return (
    <View style={[styles.panel, padded && styles.padded, style]}>{children}</View>
  );
}

const styles = StyleSheet.create({
  panel: {
    backgroundColor: colors.bgPanel,
    borderRadius: radii.lg,
    borderWidth: 1,
    borderColor: colors.border,
    overflow: 'hidden',
  },
  padded: {
    padding: spacing.lg,
  },
});
