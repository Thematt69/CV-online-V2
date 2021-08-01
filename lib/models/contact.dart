import 'package:flutter/material.dart';

class Contact {
  Widget icon;
  String label;
  String name;
  String url;

  Contact({
    required this.icon,
    required this.label,
    required this.name,
    required this.url,
  });

  Contact copyWith({
    Widget? icon,
    String? label,
    String? name,
    String? url,
  }) {
    return Contact(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  String toString() {
    return 'Contact(icon: $icon, label: $label, name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.icon == icon &&
        other.label == label &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return icon.hashCode ^ label.hashCode ^ name.hashCode ^ url.hashCode;
  }
}
