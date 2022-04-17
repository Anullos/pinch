import '../entities/cover_entity.dart';

class CoverModel {
  final int id;
  final String url;
  CoverModel({
    required this.id,
    required this.url,
  });

  CoverModel copyWith({
    int? id,
    String? url,
  }) {
    return CoverModel(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  CoverEntity toCoverEntity() => CoverEntity(
        id: id,
        url: url,
      );

  @override
  String toString() => 'CoverModel(id: $id, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoverModel && other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}
