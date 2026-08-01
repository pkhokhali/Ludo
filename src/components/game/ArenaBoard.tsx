import { Pressable, StyleSheet, View } from 'react-native';
import Svg, { Polygon, Path } from 'react-native-svg';
import { cellToPixel, tokenCell, GRID } from '@/src/engine/boardLayout';
import { START_CELLS } from '@/src/engine/boardGeometry';
import type { LegalMove, PlayerSeat, Token } from '@/src/engine/types';
import { colors } from '@/src/theme';

type Props = {
  size: number;
  tokens: Token[];
  legalMoves: LegalMove[];
  onTokenPress?: (tokenId: string) => void;
};

const YARD_ORIGIN: Record<PlayerSeat, [number, number]> = {
  red: [1, 9],
  blue: [1, 1],
  green: [9, 1],
  yellow: [9, 9],
};

export function ArenaBoard({ size, tokens, legalMoves, onTokenPress }: Props) {
  const cell = size / GRID;
  const legalIds = new Set(legalMoves.map((m) => m.tokenId));
  const tokenSize = cell * 0.7;

  return (
    <View style={[styles.board, { width: size, height: size }]}>
      {/* Path cross */}
      <View style={[styles.bandH, { top: cell * 6, height: cell * 3, width: size }]} />
      <View style={[styles.bandV, { left: cell * 6, width: cell * 3, height: size }]} />

      {(Object.keys(YARD_ORIGIN) as PlayerSeat[]).map((seat) => {
        const [ox, oy] = YARD_ORIGIN[seat];
        return (
          <View
            key={seat}
            style={{
              position: 'absolute',
              left: ox * cell,
              top: oy * cell,
              width: cell * 5,
              height: cell * 5,
              borderRadius: 12,
              backgroundColor: colors.seats[seat],
              padding: cell * 0.35,
            }}
          >
            <View style={styles.yardInner}>
              {[0, 1, 2, 3].map((i) => (
                <View
                  key={i}
                  style={[
                    styles.pedestal,
                    {
                      width: cell * 0.9,
                      height: cell * 0.9,
                      borderRadius: cell * 0.45,
                      backgroundColor: colors.seats[seat],
                    },
                  ]}
                />
              ))}
            </View>
          </View>
        );
      })}

      {/* Home stretches */}
      {(Object.keys(colors.seats) as PlayerSeat[]).map((seat) => {
        const soft = colors.seatsSoft[seat];
        const cells =
          seat === 'red'
            ? Array.from({ length: 5 }, (_, i) => [7, 13 - i] as const)
            : seat === 'blue'
              ? Array.from({ length: 5 }, (_, i) => [1 + i, 7] as const)
              : seat === 'green'
                ? Array.from({ length: 5 }, (_, i) => [7, 1 + i] as const)
                : Array.from({ length: 5 }, (_, i) => [13 - i, 7] as const);
        return cells.map(([x, y], i) => (
          <View
            key={`${seat}-h-${i}`}
            style={{
              position: 'absolute',
              left: x * cell + 1,
              top: y * cell + 1,
              width: cell - 2,
              height: cell - 2,
              backgroundColor: soft,
            }}
          />
        ));
      })}

      {/* Start cells */}
      {(Object.entries(START_CELLS) as [PlayerSeat, number][]).map(([seat, id]) => {
        // Approximate path cell via tokenCell helper with fake token
        const cellPos = tokenCell(seat, 0, 'onBoard', 0, 0, id);
        return (
          <View
            key={`start-${seat}`}
            style={{
              position: 'absolute',
              left: cellPos[0] * cell + 1,
              top: cellPos[1] * cell + 1,
              width: cell - 2,
              height: cell - 2,
              backgroundColor: colors.seats[seat],
            }}
          />
        );
      })}

      {/* Center triangles */}
      <Svg
        width={cell * 3}
        height={cell * 3}
        style={{ position: 'absolute', left: cell * 6, top: cell * 6 }}
      >
        <Polygon points={`0,0 ${cell * 1.5},${cell * 1.5} 0,${cell * 3}`} fill={colors.seats.blue} />
        <Polygon points={`0,0 ${cell * 3},0 ${cell * 1.5},${cell * 1.5}`} fill={colors.seats.green} />
        <Polygon
          points={`${cell * 3},0 ${cell * 3},${cell * 3} ${cell * 1.5},${cell * 1.5}`}
          fill={colors.seats.yellow}
        />
        <Polygon
          points={`0,${cell * 3} ${cell * 3},${cell * 3} ${cell * 1.5},${cell * 1.5}`}
          fill={colors.seats.red}
        />
        <Path
          d={`M0 0 H${cell * 3} V${cell * 3} H0 Z`}
          stroke="#4E342E"
          strokeWidth={1.5}
          fill="none"
        />
      </Svg>

      {tokens.map((t) => {
        const c = tokenCell(
          t.seat,
          t.index,
          t.status,
          t.pathProgress,
          t.homeProgress,
          t.position,
        );
        const { x, y } = cellToPixel(c, size);
        const selectable = legalIds.has(t.id);
        return (
          <Pressable
            key={t.id}
            disabled={!selectable}
            onPress={() => onTokenPress?.(t.id)}
            style={[
              styles.token,
              {
                width: tokenSize,
                height: tokenSize,
                borderRadius: tokenSize / 2,
                left: x - tokenSize / 2,
                top: y - tokenSize / 2,
                backgroundColor: colors.seats[t.seat],
                borderColor: selectable ? colors.cyan : '#2E221D',
                borderWidth: selectable ? 2.5 : 1.5,
              },
            ]}
          />
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  board: {
    backgroundColor: colors.cream,
    borderRadius: 16,
    borderWidth: 3,
    borderColor: '#4E342E',
    overflow: 'hidden',
    alignSelf: 'center',
  },
  bandH: { position: 'absolute', left: 0, backgroundColor: colors.cream },
  bandV: { position: 'absolute', top: 0, backgroundColor: colors.cream },
  yardInner: {
    flex: 1,
    backgroundColor: colors.cream,
    borderRadius: 10,
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'center',
    justifyContent: 'space-evenly',
    padding: 4,
  },
  pedestal: { margin: 2, opacity: 0.95 },
  token: {
    position: 'absolute',
    zIndex: 5,
    elevation: 6,
    shadowColor: '#000',
    shadowOpacity: 0.35,
    shadowRadius: 3,
  },
});
