import { useRouter } from 'expo-router';
import { StyleSheet, Text, View } from 'react-native';
import {
  ArenaScaffold,
  BrandMark,
  GlassPanel,
  NeonButton,
} from '@/src/components/ui';
import { useSessionStore } from '@/src/store/sessionStore';
import { colors, fonts, spacing } from '@/src/theme';

export default function ResultScreen() {
  const router = useRouter();
  const state = useSessionStore((s) => s.state);
  const reset = useSessionStore((s) => s.reset);
  const winner = state?.players.find((p) => p.seat === state.winnerSeat);

  return (
    <ArenaScaffold title="Victory" showBack={false} scroll>
      <View style={styles.center}>
        <BrandMark size={96} />
        <Text style={styles.eyebrow}>MATCH COMPLETE</Text>
        <Text style={styles.title}>
          {winner ? `${winner.name} wins!` : 'Draw arena'}
        </Text>
      </View>
      <GlassPanel>
        <Text style={styles.meta}>
          Seat: {state?.winnerSeat?.toUpperCase() ?? '—'}
        </Text>
        <Text style={styles.meta}>
          Players: {state?.players.map((p) => p.name).join(' · ') ?? '—'}
        </Text>
      </GlassPanel>
      <NeonButton
        label="Play Again"
        onPress={() => {
          reset();
          router.replace('/mode');
        }}
      />
      <NeonButton
        label="Home"
        variant="ghost"
        onPress={() => {
          reset();
          router.replace('/home');
        }}
      />
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  center: { alignItems: 'center', marginVertical: spacing.xl },
  eyebrow: {
    marginTop: spacing.md,
    fontFamily: fonts.bodyBold,
    fontSize: 12,
    letterSpacing: 3,
    color: colors.cyan,
  },
  title: {
    marginTop: spacing.sm,
    fontFamily: fonts.display,
    fontSize: 28,
    color: colors.text,
    textAlign: 'center',
  },
  meta: {
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: 6,
  },
});
