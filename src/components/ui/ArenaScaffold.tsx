import { ReactNode } from 'react';
import {
  ScrollView,
  StyleSheet,
  Text,
  View,
  ViewStyle,
  Pressable,
} from 'react-native';
import { useRouter } from 'expo-router';
import { SafeAreaView } from 'react-native-safe-area-context';
import { ArenaBackground } from './ArenaBackground';
import { ViewfinderCorners } from './ViewfinderCorners';
import { colors, fonts, spacing } from '@/src/theme';

type Props = {
  title?: string;
  children: ReactNode;
  scroll?: boolean;
  showBack?: boolean;
  right?: ReactNode;
  contentStyle?: ViewStyle;
  corners?: boolean;
};

export function ArenaScaffold({
  title,
  children,
  scroll = true,
  showBack = true,
  right,
  contentStyle,
  corners = true,
}: Props) {
  const router = useRouter();
  const body = scroll ? (
    <ScrollView
      contentContainerStyle={[styles.content, contentStyle]}
      showsVerticalScrollIndicator={false}
      bounces
    >
      {children}
    </ScrollView>
  ) : (
    <View style={[styles.content, styles.flex, contentStyle]}>{children}</View>
  );

  return (
    <ArenaBackground>
      {corners ? <ViewfinderCorners /> : null}
      <SafeAreaView style={styles.flex} edges={['top', 'bottom']}>
        {(title || showBack || right) && (
          <View style={styles.header}>
            {showBack ? (
              <Pressable onPress={() => router.back()} hitSlop={12} style={styles.back}>
                <Text style={styles.backText}>←</Text>
              </Pressable>
            ) : (
              <View style={styles.back} />
            )}
            <Text style={styles.title} numberOfLines={1}>
              {title ?? ''}
            </Text>
            <View style={styles.right}>{right}</View>
          </View>
        )}
        {body}
      </SafeAreaView>
    </ArenaBackground>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.sm,
    minHeight: 48,
  },
  back: { width: 40, alignItems: 'flex-start' },
  backText: {
    fontFamily: fonts.title,
    fontSize: 26,
    color: colors.cyan,
  },
  title: {
    flex: 1,
    textAlign: 'center',
    fontFamily: fonts.displayMed,
    fontSize: 16,
    letterSpacing: 2,
    color: colors.text,
    textTransform: 'uppercase',
  },
  right: { width: 40, alignItems: 'flex-end' },
  content: {
    paddingHorizontal: spacing.lg,
    paddingBottom: spacing.xxl,
    gap: spacing.md,
  },
});
