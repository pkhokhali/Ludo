import { useRouter } from 'expo-router';
import { StyleSheet, Text, View } from 'react-native';
import {
  ArenaScaffold,
  GlassPanel,
  NeonButton,
  SectionBanner,
  ToggleRow,
} from '@/src/components/ui';
import { DiceFace } from '@/src/components/game/DiceFace';
import { usePrefsStore } from '@/src/store/prefsStore';
import { useSetupStore } from '@/src/store/setupStore';
import { useSessionStore } from '@/src/store/sessionStore';
import { colors, fonts, spacing } from '@/src/theme';

export default function RulesScreen() {
  const router = useRouter();
  const unlock = usePrefsStore((s) => s.unlockOnOneOrSix);
  const setUnlock = usePrefsStore((s) => s.setUnlockOnOneOrSix);
  const power = usePrefsStore((s) => s.powerMode);
  const setPower = usePrefsStore((s) => s.setPowerMode);
  const mode = useSetupStore((s) => s.mode);
  const activeSlots = useSetupStore((s) => s.activeSlots);
  const startGame = useSessionStore((s) => s.startGame);

  const play = () => {
    const slots = activeSlots();
    if (slots.length < 2) return;
    const id = `match_${Date.now()}`;
    startGame(
      {
        mode: power || mode === 'power' ? 'power' : mode,
        playerCount: slots.length,
        slots: slots.map((s) => ({
          seat: s.seat,
          name: s.name,
          type: s.type,
          aiDifficulty: s.aiDifficulty,
        })),
      },
      { unlockOneOrSix: unlock },
    );
    router.push(`/game/${id}`);
  };

  return (
    <ArenaScaffold title="Game Rules">
      <SectionBanner label="Rules" />
      <GlassPanel>
        <Text style={styles.heading}>Start coins</Text>
        <Text style={styles.body}>
          Unlock tokens with a 6 (classic). Optionally allow 1 or 6.
        </Text>
        <View style={styles.diceRow}>
          <DiceFace value={6} size={48} />
          {unlock ? <DiceFace value={1} size={48} /> : null}
        </View>
      </GlassPanel>
      <ToggleRow
        label="Unlock on 1 or 6"
        enabled={unlock}
        onChange={setUnlock}
      />
      <ToggleRow label="Power Mode" enabled={power} onChange={setPower} />
      <View style={styles.footer}>
        <NeonButton
          label="Exit"
          variant="ghost"
          onPress={() => router.back()}
          style={{ flex: 1 }}
        />
        <NeonButton label="Play" onPress={play} style={{ flex: 1 }} />
      </View>
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  heading: {
    fontFamily: fonts.title,
    fontSize: 18,
    color: colors.text,
    marginBottom: 6,
  },
  body: {
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: spacing.md,
  },
  diceRow: { flexDirection: 'row', gap: spacing.md },
  footer: {
    flexDirection: 'row',
    gap: spacing.md,
    marginTop: spacing.lg,
  },
});
