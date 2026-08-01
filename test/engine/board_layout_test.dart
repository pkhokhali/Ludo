import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_arena/models/enums.dart';
import 'package:ludo_arena/widgets/board/board_layout.dart';

void main() {
  test('main path has 52 unique adjacent cells', () {
    final cells = [for (var i = 0; i < 52; i++) BoardLayout.pathCell(i)];
    expect(cells.length, 52);
    expect(cells.toSet().length, 52);

    for (var i = 0; i < 52; i++) {
      final a = cells[i];
      final b = cells[(i + 1) % 52];
      final dist = (a.dx - b.dx).abs() + (a.dy - b.dy).abs();
      // Orthogonal step = 1; classic Ludo corner elbows = 2.
      expect(dist, anyOf(1, 2), reason: 'cells $i -> ${(i + 1) % 52}');
    }
  });

  test('engine start cells map to correct corners', () {
    expect(BoardLayout.pathCell(0), const Offset(6, 13)); // red BL
    expect(BoardLayout.pathCell(13), const Offset(0, 5)); // blue TL
    expect(BoardLayout.pathCell(26), const Offset(8, 0)); // green TR
    expect(BoardLayout.pathCell(39), const Offset(14, 8)); // yellow BR
  });

  test('yards match seat corners', () {
    expect(BoardLayout.yardOrigin(PlayerSeat.red), const Offset(1, 9));
    expect(BoardLayout.yardOrigin(PlayerSeat.blue), const Offset(1, 1));
    expect(BoardLayout.yardOrigin(PlayerSeat.green), const Offset(9, 1));
    expect(BoardLayout.yardOrigin(PlayerSeat.yellow), const Offset(9, 9));
  });
}
