import 'package:floor/floor.dart';

import '../entities/game_entity.dart';

@dao
abstract class GameDao {
  @Query('SELECT * FROM game Limit :limit')
  Future<List<GameEntity>> findGames(int limit);

  @Query('SELECT * FROM game WHERE id = :id')
  Future<GameEntity?> findGameById(int id);

  @insert
  Future<void> insertGame(GameEntity game);

  @insert
  Future<void> insertAllGames(List<GameEntity> games);

  @update
  Future<void> updateGame(GameEntity game);
}
