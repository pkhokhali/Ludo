import { useRouter } from 'expo-router';
import { Image, Pressable, StyleSheet, Text, View } from 'react-native';
import Animated, { FadeInDown, FadeInUp } from 'react-native-reanimated';
import {
  ArenaBackground,
  BrandMark,
  DestTile,
  NeonButton,
  ViewfinderCorners,
} from '@/src/components/ui';
import { ArenaAssets } from '@/src/constants/assets';
import { useProfileStore } from '@/src/store/profileStore';
import { colors, fonts, radii, spacing } from '@/src/theme';
import { SafeAreaView } from 'react-native-safe-area-context';

export default function HomeScreen() {
  const router = useRouter();
  const profile = useProfileStore();

  return (
    <ArenaBackground>
      <ViewfinderCorners />
      <SafeAreaView style={styles.safe} edges={['top', 'bottom']}>
        <View style={styles.topRow}>
          <Chip label={`Lv ${profile.level}`} />
          <Chip label={`${profile.coins}`} accent />
          <View style={{ flex: 1 }} />
          <Pressable onPress={() => router.push('/settings')} hitSlop={10}>
            <Image
              source={ArenaAssets.settingsGear}
              style={{ width: 30, height: 30 }}
              resizeMode="contain"
            />
          </Pressable>
        </View>

        <Animated.View entering={FadeInUp.duration(500)} style={styles.hero}>
          <BrandMark size={108} />
          <Text style={styles.brand}>LUDO ARENA</Text>
          <Text style={styles.tagline}>Rule the board. Own the arena.</Text>
        </Animated.View>

        <Animated.View entering={FadeInDown.delay(120).duration(450)}>
          <NeonButton label="Play Now" onPress={() => router.push('/mode')} />
        </Animated.View>

        <Animated.View
          entering={FadeInDown.delay(220).duration(450)}
          style={styles.tiles}
        >
          <DestTile
            title="Profile"
            subtitle={profile.name}
            onPress={() => router.push('/profile')}
          />
          <DestTile
            title="Statistics"
            subtitle={`${profile.wins} wins`}
            onPress={() => router.push('/statistics')}
          />
          <DestTile
            title="Achievements"
            subtitle="Arena badges"
            onPress={() => router.push('/achievements')}
          />
        </Animated.View>
      </SafeAreaView>
    </ArenaBackground>
  );
}

function Chip({ label, accent }: { label: string; accent?: boolean }) {
  return (
    <View style={[styles.chip, accent && styles.chipAccent]}>
      <Text style={styles.chipText}>{label}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  safe: {
    flex: 1,
    paddingHorizontal: spacing.lg,
    paddingBottom: spacing.lg,
  },
  topRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    marginBottom: spacing.md,
  },
  chip: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs + 2,
    borderRadius: radii.pill,
    borderWidth: 1,
    borderColor: colors.border,
    backgroundColor: colors.bgPanel,
  },
  chipAccent: { borderColor: colors.goldDim },
  chipText: {
    fontFamily: fonts.bodyMed,
    fontSize: 13,
    color: colors.text,
  },
  hero: {
    alignItems: 'center',
    marginTop: spacing.md,
    marginBottom: spacing.xl,
  },
  brand: {
    marginTop: spacing.md,
    fontFamily: fonts.display,
    fontSize: 30,
    letterSpacing: 2,
    color: colors.text,
  },
  tagline: {
    marginTop: spacing.xs,
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
  },
  tiles: { marginTop: spacing.xl, gap: 0 },
});
