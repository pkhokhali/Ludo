import { useRouter } from 'expo-router';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { ArenaScaffold, GlassPanel, SectionBanner } from '@/src/components/ui';
import { useSetupStore } from '@/src/store/setupStore';
import type { GameMode } from '@/src/engine/types';
import { colors, fonts, radii, spacing } from '@/src/theme';

const MODES: { id: GameMode; title: string; desc: string }[] = [
  { id: 'classic', title: 'Classic', desc: 'Traditional Ludo rules' },
  { id: 'power', title: 'Power', desc: 'Momentum abilities & shields' },
  { id: 'ai', title: 'Vs AI', desc: 'Solo against arena bots' },
  { id: 'passPlay', title: 'Pass & Play', desc: 'Local hot-seat multiplayer' },
];

export default function ModeScreen() {
  const router = useRouter();
  const mode = useSetupStore((s) => s.mode);
  const setMode = useSetupStore((s) => s.setMode);

  return (
    <ArenaScaffold title="Select Mode">
      <SectionBanner label="Game Mode" />
      <View style={styles.list}>
        {MODES.map((m) => {
          const active = mode === m.id;
          return (
            <Pressable
              key={m.id}
              onPress={() => {
                setMode(m.id);
                router.push('/setup');
              }}
            >
              <GlassPanel style={[styles.card, active && styles.active]}>
                <Text style={styles.title}>{m.title}</Text>
                <Text style={styles.desc}>{m.desc}</Text>
              </GlassPanel>
            </Pressable>
          );
        })}
      </View>
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  list: { gap: spacing.sm },
  card: { marginBottom: spacing.xs },
  active: {
    borderColor: colors.cyan,
    borderWidth: 1.5,
    borderRadius: radii.lg,
  },
  title: {
    fontFamily: fonts.title,
    fontSize: 20,
    color: colors.text,
  },
  desc: {
    marginTop: 4,
    fontFamily: fonts.body,
    fontSize: 13,
    color: colors.textSecondary,
  },
});
