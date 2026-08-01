import { StyleSheet, Text, View } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, fonts, radii, spacing } from '@/src/theme';

export function SectionBanner({ label }: { label: string }) {
  return (
    <View style={styles.wrap}>
      <LinearGradient
        colors={['#1B5E20', '#2E7D32']}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
        style={styles.banner}
      >
        <Text style={styles.text}>{label}</Text>
      </LinearGradient>
    </View>
  );
}

const styles = StyleSheet.create({
  wrap: { alignItems: 'center', marginVertical: spacing.sm },
  banner: {
    paddingHorizontal: spacing.xl,
    paddingVertical: spacing.sm,
    borderRadius: radii.pill,
    shadowColor: '#2E7D32',
    shadowOpacity: 0.4,
    shadowRadius: 12,
  },
  text: {
    fontFamily: fonts.title,
    fontSize: 18,
    letterSpacing: 1.6,
    color: colors.text,
    textTransform: 'uppercase',
  },
});
