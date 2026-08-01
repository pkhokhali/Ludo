export const colors = {
  bg: '#050814',
  bgElevated: '#0B1220',
  bgPanel: 'rgba(16, 28, 48, 0.78)',
  navy: '#0A1628',
  cyan: '#00E5FF',
  cyanDim: 'rgba(0, 229, 255, 0.35)',
  cyanSoft: 'rgba(0, 229, 255, 0.12)',
  gold: '#E8C547',
  goldDim: 'rgba(232, 197, 71, 0.35)',
  cream: '#F7F1E6',
  border: 'rgba(0, 229, 255, 0.28)',
  borderStrong: 'rgba(0, 229, 255, 0.55)',
  text: '#F4F7FB',
  textSecondary: 'rgba(244, 247, 251, 0.65)',
  textMuted: 'rgba(244, 247, 251, 0.4)',
  danger: '#FF5252',
  success: '#3DDC84',
  seats: {
    red: '#E53935',
    blue: '#1E88E5',
    green: '#43A047',
    yellow: '#FDD835',
  },
  seatsSoft: {
    red: '#F8BBD0',
    blue: '#BBDEFB',
    green: '#C8E6C9',
    yellow: '#FFF9C4',
  },
} as const;

export type SeatColor = keyof typeof colors.seats;
