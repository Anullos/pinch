import 'dart:convert';

import '../../domain/models/game_lite_model.dart';
import '../../domain/types/game_status_type.dart';
import '../../domain/types/game_category_type.dart';
import '../../presentation/extensions/game_category_type_extension.dart';
import '../../presentation/extensions/game_status_type_extension.dart';
import 'cover_dto.dart';

class GameLiteDto {
  final int id;
  final String name;
  final String? summary;
  final CoverDto? cover;
  final GameCategoryType category;
  final GameStatusType? status;
  GameLiteDto({
    required this.id,
    required this.name,
    this.summary,
    this.cover,
    required this.category,
    this.status,
  });
  GameLiteDto._({
    required this.id,
    required this.name,
    this.summary,
    this.cover,
    required this.category,
    this.status,
  });

  static GameLiteDto fromDomain(GameLiteModel domain) {
    return GameLiteDto._(
      id: domain.id,
      name: domain.name,
      summary: domain.summary,
      cover: domain.cover == null ? null : CoverDto.fromDomain(domain.cover!),
      category: domain.category,
      status: domain.status,
    );
  }

  GameLiteModel toDomain() {
    return GameLiteModel(
      id: id,
      name: name,
      summary: summary,
      cover: cover?.toDomain(),
      category: category,
      status: status,
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
    };
  }

  factory GameLiteDto.fromMap(Map<String, dynamic> map) {
    return GameLiteDto(
      id: map['id'],
      name: map['name'] ?? '',
      summary: map['summary'],
      cover: map['cover'] == null ? null : CoverDto.fromMap(map['cover']),
      category: GameCategoryTypeExtension.fromValue(map['category']),
      status: map['status'] != null
          ? GameStatusTypeExtension.fromValue(map['status'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameLiteDto.fromJson(String source) =>
      GameLiteDto.fromMap(json.decode(source));
}
