import '../types/game_category_type.dart';
import '../types/game_status_type.dart';
import 'cover_model.dart';

class GameLiteModel {
  final int id;
  final String name;
  final String? summary;
  final CoverModel? cover;
  final GameCategoryType category;
  final GameStatusType? status;
  GameLiteModel({
    required this.id,
    required this.name,
    this.summary,
    this.cover,
    required this.category,
    this.status,
  });

  GameLiteModel copyWith({
    int? id,
    String? name,
    String? summary,
    CoverModel? cover,
    GameCategoryType? category,
    GameStatusType? status,
  }) {
    return GameLiteModel(
      id: id ?? this.id,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      cover: cover ?? this.cover,
      category: category ?? this.category,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'GameLiteModel(id: $id, name: $name, summary: $summary, cover: $cover, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameLiteModel &&
        other.id == id &&
        other.name == name &&
        other.summary == summary &&
        other.cover == cover &&
        other.category == category &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        summary.hashCode ^
        cover.hashCode ^
        category.hashCode ^
        status.hashCode;
  }
}
