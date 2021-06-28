// ignore: constant_identifier_names
enum FilterRealisation { ALL, ONLINE, ARCHIVE }

class Realisation {
  String assetImage;
  String title;
  String? url;
  FilterRealisation tag;

  Realisation({
    required this.assetImage,
    required this.title,
    this.url,
    required this.tag,
  });

  Realisation copyWith({
    String? assetImage,
    String? title,
    String? url,
    FilterRealisation? tag,
  }) {
    return Realisation(
      assetImage: assetImage ?? this.assetImage,
      title: title ?? this.title,
      url: url ?? this.url,
      tag: tag ?? this.tag,
    );
  }

  @override
  String toString() {
    return 'Realisation(assetImage: $assetImage, title: $title, url: $url, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Realisation &&
        other.assetImage == assetImage &&
        other.title == title &&
        other.url == url &&
        other.tag == tag;
  }

  @override
  int get hashCode {
    return assetImage.hashCode ^ title.hashCode ^ url.hashCode ^ tag.hashCode;
  }
}
