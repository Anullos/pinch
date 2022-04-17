import 'package:floor/floor.dart';

import '../dao/cover_dao.dart';
import '../dao/game_dao.dart';
import '../dao/screenshot_dao.dart';
import '../models/game_lite_model.dart';
import '../models/game_model.dart';
import '../models/screenshot_model.dart';
import '../types/game_category_type.dart';
import '../types/game_status_type.dart';
import 'cover_entity.dart';

@Entity(
  tableName: 'game',
  foreignKeys: [
    ForeignKey(
      childColumns: ['cover'],
      parentColumns: ['id'],
      entity: CoverEntity,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class GameEntity {
  @primaryKey
  final int id;
  @ColumnInfo(name: 'name')
  final String name;
  @ColumnInfo(name: 'summary')
  final String? summary;
  @ColumnInfo(name: 'cover')
  final int? cover;
  @ColumnInfo(name: 'category')
  final String category;
  @ColumnInfo(name: 'status')
  final String? status;
  @ColumnInfo(name: 'screenshots')
  final String? screenshots;
  @ColumnInfo(name: 'similar_games')
  final String? similarGames;
  @ColumnInfo(name: 'url')
  final String url;

  const GameEntity({
    required this.id,
    required this.name,
    required this.summary,
    required this.cover,
    required this.category,
    required this.status,
    required this.screenshots,
    required this.similarGames,
    required this.url,
  });

  Future<GameLiteModel> toGameLite(CoverDao coverDao) async {
    CoverEntity? currentCover;
    if (cover != null) {
      currentCover = await coverDao.findCoverById(cover!);
    }
    return GameLiteModel(
      id: id,
      name: name,
      category: GameCategoryType.fromString(category),
      cover: currentCover?.toCoverModel(),
      status: status != null ? GameStatusType.fromString(status!) : null,
      summary: summary,
    );
  }

  Future<GameModel> toGame(
      CoverDao coverDao, ScreenshotDao screenshotDao, GameDao gameDao) async {
    // Cover
    CoverEntity? currentCover;
    if (cover != null) {
      currentCover = await coverDao.findCoverById(cover!);
    }
    // Screenshots
    List<ScreenshotModel>? screenshotsList;
    if (screenshots != null) {
      screenshotsList = [];
      List<int> screenshotsIds =
          screenshots!.split(',').map((e) => int.parse(e)).toList();
      for (int id in screenshotsIds) {
        final screen = await screenshotDao.findScreenshotById(id);
        screenshotsList.add(screen!.toScreenshotModel());
      }
    }
    // Similar games
    List<GameLiteModel>? similarGamesList;
    if (similarGames != null) {
      similarGamesList = [];
      List<int> similarGamesIds =
          similarGames!.split(',').map((e) => int.parse(e)).toList();
      for (int id in similarGamesIds) {
        final gameEntity = await gameDao.findGameById(id);
        final game = await gameEntity!.toGameLite(coverDao);
        similarGamesList.add(game);
      }
    }

    return GameModel(
      id: id,
      name: name,
      category: GameCategoryType.fromString(category),
      cover: currentCover?.toCoverModel(),
      status: status != null ? GameStatusType.fromString(status!) : null,
      summary: summary,
      url: url,
      screenshots: screenshotsList,
      similarGames: similarGamesList,
    );
  }
}
