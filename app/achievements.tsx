import { StyleSheet, Text, View } from 'react-native';
import { ArenaScaffold, GlassPanel, SectionBanner } from '@/src/components/ui';
import { ACHIEVEMENTS } from '@/src/data/fixtures/achievements';
import { colors, fonts, spacing } from '@/src/theme';

export default function AchievementsScreen() {
  return (
    <ArenaScaffold title="Achievements">
      <SectionBanner label="Badges" />
      {ACHIEVEMENTS.map((a) => (
        <GlassPanel key={a.id} style={[styles.card, !a.unlocked && styles.locked]}>
          <Text style={styles.title}>{a.title}</Text>
          <Text style={styles.desc}>{a.desc}</Text>
          <Text style={styles.status}>{a.unlocked ? 'UNLOCKED' : 'LOCKED'}</Text>
        </GlassPanel>
      ))}
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  card: { marginBottom: spacing.sm },
  locked: { opacity: 0.55 },
  title: {
    fontFamily: fonts.title,
    fontSize: 18,
    color: colors.text,
  },
  desc: {
    marginTop: 4,
    fontFamily: fonts.body,
    fontSize: 13,
    color: colors.textSecondary,
  },
  status: {
    marginTop: spacing.sm,
    fontFamily: fonts.bodyBold,
    fontSize: 11,
    letterSpacing: 1.5,
    color: colors.cyan,
  },
});
