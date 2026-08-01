import { StyleSheet, Text, View } from 'react-native';
import { ArenaScaffold, GlassPanel, SectionBanner } from '@/src/components/ui';
import { STAT_ROWS } from '@/src/data/fixtures/achievements';
import { colors, fonts, spacing } from '@/src/theme';

export default function StatisticsScreen() {
  return (
    <ArenaScaffold title="Statistics">
      <SectionBanner label="Career" />
      <GlassPanel padded={false}>
        {STAT_ROWS.map((row, i) => (
          <View
            key={row.label}
            style={[styles.row, i < STAT_ROWS.length - 1 && styles.divider]}
          >
            <Text style={styles.label}>{row.label}</Text>
            <Text style={styles.value}>{row.value}</Text>
          </View>
        ))}
      </GlassPanel>
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.md,
  },
  divider: {
    borderBottomWidth: StyleSheet.hairlineWidth,
    borderBottomColor: colors.border,
  },
  label: {
    fontFamily: fonts.body,
    fontSize: 15,
    color: colors.textSecondary,
  },
  value: {
    fontFamily: fonts.title,
    fontSize: 17,
    color: colors.text,
  },
});
