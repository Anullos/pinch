import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../games/domain/dao/cover_dao.dart';
import '../../games/domain/dao/game_dao.dart';
import '../../games/domain/dao/screenshot_dao.dart';
import '../../games/domain/entities/cover_entity.dart';
import '../../games/domain/entities/game_entity.dart';
import '../../games/domain/entities/screenshot_entity.dart';

part 'database.g.dart';

@Database(version: 1, entities: [GameEntity, CoverEntity, ScreenshotEntity])
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
  CoverDao get coverDao;
  ScreenshotDao get screenshotDao;
}
