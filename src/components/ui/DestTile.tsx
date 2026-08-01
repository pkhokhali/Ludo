import { Pressable, StyleSheet, Text, View } from 'react-native';
import { colors, fonts, radii, spacing } from '@/src/theme';
import { GlassPanel } from './GlassPanel';

type Props = {
  title: string;
  subtitle?: string;
  onPress: () => void;
};

export function DestTile({ title, subtitle, onPress }: Props) {
  return (
    <Pressable onPress={onPress} style={({ pressed }) => pressed && { opacity: 0.85 }}>
      <GlassPanel style={styles.tile} padded={false}>
        <View style={styles.inner}>
          <View style={styles.bar} />
          <View style={styles.copy}>
            <Text style={styles.title}>{title}</Text>
            {subtitle ? <Text style={styles.sub}>{subtitle}</Text> : null}
          </View>
          <Text style={styles.chev}>›</Text>
        </View>
      </GlassPanel>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  tile: { marginBottom: spacing.sm },
  inner: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: spacing.md,
    paddingRight: spacing.lg,
    minHeight: 64,
  },
  bar: {
    width: 4,
    alignSelf: 'stretch',
    backgroundColor: colors.cyan,
    marginRight: spacing.md,
    borderTopRightRadius: 2,
    borderBottomRightRadius: 2,
  },
  copy: { flex: 1 },
  title: {
    fontFamily: fonts.title,
    fontSize: 18,
    color: colors.text,
    letterSpacing: 0.5,
  },
  sub: {
    fontFamily: fonts.body,
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  chev: {
    fontFamily: fonts.title,
    fontSize: 28,
    color: colors.cyan,
    marginLeft: spacing.sm,
  },
});
