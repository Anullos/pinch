import 'package:floor/floor.dart';

import '../entities/cover_entity.dart';

@dao
abstract class CoverDao {
  @Query('SELECT * FROM cover')
  Future<List<CoverEntity>> findCovers();

  @Query('SELECT * FROM cover WHERE id = :id')
  Future<CoverEntity?> findCoverById(int id);

  @insert
  Future<void> insertCover(CoverEntity cover);

  @insert
  Future<void> insertAllCovers(List<CoverEntity> covers);
}
