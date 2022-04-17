import 'dart:developer';

import 'package:dio/dio.dart';

import '../../shared/config/resource.dart';
import '../../shared/database/database.dart';
import '../../shared/presentation/utils/const.dart';
import '../domain/entities/game_entity.dart';
import '../domain/failures/pinch_failure.dart';
import '../domain/games_repository_interface.dart';
import '../domain/models/game_lite_model.dart';
import '../domain/models/game_model.dart';
import 'dto/game_dto.dart';
import 'dto/game_lite_dto.dart';

class RemoteGamesRepositoryImplements extends GamesRepositoryInterface {
  final Dio _http;
  final AppDatabase _database;

  RemoteGamesRepositoryImplements(this._http, this._database);

  @override
  Future<Resource<PinchFailure, List<GameLiteModel>>> getGames(
      int limit) async {
    try {
      final body =
          'fields id, name, summary, category, status, cover.url; limit $limit;';
      var response = await _http.post(
        urlGames,
        data: body,
      );
      if (response.statusCode != 200) {
        return Resource.failure(PinchFailure.serverError());
      }
      List<GameLiteModel> gamesLite = List<GameLiteModel>.from(
              (response.data.map((x) => GameLiteDto.fromMap(x).toDomain())))
          .toList();

      // * Insert all games in database
      await insertGamesInDatabase(gamesLite);

      return Resource.success(gamesLite);
    } on DioError catch (_) {
      // I dont know error code
      // if (e.response == null || e.response!.statusCode == 403) {
      //   return Resource.failure(PinchFailure.serverError());
      // }
      // switch (e.response!.data['errorCode']) {
      //   case ResponseErrorCode.serverError:
      //     return Resource.failure(PinchFailure.serverError());

      //   default:
      //     return Resource.failure(PinchFailure.serverError());
      // }
      return Resource.failure(PinchFailure.serverError());
    } catch (e, _) {
      return Resource.failure(PinchFailure.serverError());
    }
  }

  @override
  Future<Resource<PinchFailure, GameModel>> getGameDetail(int gameId) async {
    try {
      final body =
          'fields id, name, summary, category, status, cover.url, screenshots.url, similar_games.id, similar_games.name, similar_games.category, similar_games.summary, similar_games.status, similar_games.cover.url, url; where id = $gameId;';

      var response = await _http.post(
        urlGames,
        data: body,
      );

      if (response.statusCode != 200) {
        return Resource.failure(PinchFailure.serverError());
      }
      log('response.data: ${response.data}');

      GameModel game = (response.data.map((x) => GameDto.fromMap(x).toDomain()))
          .toList()
          .first;

      // * Update full game and insert all games from similar_games in database
      await updateFullGameInDatabase(game);

      return Resource.success(game);
    } on DioError catch (_) {
      return Resource.failure(PinchFailure.serverError());
    } catch (e, _) {
      return Resource.failure(PinchFailure.serverError());
    }
  }

  Future<void> insertGamesInDatabase(List<GameLiteModel> gamesLite) async {
    try {
      final coversTemp = gamesLite.where((x) => x.cover != null).toList();
      coversTemp.map((e) async {
        try {
          await _database.coverDao.insertCover(e.cover!.toCoverEntity());
        } catch (_) {}
        e.cover!.toCoverEntity();
      }).toList();
      gamesLite.map((e) async {
        try {
          await _database.gameDao.insertGame(e.toGameEntity());
        } catch (_) {}
        e.toGameEntity();
      }).toList();
    } catch (__, _) {}
  }

  Future<void> updateFullGameInDatabase(GameModel game) async {
    try {
      String screenshots = '';
      String similarGames = '';
      // insert screenshots
      if (game.screenshots != null) {
        screenshots = game.screenshots!.map((e) => e.id.toString()).join(',');
        game.screenshots!.map((e) async {
          try {
            await _database.screenshotDao
                .insertScreenshot(e.toScreenshotEntity());
          } catch (_) {}
        }).toList();
      }
      // insert similar games
      if (game.similarGames != null) {
        similarGames = game.similarGames!.map((e) => e.id.toString()).join(',');
        await insertGamesInDatabase(game.similarGames!);
      }

      final gameToSave = GameEntity(
        id: game.id,
        name: game.name,
        category: game.category.toString(),
        status: game.status.toString(),
        summary: game.summary,
        cover: game.cover?.id,
        url: game.url,
        screenshots: screenshots,
        similarGames: similarGames,
      );

      await _database.gameDao.updateGame(gameToSave);
    } catch (__, _) {}
  }
}
