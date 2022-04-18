import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinch/src/games/application/games_cubit.dart';
import 'package:pinch/src/games/presentation/pages/games_page.dart';
import 'package:pinch/src/games/presentation/widgets/item_game_list.dart';
import 'package:pinch/src/shared/config/resource.dart';

import '../../../../helper/pump_app.dart';
import '../../application/mock_games_cubit.dart';
import '../../infrastructure/data.dart';

void main() {
  late MockGamesCubit mockGamesCubit;

  setUp(() {
    registerFallbackValue(MockGamesStateFake());
    mockGamesCubit = MockGamesCubit();
  });

  Widget createMyPomp() {
    return BlocProvider<GamesCubit>(
      create: (context) => mockGamesCubit,
      child: const GamesPage(),
    );
  }

  testWidgets('checks 10 elements games displayed',
      (WidgetTester tester) async {
    when(() => mockGamesCubit.getGames()).thenAnswer((_) => Future.value());
    when(() => mockGamesCubit.state).thenAnswer(
      (_) => GamesState(
        page: 1,
        limit: 10,
        gamesList: gamesLite10,
        isFirstLoadRunning: false,
        isLoadMoreRunning: false,
        hasNextPage: true,
        gamesFailureOrSuccess: Resource.success(gamesLite10),
      ),
    );

    await tester.pumpApp(createMyPomp());
    await tester.pumpAndSettle();
    expect(find.byType(ItemGameList), findsNWidgets(10));
  });
}
