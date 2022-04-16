import 'package:flutter/foundation.dart';

import '../types/game_category_type.dart';
import '../types/game_status_type.dart';
import 'cover_model.dart';
import 'game_lite_model.dart';
import 'screenshot_model.dart';

class GameModel {
  final int id;
  final String name;
  final String? summary;
  final CoverModel? cover;
  final GameCategoryType category;
  final GameStatusType? status;
  final List<ScreenshotModel>? screenshots;
  final List<GameLiteModel>? similarGames;
  final String url;
  GameModel({
    required this.id,
    required this.name,
    this.summary,
    this.cover,
    required this.category,
    this.status,
    this.screenshots,
    this.similarGames,
    required this.url,
  });

  GameModel copyWith({
    int? id,
    String? name,
    String? summary,
    CoverModel? cover,
    GameCategoryType? category,
    GameStatusType? status,
    List<ScreenshotModel>? screenshots,
    List<GameLiteModel>? similarGames,
    String? url,
  }) {
    return GameModel(
      id: id ?? this.id,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      cover: cover ?? this.cover,
      category: category ?? this.category,
      status: status ?? this.status,
      screenshots: screenshots ?? this.screenshots,
      similarGames: similarGames ?? this.similarGames,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'GameModel(id: $id, name: $name, summary: $summary, cover: $cover, category: $category, status: $status, screenshots: $screenshots, similarGames: $similarGames, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameModel &&
        other.id == id &&
        other.name == name &&
        other.summary == summary &&
        other.cover == cover &&
        other.category == category &&
        other.status == status &&
        listEquals(other.screenshots, screenshots) &&
        listEquals(other.similarGames, similarGames) &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        summary.hashCode ^
        cover.hashCode ^
        category.hashCode ^
        status.hashCode ^
        screenshots.hashCode ^
        similarGames.hashCode ^
        url.hashCode;
  }
}
