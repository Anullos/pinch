import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinch/src/games/application/games_cubit.dart';

class MockGamesCubit extends MockCubit<GamesState> implements GamesCubit {}

class MockGamesStateFake extends Fake implements GamesState {}
