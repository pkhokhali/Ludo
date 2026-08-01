import { useRouter } from 'expo-router';
import { Image, StyleSheet, Text, View } from 'react-native';
import {
  ArenaScaffold,
  DestTile,
  NeonButton,
  SectionBanner,
  ToggleRow,
} from '@/src/components/ui';
import { ArenaAssets } from '@/src/constants/assets';
import { usePrefsStore } from '@/src/store/prefsStore';
import { colors, fonts, spacing } from '@/src/theme';

export default function SettingsScreen() {
  const router = useRouter();
  const prefs = usePrefsStore();

  return (
    <ArenaScaffold title="Settings">
      <View style={styles.header}>
        <Image
          source={ArenaAssets.settingsGear}
          style={{ width: 40, height: 40 }}
          resizeMode="contain"
        />
        <SectionBanner label="Settings" />
      </View>

      <ToggleRow
        label="Sounds"
        enabled={prefs.soundEnabled}
        onChange={prefs.setSound}
      />
      <ToggleRow
        label="Music"
        enabled={prefs.musicEnabled}
        onChange={prefs.setMusic}
      />
      <ToggleRow
        label="Haptics"
        enabled={prefs.hapticsEnabled}
        onChange={prefs.setHaptics}
      />
      <ToggleRow
        label="Continuous Rolling"
        enabled={prefs.continuousRolling}
        onChange={prefs.setContinuousRolling}
      />

      <Text style={styles.section}>Quick links</Text>
      <DestTile title="Help" onPress={() => router.push('/help')} />
      <DestTile title="About" onPress={() => router.push('/about')} />

      <NeonButton
        label="Done"
        onPress={() => router.back()}
        style={{ marginTop: spacing.lg }}
      />
    </ArenaScaffold>
  );
}

const styles = StyleSheet.create({
  header: {
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  section: {
    marginTop: spacing.lg,
    marginBottom: spacing.sm,
    fontFamily: fonts.bodyBold,
    fontSize: 12,
    letterSpacing: 2,
    color: colors.cyan,
    textTransform: 'uppercase',
  },
});
