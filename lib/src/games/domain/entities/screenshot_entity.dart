import 'package:floor/floor.dart';

@Entity(tableName: 'screenshot')
class ScreenshotEntity {
  @primaryKey
  final int id;
  final String url;

  ScreenshotEntity(this.id, this.url);
}
