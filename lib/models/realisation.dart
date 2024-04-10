import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:equatable/equatable.dart';

class Realisation extends Equatable {
  const Realisation({
    required this.imageUrl,
    required this.name,
    this.url,
    this.urlGitHub,
    this.urlGoogleAppStore,
  });

  factory Realisation.fromFireStore(Map<String, dynamic> json) => Realisation(
        imageUrl: json[entryImageUrl] as String,
        name: json[entryName] is String
            ? TradMapModel.fromJsonString(json[entryName] as String)
            : TradMapModel.fromJson(json[entryName] as Map<String, dynamic>),
        url: json[entryUrl] as String?,
        urlGitHub: json[entryUrlGitHub] as String?,
        urlGoogleAppStore: json[entryUrlGoogleAppStore] as String?,
      );
  static const collectionName = 'realisations';
  static const entryImageUrl = 'imageUrl';
  static const entryName = 'name';
  static const entryUrl = 'url';
  static const entryUrlGitHub = 'urlGitHub';
  static const entryUrlGoogleAppStore = 'urlGoogleAppStore';

  final String imageUrl;
  final TradMapModel name;
  final String? url;
  final String? urlGitHub;
  final String? urlGoogleAppStore;

  bool get online => url != null;

  @override
  String toString() {
    return 'Realisation(imageUrl: $imageUrl, name: $name, url: $url, urlGitHub: $urlGitHub, urlGoogleAppStore: $urlGoogleAppStore)';
  }

  Realisation copyWith({
    String? imageUrl,
    TradMapModel? name,
    String? url,
    String? urlGitHub,
    String? urlGoogleAppStore,
  }) {
    return Realisation(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      url: url ?? this.url,
      urlGitHub: urlGitHub ?? this.urlGitHub,
      urlGoogleAppStore: urlGoogleAppStore ?? this.urlGoogleAppStore,
    );
  }

  Map<String, dynamic> toJson() => {
        entryImageUrl: imageUrl,
        entryName: name.toJson(),
        entryUrl: url,
        entryUrlGitHub: urlGitHub,
        entryUrlGoogleAppStore: urlGoogleAppStore,
      };

  @override
  List<Object?> get props =>
      [imageUrl, name, url, urlGitHub, urlGoogleAppStore];
}
