import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinch/src/games/application/games_cubit.dart';
import 'package:pinch/src/shared/config/resource.dart';

import '../infrastructure/data.dart';
import '../infrastructure/mock_games_repository_implements.dart';

void main() {
  late GamesCubit gamesCubit;
  late MockGamesRepositoryImplements mockGamesRepositoryImplements;

  setUp(() {
    mockGamesRepositoryImplements = MockGamesRepositoryImplements();
    gamesCubit = GamesCubit(gamesRepository: mockGamesRepositoryImplements);
  });

  test('initial state is GamesInitial', () {
    expect(gamesCubit.state.page, 1);
    expect(gamesCubit.state.limit, 10);
  });

  group('getGames', () {
    void set2GameLiteRepository() {
      when(() => mockGamesRepositoryImplements.getGames(10))
          .thenAnswer((_) async {
        return Resource.success(gamesLite);
      });
    }

    test('get games from gameRepositoy', () async {
      set2GameLiteRepository();
      await gamesCubit.getGames();
      verify(() => mockGamesRepositoryImplements.getGames(10)).called(1);
    });

    test('changes values after getGames', () async {
      set2GameLiteRepository();
      expect(gamesCubit.state.isFirstLoadRunning, true);
      await gamesCubit.getGames();
      expect(gamesCubit.state.isFirstLoadRunning, false);
      expect(gamesCubit.state.gamesList, gamesLite);
    });
  });

  group('loadMore', () {
    void set10GameLiteRepositoryWith10() {
      when(() => mockGamesRepositoryImplements.getGames(10))
          .thenAnswer((_) async {
        return Resource.success(gamesLite10);
      });
    }

    void set11GameLiteRepositoryWith20() {
      when(() => mockGamesRepositoryImplements.getGames(20))
          .thenAnswer((_) async {
        return Resource.success(gamesLite11);
      });
    }

    void set11GameLiteRepositoryWith30() {
      when(() => mockGamesRepositoryImplements.getGames(30))
          .thenAnswer((_) async {
        return Resource.success(gamesLite11);
      });
    }

    test('load more games', () async {
      set10GameLiteRepositoryWith10();
      await gamesCubit.getGames();
      set11GameLiteRepositoryWith20();
      await gamesCubit.loadMore(200);
      verify(() => mockGamesRepositoryImplements.getGames(10)).called(1);
      verify(() => mockGamesRepositoryImplements.getGames(20)).called(1);
    });

    test('load More when is not in the end of list', () async {
      set10GameLiteRepositoryWith10();
      await gamesCubit.getGames();
      set11GameLiteRepositoryWith20();
      await gamesCubit.loadMore(500);
      expect(gamesCubit.state.isLoadMoreRunning, false);
    });

    test('changes values after load More with success', () async {
      set10GameLiteRepositoryWith10();
      await gamesCubit.getGames();
      set11GameLiteRepositoryWith20();
      final future = gamesCubit.loadMore(200);
      expect(gamesCubit.state.isFirstLoadRunning, false);
      expect(gamesCubit.state.isLoadMoreRunning, true);
      expect(gamesCubit.state.page, 1);
      expect(gamesCubit.state.limit, 20);
      await future;
      expect(gamesCubit.state.page, 2);
      expect(gamesCubit.state.gamesList, gamesLite11);
      expect(gamesCubit.state.isLoadMoreRunning, false);
    });

    test('changes values after load More when there not more games to show',
        () async {
      set10GameLiteRepositoryWith10();
      await gamesCubit.getGames();
      set11GameLiteRepositoryWith20();
      await gamesCubit.loadMore(200);
      set11GameLiteRepositoryWith30();
      await gamesCubit.loadMore(200);
      expect(gamesCubit.state.page, 2);
      expect(gamesCubit.state.limit, 30);
      expect(gamesCubit.state.hasNextPage, false);
    });
  });
}
