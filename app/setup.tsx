import { useRouter } from 'expo-router';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import {
  ArenaScaffold,
  GlassPanel,
  NeonButton,
  SectionBanner,
} from '@/src/components/ui';
import type { AiDifficulty, PlayerSeat } from '@/src/engine/types';
import { useSetupStore } from '@/src/store/setupStore';
import { colors, fonts, radii, spacing } from '@/src/theme';

const DIFFS: AiDifficulty[] = ['easy', 'medium', 'hard', 'expert'];

export default function SetupScreen() {
  const router = useRouter();
  const slots = useSetupStore((s) => s.slots);
  const setSlotType = useSetupStore((s) => s.setSlotType);
  const setDifficulty = useSetupStore((s) => s.setDifficulty);
  const setEnabled = useSetupStore((s) => s.setEnabled);

  return (
    <ArenaScaffold title="Match Setup">
      <SectionBanner label="Players" />
      {slots.map((slot) => (
        <GlassPanel key={slot.seat} style={styles.card}>
          <View style={styles.row}>
            <View
              style={[styles.dot, { backgroundColor: colors.seats[slot.seat as PlayerSeat] }]}
            />
            <Text style={styles.name}>{slot.name}</Text>
            <Pressable onPress={() => setEnabled(slot.seat, !slot.enabled)}>
              <Text style={styles.toggle}>{slot.enabled ? 'ON' : 'OFF'}</Text>
            </Pressable>
          </View>
          {slot.enabled ? (
            <View style={styles.row}>
              <Chip
                label="Human"
                active={slot.type === 'human'}
                onPress={() => setSlotType(slot.seat, 'human')}
              />
              <Chip
                label="AI"
                active={slot.type === 'ai'}
                onPress={() => setSlotType(slot.seat, 'ai')}
              />
              {slot.type === 'ai'
                ? DIFFS.map((d) => (
                    <Chip
                      key={d}
                      label={d.slice(0, 3).toUpperCase()}
                      active={slot.aiDifficulty === d}
                      onPress={() => setDifficulty(slot.seat, d)}
                    />
                  ))
                : null}
            </View>
          ) : null}
        </GlassPanel>
      ))}
      <View style={styles.footer}>
        <NeonButton
          label="Exit"
          variant="ghost"
          onPress={() => router.back()}
          style={{ flex: 1 }}
        />
        <NeonButton
          label="Next"
          onPress={() => router.push('/rules')}
          style={{ flex: 1 }}
        />
      </View>
    </ArenaScaffold>
  );
}

function Chip({
  label,
  active,
  onPress,
}: {
  label: string;
  active: boolean;
  onPress: () => void;
}) {
  return (
    <Pressable onPress={onPress} style={[styles.chip, active && styles.chipOn]}>
      <Text style={[styles.chipText, active && styles.chipTextOn]}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  card: { marginBottom: spacing.sm },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    flexWrap: 'wrap',
    gap: spacing.sm,
    marginBottom: spacing.sm,
  },
  dot: { width: 14, height: 14, borderRadius: 7 },
  name: {
    flex: 1,
    fontFamily: fonts.title,
    fontSize: 18,
    color: colors.text,
  },
  toggle: {
    fontFamily: fonts.bodyBold,
    color: colors.cyan,
    letterSpacing: 1,
  },
  chip: {
    paddingHorizontal: spacing.md,
    paddingVertical: 6,
    borderRadius: radii.md,
    borderWidth: 1,
    borderColor: colors.border,
  },
  chipOn: { borderColor: colors.cyan, backgroundColor: colors.cyanSoft },
  chipText: { fontFamily: fonts.bodyMed, fontSize: 12, color: colors.textMuted },
  chipTextOn: { color: colors.cyan },
  footer: {
    flexDirection: 'row',
    gap: spacing.md,
    marginTop: spacing.lg,
  },
});
