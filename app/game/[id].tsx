import { useLocalSearchParams, useRouter } from 'expo-router';
import { useEffect } from 'react';
import {
  Pressable,
  StyleSheet,
  Text,
  useWindowDimensions,
  View,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { ArenaBackground, ViewfinderCorners } from '@/src/components/ui';
import { ArenaBoard } from '@/src/components/game/ArenaBoard';
import { DiceFace } from '@/src/components/game/DiceFace';
import { useSessionStore } from '@/src/store/sessionStore';
import { colors, fonts, radii, spacing } from '@/src/theme';

export default function GameScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();
  const { width } = useWindowDimensions();
  const boardSize = Math.min(width - 32, 420);

  const state = useSessionStore((s) => s.state);
  const legalMoves = useSessionStore((s) => s.legalMoves);
  const rolling = useSessionStore((s) => s.rolling);
  const roll = useSessionStore((s) => s.roll);
  const move = useSessionStore((s) => s.move);
  const tickAi = useSessionStore((s) => s.tickAi);

  useEffect(() => {
    if (!state) {
      router.replace('/home');
    }
  }, [state, router]);

  useEffect(() => {
    if (!state || state.phase === 'finished') return;
    const player = state.players[state.currentPlayerIndex];
    if (player.type !== 'ai') return;
    const t = setTimeout(() => tickAi(), rolling ? 700 : 650);
    return () => clearTimeout(t);
  }, [state, rolling, tickAi]);

  useEffect(() => {
    if (state?.phase === 'finished') {
      const t = setTimeout(() => router.replace('/result'), 900);
      return () => clearTimeout(t);
    }
  }, [state?.phase, router]);

  if (!state) return null;

  const current = state.players[state.currentPlayerIndex];
  const canRoll =
    state.phase === 'rolling' && current.type === 'human' && !rolling;
  const diceValue = state.lastDiceValue ?? 5;

  return (
    <ArenaBackground>
      <ViewfinderCorners inset={10} />
      <SafeAreaView style={styles.safe} edges={['top', 'bottom']}>
        <View style={styles.top}>
          <Pressable onPress={() => router.replace('/home')}>
            <Text style={styles.pause}>✕</Text>
          </Pressable>
          <View style={styles.banner}>
            <View
              style={[styles.seatDot, { backgroundColor: colors.seats[current.seat] }]}
            />
            <Text style={styles.turnText}>{current.name}&apos;s turn</Text>
          </View>
          <Text style={styles.matchId}>{String(id).slice(-4)}</Text>
        </View>

        <View style={styles.hudRow}>
          {state.players.map((p) => (
            <View
              key={p.id}
              style={[
                styles.playerCard,
                p.id === current.id && styles.playerActive,
              ]}
            >
              <View
                style={[styles.seatDot, { backgroundColor: colors.seats[p.seat] }]}
              />
              <Text style={styles.playerName} numberOfLines={1}>
                {p.name}
              </Text>
              <Text style={styles.playerMeta}>
                {state.tokens.filter(
                  (t) => t.seat === p.seat && t.status === 'finished',
                ).length}
                /4
              </Text>
            </View>
          ))}
        </View>

        <View style={styles.boardWrap}>
          <ArenaBoard
            size={boardSize}
            tokens={state.tokens}
            legalMoves={legalMoves}
            onTokenPress={move}
          />
        </View>

        <View style={styles.bottom}>
          <DiceFace value={diceValue} size={72} rolling={rolling} />
          <Pressable
            disabled={!canRoll}
            onPress={roll}
            style={[styles.rollBtn, !canRoll && styles.rollDisabled]}
          >
            <Text style={styles.rollLabel}>
              {state.phase === 'selectingToken'
                ? 'Tap a glowing token'
                : rolling
                  ? 'Rolling…'
                  : 'Roll Dice'}
            </Text>
          </Pressable>
        </View>
      </SafeAreaView>
    </ArenaBackground>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, paddingHorizontal: spacing.md },
  top: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginBottom: spacing.sm,
  },
  pause: {
    fontFamily: fonts.title,
    fontSize: 22,
    color: colors.textSecondary,
    width: 36,
  },
  banner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.sm,
    borderRadius: radii.pill,
    borderWidth: 1,
    borderColor: colors.border,
    backgroundColor: colors.bgPanel,
  },
  turnText: {
    fontFamily: fonts.titleMed,
    fontSize: 16,
    color: colors.text,
  },
  matchId: {
    width: 36,
    textAlign: 'right',
    fontFamily: fonts.body,
    fontSize: 11,
    color: colors.textMuted,
  },
  seatDot: { width: 10, height: 10, borderRadius: 5 },
  hudRow: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
    marginBottom: spacing.sm,
  },
  playerCard: {
    flexGrow: 1,
    minWidth: '45%',
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: spacing.md,
    paddingVertical: 8,
    borderRadius: radii.md,
    backgroundColor: colors.bgPanel,
    borderWidth: 1,
    borderColor: colors.border,
  },
  playerActive: { borderColor: colors.cyan },
  playerName: {
    flex: 1,
    fontFamily: fonts.bodyMed,
    fontSize: 13,
    color: colors.text,
  },
  playerMeta: {
    fontFamily: fonts.body,
    fontSize: 12,
    color: colors.textSecondary,
  },
  boardWrap: { flex: 1, justifyContent: 'center' },
  bottom: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.lg,
    paddingVertical: spacing.md,
  },
  rollBtn: {
    flex: 1,
    minHeight: 56,
    borderRadius: radii.lg,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.cyan,
  },
  rollDisabled: { opacity: 0.45 },
  rollLabel: {
    fontFamily: fonts.title,
    fontSize: 18,
    letterSpacing: 1,
    color: colors.bg,
    textTransform: 'uppercase',
  },
});
