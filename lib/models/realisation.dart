import 'package:cv_online_v2/models/trap_map_model.dart';

class Realisation {
  static const entryImageUrl = 'imageUrl';
  static const entryName = 'name';
  static const entryUrl = 'url';
  static const entryUrlGitHub = 'urlGitHub';

  final String imageUrl;
  final TradMapModel name;
  final String? url;
  final String? urlGitHub;

  Realisation({
    required this.imageUrl,
    required this.name,
    this.url,
    this.urlGitHub,
  });

  bool get online => url != null;

  @override
  String toString() {
    return 'Realisation(imageUrl: $imageUrl, name: $name, url: $url, urlGitHub: $urlGitHub)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Realisation &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.url == url &&
        other.urlGitHub == urlGitHub;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        name.hashCode ^
        url.hashCode ^
        urlGitHub.hashCode;
  }

  Realisation copyWith({
    String? imageUrl,
    TradMapModel? name,
    String? url,
    String? urlGitHub,
  }) {
    return Realisation(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      url: url ?? this.url,
      urlGitHub: urlGitHub ?? this.urlGitHub,
    );
  }

  factory Realisation.fromFireStore(Map<String, dynamic> json) => Realisation(
        imageUrl: json[entryImageUrl] as String,
        name: json[entryName] is String
            ? TradMapModel.fromJsonString(json[entryName] as String)
            : TradMapModel.fromJson(json[entryName] as Map<String, dynamic>),
        url: json[entryUrl] as String?,
        urlGitHub: json[entryUrlGitHub] as String?,
      );

  Map<String, dynamic> toJson() => {
        entryImageUrl: imageUrl,
        entryName: name.toJson(),
        entryUrl: url,
        entryUrlGitHub: urlGitHub,
      };
}
