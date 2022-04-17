import 'package:floor/floor.dart';

import '../models/screenshot_model.dart';

@Entity(tableName: 'screenshot')
class ScreenshotEntity {
  @primaryKey
  final int id;
  final String url;

  ScreenshotEntity({required this.id, required this.url});

  ScreenshotModel toScreenshotModel() {
    return ScreenshotModel(
      id: id,
      url: url,
    );
  }
}
