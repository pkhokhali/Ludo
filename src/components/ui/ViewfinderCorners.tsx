import { StyleSheet, View, ViewStyle } from 'react-native';
import { colors } from '@/src/theme';

/** Cyan L-brackets for Arena Mode framing. */
export function ViewfinderCorners({ inset = 12 }: { inset?: number }) {
  return (
    <View pointerEvents="none" style={StyleSheet.absoluteFill}>
      <View style={[styles.armH, { top: inset, left: inset }]} />
      <View style={[styles.armV, { top: inset, left: inset }]} />

      <View style={[styles.armH, { top: inset, right: inset }]} />
      <View style={[styles.armV, { top: inset, right: inset }]} />

      <View style={[styles.armH, { bottom: inset, left: inset }]} />
      <View style={[styles.armV, { bottom: inset, left: inset }]} />

      <View style={[styles.armH, { bottom: inset, right: inset }]} />
      <View style={[styles.armV, { bottom: inset, right: inset }]} />
    </View>
  );
}

const arm: ViewStyle = {
  position: 'absolute',
  backgroundColor: colors.cyan,
  opacity: 0.85,
};

const styles = StyleSheet.create({
  armH: { ...arm, width: 22, height: 2 },
  armV: { ...arm, width: 2, height: 22 },
});
