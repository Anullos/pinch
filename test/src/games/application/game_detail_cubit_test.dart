import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinch/src/games/application/game_detail_cubit.dart';
import 'package:pinch/src/games/domain/failures/pinch_failure.dart';
import 'package:pinch/src/shared/config/resource.dart';

import '../infrastructure/data.dart';
import '../infrastructure/mock_games_repository_implements.dart';

void main() {
  late GameDetailCubit gamesCubit;
  late MockGamesRepositoryImplements mockGamesRepositoryImplements;

  setUp(() {
    mockGamesRepositoryImplements = MockGamesRepositoryImplements();
    gamesCubit =
        GameDetailCubit(gamesRepository: mockGamesRepositoryImplements);
  });

  test('initial state is GamesInitial', () {
    expect(gamesCubit.state.launchUrlError, false);
  });

  group('getGameDetail', () {
    void set1GameDetailRepository() {
      when(() => mockGamesRepositoryImplements.getGameDetail(1))
          .thenAnswer((_) async {
        return Resource.success(gameOne);
      });
    }

    test('get gameDetail from gameRepositoy', () async {
      set1GameDetailRepository();
      await gamesCubit.getGameDetail(1);
      verify(() => mockGamesRepositoryImplements.getGameDetail(1)).called(1);
    });

    test('changes values after getGameDetail', () async {
      set1GameDetailRepository();
      await gamesCubit.getGameDetail(1);
      Resource.failure(PinchFailure.serverError()).whenIsSuccess((resource) {
        expect(gamesCubit.state.gamesFailureOrSuccess, gameOne);
      });
    });
  });

  test('load page from method loadToPage', () async {
    await gamesCubit.goToPage();
    expect(gamesCubit.state.launchUrlError, false);
  });
}
