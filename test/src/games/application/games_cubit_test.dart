import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinch/src/games/application/games_cubit.dart';
import 'package:pinch/src/games/domain/models/game_lite_model.dart';
import 'package:pinch/src/games/domain/types/game_category_type.dart';
import 'package:pinch/src/games/domain/types/game_status_type.dart';
import 'package:pinch/src/shared/config/resource.dart';

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
    final gamesLite = [
      GameLiteModel(
        id: 1,
        name: 'test 1',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 2,
        name: 'test 2',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
    ];

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
    final gamesLite = [
      GameLiteModel(
        id: 1,
        name: 'test 1',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 2,
        name: 'test 2',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 3,
        name: 'test 3',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 4,
        name: 'test 4',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 5,
        name: 'test 5',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 6,
        name: 'test 6',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 7,
        name: 'test 7',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 8,
        name: 'test 8',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 9,
        name: 'test 9',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 10,
        name: 'test 10',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
    ];

    final gamesLite2 = [
      GameLiteModel(
        id: 1,
        name: 'test 1',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 2,
        name: 'test 2',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 3,
        name: 'test 3',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 4,
        name: 'test 4',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 5,
        name: 'test 5',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 6,
        name: 'test 6',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 7,
        name: 'test 7',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 8,
        name: 'test 8',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 9,
        name: 'test 9',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: null,
      ),
      GameLiteModel(
        id: 10,
        name: 'test 10',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
      GameLiteModel(
        id: 11,
        name: 'test 11',
        summary: 'test',
        cover: null,
        category: GameCategoryType.episode(),
        status: GameStatusType.alpha(),
      ),
    ];

    void set10GameLiteRepositoryWith10() {
      when(() => mockGamesRepositoryImplements.getGames(10))
          .thenAnswer((_) async {
        return Resource.success(gamesLite);
      });
    }

    void set11GameLiteRepositoryWith20() {
      when(() => mockGamesRepositoryImplements.getGames(20))
          .thenAnswer((_) async {
        return Resource.success(gamesLite2);
      });
    }

    void set11GameLiteRepositoryWith30() {
      when(() => mockGamesRepositoryImplements.getGames(30))
          .thenAnswer((_) async {
        return Resource.success(gamesLite2);
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
      expect(gamesCubit.state.gamesList, gamesLite2);
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
