import { StyleSheet, Text, View } from 'react-native';
import { ArenaScaffold, BrandMark, GlassPanel, SectionBanner } from '@/src/components/ui';
import { APP_VERSION } from '@/src/constants/assets';
import { colors, fonts, spacing } from '@/src/theme';

export default function AboutScreen() {
  return (
    <ArenaScaffold title="About">
      <SectionBanner label="Ludo Arena" />
      <View style={styles.mark}>
        <BrandMark size={96} />
      </View>
      <GlassPanel style={styles.card}>
        <Text style={styles.title}>Ludo Arena</Text>
        <Text style={styles.body}>
          A professional arena-style Ludo experience — roll, race, and rule the
          board with classic rules and AI opponents.
        </Text>
        <Text style={styles.ver}>Version {APP_VERSION}</Text>
        <Text style={styles.meta}>com.ludoarena.app</Text>
      </GlassPanel>
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  mark: { alignItems: 'center', marginVertical: spacing.md },
  card: { marginTop: spacing.sm, alignItems: 'center' },
  title: {
    fontFamily: fonts.display,
    fontSize: 22,
    color: colors.text,
    marginBottom: spacing.sm,
  },
  body: {
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 21,
    marginBottom: spacing.md,
  },
  ver: {
    fontFamily: fonts.title,
    fontSize: 16,
    color: colors.cyan,
  },
  meta: {
    marginTop: 4,
    fontFamily: fonts.body,
    fontSize: 12,
    color: colors.textMuted,
  },
});
