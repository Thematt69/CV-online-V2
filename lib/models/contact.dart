import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:flutter/material.dart';

class Contact {
  static const entryIcon = 'icon';
  static const entryIconCodePoint = 'codePoint';
  static const entryIconFontFamily = 'fontFamily';
  static const entryLabel = 'label';
  static const entryValue = 'value';
  static const entryUrl = 'url';

  final IconData icon;
  final TradMapModel label;
  final String value;
  final String url;

  Contact({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.icon == icon &&
        other.label == label &&
        other.value == value &&
        other.url == url;
  }

  @override
  int get hashCode {
    return icon.hashCode ^ label.hashCode ^ value.hashCode ^ url.hashCode;
  }

  @override
  String toString() {
    return 'Contact(icon: $icon, label: $label, value: $value, url: $url)';
  }

  Contact copyWith({
    IconData? icon,
    TradMapModel? label,
    String? value,
    String? url,
  }) {
    return Contact(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      value: value ?? this.value,
      url: url ?? this.url,
    );
  }

  factory Contact.fromFireStore(Map<String, dynamic> json) => Contact(
        icon: IconData(
          json[entryIcon][entryIconCodePoint] as int,
          fontFamily: json[entryIcon][entryIconFontFamily] as String,
          fontPackage: 'font_awesome_flutter',
        ),
        label: json[entryLabel] is String
            ? TradMapModel.fromJsonString(json[entryLabel] as String)
            : TradMapModel.fromJson(json[entryLabel] as Map<String, dynamic>),
        value: json[entryValue] as String,
        url: json[entryUrl] as String,
      );

  Map<String, dynamic> toJson() => {
        entryIcon: {
          entryIconCodePoint: icon.codePoint,
          entryIconFontFamily: icon.fontFamily,
        },
        entryLabel: label.toJson(),
        entryValue: value,
        entryUrl: url,
      };
}
