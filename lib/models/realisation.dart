import 'package:cv_online_v2/models/trap_map_model.dart';

class Realisation {
  static const entryAssetImage = 'assetImage';
  static const entryName = 'name';
  static const entryUrl = 'url';
  static const entryUrlGitHub = 'urlGitHub';

  final String assetImage;
  final TradMapModel name;
  final String? url;
  final String? urlGitHub;

  Realisation({
    required this.assetImage,
    required this.name,
    this.url,
    this.urlGitHub,
  });

  bool get online => url != null;

  @override
  String toString() {
    return 'Realisation(assetImage: $assetImage, name: $name, url: $url, urlGitHub: $urlGitHub)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Realisation &&
        other.assetImage == assetImage &&
        other.name == name &&
        other.url == url &&
        other.urlGitHub == urlGitHub;
  }

  @override
  int get hashCode {
    return assetImage.hashCode ^
        name.hashCode ^
        url.hashCode ^
        urlGitHub.hashCode;
  }

  Realisation copyWith({
    String? assetImage,
    TradMapModel? name,
    String? url,
    String? urlGitHub,
  }) {
    return Realisation(
      assetImage: assetImage ?? this.assetImage,
      name: name ?? this.name,
      url: url ?? this.url,
      urlGitHub: urlGitHub ?? this.urlGitHub,
    );
  }

  factory Realisation.fromFireStore(Map<String, dynamic> json) => Realisation(
        assetImage: json[entryAssetImage] as String,
        name: json[entryName] is String
            ? TradMapModel.fromJsonString(json[entryName] as String)
            : TradMapModel.fromJson(json[entryName] as Map<String, dynamic>),
        url: json[entryUrl] as String?,
        urlGitHub: json[entryUrlGitHub] as String?,
      );

  Map<String, dynamic> toJson() => {
        entryAssetImage: assetImage,
        entryName: name.toJson(),
        entryUrl: url,
        entryUrlGitHub: urlGitHub,
      };
}
