import 'package:floor/floor.dart';

import '../entities/screenshot_entity.dart';

@dao
abstract class ScreenshotDao {
  @Query('SELECT * FROM screenshot')
  Future<List<ScreenshotEntity>> findScreenshots();

  @Query('SELECT * FROM screenshot WHERE id = :id')
  Future<ScreenshotEntity?> findScreenshotById(int id);

  @insert
  Future<void> insertScreenshot(ScreenshotEntity screenshot);
}
