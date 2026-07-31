/// Shared enums for seats, modes, difficulties, and token status.
library;

enum PlayerSeat {
  red,
  blue,
  green,
  yellow;

  static PlayerSeat fromIndex(int i) => PlayerSeat.values[i % 4];
}

enum GameMode {
  classic,
  power,
  quick,
  ai,
  passPlay;

  String get storageKey => name;
}

enum AiDifficulty {
  easy,
  medium,
  hard,
  expert;
}

enum PlayerType {
  human,
  ai,
}

enum TokenStatus {
  /// Still in home base; needs unlock roll.
  yard,

  /// On the main loop path.
  onBoard,

  /// On the colored home stretch toward finish.
  homeStretch,

  /// Finished / reached home triangle.
  finished,
}

enum PowerType {
  shield,
  portal,
  goldenDice,
  reverseMove,
  breakBlockade,
  doubleMove,
  safeLanding,
  momentumBoost,
  reRoll,
}

enum CellKind {
  path,
  safe,
  start,
  homeEntry,
  homeStretch,
  finish,
  portal,
}
