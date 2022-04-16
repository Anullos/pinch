import '../../shared/config/resource.dart';
import 'failures/pinch_failure.dart';
import 'models/game_lite_model.dart';
import 'models/game_model.dart';

abstract class GamesRepositoryInterface {
  Future<Resource<PinchFailure, List<GameLiteModel>>> getGames(int limit);
  Future<Resource<PinchFailure, GameModel>> getGameDetail(int gameId);
}
