import 'dart:developer';

import '../../shared/database/database.dart';
import '../domain/entities/game_entity.dart';
import '../domain/failures/pinch_failure.dart';
import '../../shared/config/resource.dart';
import '../domain/games_repository_interface.dart';
import '../domain/models/game_lite_model.dart';
import '../domain/models/game_model.dart';

class LocalGamesRepositoryImplements extends GamesRepositoryInterface {
  final AppDatabase _database;

  LocalGamesRepositoryImplements(this._database);

  @override
  Future<Resource<PinchFailure, List<GameLiteModel>>> getGames(
      int limit) async {
    try {
      List<GameEntity> games = await _database.gameDao.findGames(limit);
      List<GameLiteModel> result = [];
      for (var e in games) {
        final game = await e.toGameLite(_database.coverDao);
        result.add(game);
      }
      return Resource.success(result);
    } catch (e, f) {
      log('Database error: $e, $f');
      return Resource.failure(PinchFailure.serverError());
    }
  }

  @override
  Future<Resource<PinchFailure, GameModel>> getGameDetail(int gameId) async {
    try {
      final game = await _database.gameDao.findGameById(gameId);

      if (game != null) {
        final result = await game.toGame(
            _database.coverDao, _database.screenshotDao, _database.gameDao);

        return Resource.success(result);
      } else {
        return Resource.failure(PinchFailure.serverError());
      }
    } catch (e, f) {
      log('Database error: $e, $f');
      return Resource.failure(PinchFailure.serverError());
    }
  }
}
