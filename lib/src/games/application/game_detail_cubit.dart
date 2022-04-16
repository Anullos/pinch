import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/config/resource.dart';
import '../domain/failures/pinch_failure.dart';
import '../domain/games_repository_interface.dart';
import '../domain/models/game_model.dart';

part 'game_detail_state.dart';

class GameDetailCubit extends Cubit<GameDetailState> {
  GameDetailCubit({required this.gamesRepository})
      : super(GameDetailState.initial());
  late final GamesRepositoryInterface gamesRepository;

  Future<void> getGameDetail(int gameId) async {
    emit(state.copyWith(gamesFailureOrSuccess: Resource.loading()));
    final result = await gamesRepository.getGameDetail(gameId);
    emit(state.copyWith(gamesFailureOrSuccess: result));
  }

  Future<void> goToPage() async {
    String _url = '';
    state.gamesFailureOrSuccess.whenIsSuccess((resource) {
      _url = resource.url;
    });
    try {
      await launch(_url);
    } catch (e) {
      emit(state.copyWith(launchUrlError: true));
    }
    emit(state.copyWith(launchUrlError: false));
  }
}
