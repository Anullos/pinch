import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../shared/config/resource.dart';
import '../domain/failures/pinch_failure.dart';
import '../domain/games_repository_interface.dart';
import '../domain/models/game_lite_model.dart';

part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  GamesCubit({required this.gamesRepository}) : super(GamesState.initial());
  late final GamesRepositoryInterface gamesRepository;

  Future<void> getGames() async {
    emit(state.copyWith(gamesFailureOrSuccess: Resource.loading()));
    final result = await gamesRepository.getGames(state.limit);
    emit(state.copyWith(gamesFailureOrSuccess: result));
    List<GameLiteModel> games = [];
    result.whenIsSuccess((resource) {
      games = resource;
    });
    emit(state.copyWith(gamesList: games, isFirstLoadRunning: false));
  }

  Future<void> update() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> loadMore(double scrollPosition) async {
    if (state.hasNextPage == true &&
        state.isFirstLoadRunning == false &&
        state.isLoadMoreRunning == false &&
        scrollPosition < 300) {
      int currentPage = state.page + 1;
      int currentLimit = state.limit + 10;
      emit(state.copyWith(
          isLoadMoreRunning: true, page: currentPage, limit: currentLimit));
      try {
        final result = await gamesRepository.getGames(state.limit);
        List<GameLiteModel> tempGames = [];
        result.whenIsSuccess((resource) {
          tempGames = resource;
        });

        if (tempGames.length > state.gamesList.length) {
          List<GameLiteModel> currentGames = [];
          currentGames.addAll(tempGames);
          emit(state.copyWith(
              gamesList: currentGames, isLoadMoreRunning: false));
        } else {
          emit(state.copyWith(hasNextPage: false, isLoadMoreRunning: false));
        }
      } catch (err) {
        emit(state.copyWith(hasNextPage: false, isLoadMoreRunning: false));
      }
    }
  }
}
