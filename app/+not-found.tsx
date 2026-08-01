import { Link, Stack } from 'expo-router';
import { StyleSheet, Text, View } from 'react-native';
import { colors, fonts, spacing } from '@/src/theme';

export default function NotFoundScreen() {
  return (
    <>
      <Stack.Screen options={{ title: 'Missing', headerShown: true }} />
      <View style={styles.container}>
        <Text style={styles.title}>Arena sector not found</Text>
        <Link href="/home" style={styles.link}>
          <Text style={styles.linkText}>Return to Home</Text>
        </Link>
      </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.bg,
    alignItems: 'center',
    justifyContent: 'center',
    padding: spacing.xl,
  },
  title: {
    fontFamily: fonts.title,
    fontSize: 20,
    color: colors.text,
  },
  link: { marginTop: spacing.lg },
  linkText: {
    fontFamily: fonts.bodyMed,
    fontSize: 16,
    color: colors.cyan,
  },
});
