import 'dart:convert';

import '../../../shared/presentation/utils/functions.dart';
import '../../domain/models/cover_model.dart';

class CoverDto {
  final int id;
  final String url;
  CoverDto({
    required this.id,
    required this.url,
  });
  CoverDto._({
    required this.id,
    required this.url,
  });

  static CoverDto fromDomain(CoverModel domain) {
    return CoverDto._(
      id: domain.id,
      url: domain.url,
    );
  }

  CoverModel toDomain() {
    return CoverModel(
      id: id,
      url: url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }

  factory CoverDto.fromMap(Map<String, dynamic> map) {
    final url = fixUrl(map['url']);
    return CoverDto(
      id: map['id'],
      url: url,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoverDto.fromJson(String source) =>
      CoverDto.fromMap(json.decode(source));
}
