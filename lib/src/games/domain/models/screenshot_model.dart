import '../entities/screenshot_entity.dart';

class ScreenshotModel {
  final int id;
  final String url;
  ScreenshotModel({
    required this.id,
    required this.url,
  });

  ScreenshotModel copyWith({
    int? id,
    String? url,
  }) {
    return ScreenshotModel(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  ScreenshotEntity toScreenshotEntity() => ScreenshotEntity(
        id: id,
        url: url,
      );

  @override
  String toString() => 'ScreenshotModel(id: $id, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScreenshotModel && other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
