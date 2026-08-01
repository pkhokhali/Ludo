import { Pressable, StyleSheet, Text, View } from 'react-native';
import { colors, fonts, radii, spacing } from '@/src/theme';
import { GlassPanel } from './GlassPanel';

type Props = {
  label: string;
  enabled: boolean;
  onChange: (v: boolean) => void;
};

export function ToggleRow({ label, enabled, onChange }: Props) {
  return (
    <GlassPanel style={styles.wrap} padded={false}>
      <View style={styles.row}>
        <Text style={styles.label}>{label}</Text>
        <View style={styles.pair}>
          <Chip label="On" active={enabled} onPress={() => onChange(true)} />
          <Chip label="Off" active={!enabled} onPress={() => onChange(false)} />
        </View>
      </View>
    </GlassPanel>
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
    <Pressable
      onPress={onPress}
      style={[styles.chip, active && styles.chipOn]}
    >
      <Text style={[styles.chipText, active && styles.chipTextOn]}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  wrap: { marginBottom: spacing.sm },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.md,
    gap: spacing.md,
  },
  label: {
    flex: 1,
    fontFamily: fonts.titleMed,
    fontSize: 17,
    color: colors.text,
  },
  pair: { flexDirection: 'row', gap: spacing.sm },
  chip: {
    minWidth: 52,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: radii.md,
    borderWidth: 1,
    borderColor: colors.border,
    backgroundColor: 'rgba(0,0,0,0.25)',
    alignItems: 'center',
  },
  chipOn: {
    borderColor: colors.cyan,
    backgroundColor: colors.cyanSoft,
  },
  chipText: {
    fontFamily: fonts.bodyBold,
    fontSize: 13,
    color: colors.textMuted,
  },
  chipTextOn: { color: colors.cyan },
});
