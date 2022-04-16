import 'dart:convert';

import '../../../shared/presentation/utils/functions.dart';
import '../../domain/models/screenshot_model.dart';

class ScreenshotDto {
  final int id;
  final String url;
  ScreenshotDto({
    required this.id,
    required this.url,
  });
  ScreenshotDto._({
    required this.id,
    required this.url,
  });

  static ScreenshotDto fromDomain(ScreenshotModel domain) {
    return ScreenshotDto._(
      id: domain.id,
      url: domain.url,
    );
  }

  ScreenshotModel toDomain() {
    return ScreenshotModel(
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

  factory ScreenshotDto.fromMap(Map<String, dynamic> map) {
    final url = fixUrl(map['url']);
    return ScreenshotDto(
      id: map['id'],
      url: url,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScreenshotDto.fromJson(String source) =>
      ScreenshotDto.fromMap(json.decode(source));
}
