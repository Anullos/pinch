import 'dart:convert';

import '../../domain/models/game_model.dart';
import '../../domain/types/game_category_type.dart';
import '../../domain/types/game_status_type.dart';
import '../../presentation/extensions/game_category_type_extension.dart';
import '../../presentation/extensions/game_status_type_extension.dart';
import 'cover_dto.dart';
import 'game_lite_dto.dart';
import 'screenshot_dto.dart';

class GameDto {
  final int id;
  final String name;
  final String? summary;
  final CoverDto? cover;
  final GameCategoryType category;
  final GameStatusType? status;
  final List<ScreenshotDto>? screenshots;
  final List<GameLiteDto>? similarGames;
  final String url;
  GameDto({
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
  GameDto._({
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

  static GameDto fromDomain(GameModel domain) {
    return GameDto._(
      id: domain.id,
      name: domain.name,
      summary: domain.summary,
      cover: domain.cover == null ? null : CoverDto.fromDomain(domain.cover!),
      category: domain.category,
      status: domain.status,
      screenshots:
          domain.screenshots?.map((e) => ScreenshotDto.fromDomain(e)).toList(),
      similarGames:
          domain.similarGames?.map((e) => GameLiteDto.fromDomain(e)).toList(),
      url: domain.url,
    );
  }

  GameModel toDomain() {
    return GameModel(
      id: id,
      name: name,
      summary: summary,
      cover: cover?.toDomain(),
      category: category,
      status: status,
      screenshots: screenshots?.map((e) => e.toDomain()).toList(),
      similarGames: similarGames?.map((e) => e.toDomain()).toList(),
      url: url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'summary': summary,
      'cover': cover?.toMap(),
      'category': category.toValue(),
      'status': status?.toValue(),
      'screenshots': screenshots?.map((x) => x.toMap()).toList(),
      'similarGames': similarGames?.map((x) => x.toMap()).toList(),
      'url': url,
    };
  }

  factory GameDto.fromMap(Map<String, dynamic> map) {
    return GameDto(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      summary: map['summary'],
      cover: map['cover'] != null ? CoverDto.fromMap(map['cover']) : null,
      category: GameCategoryTypeExtension.fromValue(map['category']),
      status: map['status'] != null
          ? GameStatusTypeExtension.fromValue(map['status'])
          : null,
      screenshots: map['screenshots'] != null
          ? List<ScreenshotDto>.from(
              map['screenshots']?.map((x) => ScreenshotDto.fromMap(x)))
          : null,
      similarGames: map['similar_games'] != null
          ? List<GameLiteDto>.from(
              map['similar_games']?.map((x) => GameLiteDto.fromMap(x)))
          : null,
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDto.fromJson(String source) =>
      GameDto.fromMap(json.decode(source));
}
