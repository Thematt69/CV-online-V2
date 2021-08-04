// ignore: constant_identifier_names
enum FilterRealisation { ALL, ONLINE, ARCHIVE }

class Realisation {
  Realisation({
    required this.assetImage,
    required this.tag,
    required this.title,
    this.url,
    this.urlGitHub,
  });

  final String assetImage;
  final FilterRealisation tag;
  final String title;
  final String? url;
  final String? urlGitHub;

  Realisation copyWith({
    String? assetImage,
    FilterRealisation? tag,
    String? title,
    String? url,
    String? urlGitHub,
  }) {
    return Realisation(
      assetImage: assetImage ?? this.assetImage,
      tag: tag ?? this.tag,
      title: title ?? this.title,
      url: url ?? this.url,
      urlGitHub: urlGitHub ?? this.urlGitHub,
    );
  }

  @override
  String toString() {
    return 'Realisation(assetImage: $assetImage, tag: $tag, title: $title, url: $url, urlGitHub: $urlGitHub)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Realisation &&
        other.assetImage == assetImage &&
        other.tag == tag &&
        other.title == title &&
        other.url == url &&
        other.urlGitHub == urlGitHub;
  }

  @override
  int get hashCode {
    return assetImage.hashCode ^
        tag.hashCode ^
        title.hashCode ^
        url.hashCode ^
        urlGitHub.hashCode;
  }
}
