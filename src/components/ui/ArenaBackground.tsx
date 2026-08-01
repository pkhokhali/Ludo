import { LinearGradient } from 'expo-linear-gradient';
import { ReactNode } from 'react';
import { StyleSheet, View } from 'react-native';
import { colors } from '@/src/theme';

type Props = { children?: ReactNode };

/** Full-bleed navy arena atmosphere with diagonal light streaks. */
export function ArenaBackground({ children }: Props) {
  return (
    <View style={styles.root}>
      <LinearGradient
        colors={['#07101F', colors.bg, '#03060E']}
        locations={[0, 0.45, 1]}
        start={{ x: 0.1, y: 0 }}
        end={{ x: 0.9, y: 1 }}
        style={StyleSheet.absoluteFill}
      />
      <View style={[styles.streak, styles.streakA]} />
      <View style={[styles.streak, styles.streakB]} />
      <View style={[styles.streak, styles.streakC]} />
      <LinearGradient
        colors={['transparent', 'rgba(0,229,255,0.04)', 'transparent']}
        start={{ x: 0, y: 0.2 }}
        end={{ x: 1, y: 0.9 }}
        style={StyleSheet.absoluteFill}
      />
      {children}
    </View>
  );
}

const styles = StyleSheet.create({
  root: { flex: 1, backgroundColor: colors.bg },
  streak: {
    position: 'absolute',
    width: '140%',
    height: 1.5,
    backgroundColor: 'rgba(0,229,255,0.07)',
    transform: [{ rotate: '-28deg' }],
  },
  streakA: { top: '18%', left: '-20%' },
  streakB: { top: '42%', left: '-10%', opacity: 0.7 },
  streakC: { top: '68%', left: '-25%', opacity: 0.5 },
});
