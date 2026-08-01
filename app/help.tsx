import { StyleSheet, Text } from 'react-native';
import { ArenaScaffold, GlassPanel, SectionBanner } from '@/src/components/ui';
import { colors, fonts, spacing } from '@/src/theme';

const TIPS = [
  'Roll a 6 to unlock a token from your yard.',
  'Land on an opponent (non-safe) to send them home.',
  'Stars and start cells are safe zones.',
  'Exact dice needed to finish on the home stretch.',
  'Three sixes in a row forfeits that turn.',
];

export default function HelpScreen() {
  return (
    <ArenaScaffold title="Help">
      <SectionBanner label="How to Play" />
      {TIPS.map((tip) => (
        <GlassPanel key={tip} style={styles.card}>
          <Text style={styles.tip}>{tip}</Text>
        </GlassPanel>
      ))}
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  card: { marginBottom: spacing.sm },
  tip: {
    fontFamily: fonts.body,
    fontSize: 15,
    color: colors.text,
    lineHeight: 22,
  },
});
