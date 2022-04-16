import '../domain/failures/pinch_failure.dart';
import '../../shared/config/resource.dart';
import '../domain/games_repository_interface.dart';
import '../domain/models/game_lite_model.dart';
import '../domain/models/game_model.dart';

class LocalGamesRepositoryImplements extends GamesRepositoryInterface {
  @override
  Future<Resource<PinchFailure, List<GameLiteModel>>> getGames(int limit) {
    // TODO: implement getGames
    throw UnimplementedError();
  }

  @override
  Future<Resource<PinchFailure, GameModel>> getGameDetail(int gameId) {
    // TODO: implement getGameDetail
    throw UnimplementedError();
  }
}
