import 'package:floor/floor.dart';

import '../models/cover_model.dart';

@Entity(tableName: 'cover')
class CoverEntity {
  @primaryKey
  final int id;
  final String url;

  CoverEntity({required this.id, required this.url});

  CoverModel toCoverModel() {
    return CoverModel(
      id: id,
      url: url,
    );
  }
}
