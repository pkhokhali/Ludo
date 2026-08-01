import { StyleSheet, Text, View } from 'react-native';
import { ArenaScaffold, GlassPanel, SectionBanner } from '@/src/components/ui';
import { useProfileStore } from '@/src/store/profileStore';
import { colors, fonts, spacing } from '@/src/theme';

export default function ProfileScreen() {
  const p = useProfileStore();
  return (
    <ArenaScaffold title="Profile">
      <SectionBanner label="Pilot Card" />
      <GlassPanel>
        <Text style={styles.name}>{p.name}</Text>
        <Text style={styles.line}>Level {p.level}</Text>
        <View style={styles.barTrack}>
          <View style={[styles.barFill, { width: `${(p.xp % 1000) / 10}%` }]} />
        </View>
        <Text style={styles.meta}>{p.xp} XP · {p.coins} coins</Text>
        <Text style={styles.meta}>
          {p.wins} wins / {p.matches} matches
        </Text>
      </GlassPanel>
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  name: {
    fontFamily: fonts.display,
    fontSize: 24,
    color: colors.text,
    marginBottom: spacing.sm,
  },
  line: {
    fontFamily: fonts.title,
    fontSize: 18,
    color: colors.cyan,
    marginBottom: spacing.sm,
  },
  barTrack: {
    height: 8,
    borderRadius: 8,
    backgroundColor: '#1A2433',
    overflow: 'hidden',
    marginBottom: spacing.md,
  },
  barFill: { height: '100%', backgroundColor: colors.gold },
  meta: {
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: 4,
  },
});
