import { TextStyle } from 'react-native';
import { colors } from './colors';

export const fonts = {
  display: 'Orbitron_700Bold',
  displayMed: 'Orbitron_600SemiBold',
  title: 'Rajdhani_700Bold',
  titleMed: 'Rajdhani_600SemiBold',
  body: 'DMSans_400Regular',
  bodyMed: 'DMSans_500Medium',
  bodyBold: 'DMSans_700Bold',
} as const;

export const type = {
  hero: {
    fontFamily: fonts.display,
    fontSize: 42,
    letterSpacing: 3,
    color: colors.text,
    fontStyle: 'italic',
  } satisfies TextStyle,
  h1: {
    fontFamily: fonts.display,
    fontSize: 28,
    letterSpacing: 1.5,
    color: colors.text,
  } satisfies TextStyle,
  h2: {
    fontFamily: fonts.title,
    fontSize: 22,
    letterSpacing: 1,
    color: colors.text,
  } satisfies TextStyle,
  label: {
    fontFamily: fonts.bodyMed,
    fontSize: 12,
    letterSpacing: 2.5,
    textTransform: 'uppercase',
    color: colors.cyan,
  } satisfies TextStyle,
  body: {
    fontFamily: fonts.body,
    fontSize: 15,
    color: colors.text,
  } satisfies TextStyle,
  bodySecondary: {
    fontFamily: fonts.body,
    fontSize: 14,
    color: colors.textSecondary,
  } satisfies TextStyle,
  button: {
    fontFamily: fonts.title,
    fontSize: 18,
    letterSpacing: 1.2,
    color: colors.bg,
  } satisfies TextStyle,
} as const;
