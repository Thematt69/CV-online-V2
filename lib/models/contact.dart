import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Contact extends Equatable {
  static const collectionName = 'contacts';
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

  const Contact({
    required this.icon,
    required this.label,
    required this.value,
    required this.url,
  });

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
          (json[entryIcon] as Map<String, dynamic>)[entryIconCodePoint] as int,
          fontFamily: (json[entryIcon]
              as Map<String, dynamic>)[entryIconFontFamily] as String,
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

  @override
  List<Object> get props => [icon, label, value, url];
}
