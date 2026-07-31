import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ludo_arena/core/constants/app_constants.dart';
import 'package:ludo_arena/core/services/profile_repository.dart';
import 'package:ludo_arena/models/achievement.dart';
import 'package:ludo_arena/models/player_profile.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    Hive.init('test_hive_tmp');
    for (final name in [
      HiveBoxes.profile,
      HiveBoxes.statistics,
      HiveBoxes.achievements,
    ]) {
      if (Hive.isBoxOpen(name)) {
        await Hive.box(name).clear();
      } else {
        await Hive.openBox(name);
      }
    }
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
  });

  test('profile xp levels up at threshold', () async {
    final repo = ProfileRepository();
    await repo.save(const PlayerProfile(level: 1, xp: 90));
    final next = await repo.addXp(20);
    expect(next.level, 2);
    expect(next.xp, 10);
  });

  test('statistics records win streak', () async {
    final repo = StatisticsRepository();
    final s1 = await repo.recordMatch(won: true, captures: 2, momentumUsed: 1);
    expect(s1.wins, 1);
    expect(s1.currentWinningStreak, 1);
    final s2 = await repo.recordMatch(won: true, captures: 1, momentumUsed: 0);
    expect(s2.currentWinningStreak, 2);
    expect(s2.longestWinningStreak, 2);
  });

  test('achievements unlock first win', () async {
    final repo = AchievementsRepository();
    final newly = await repo.evaluate(
      wins: 1,
      captures: 0,
      streak: 1,
      momentumUsage: 0,
    );
    expect(newly, contains('first_win'));
    expect(repo.unlockedIds(), contains('first_win'));
  });
}
