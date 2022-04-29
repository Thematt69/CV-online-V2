import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:equatable/equatable.dart';

class Presentation extends Equatable {
  static const collectionName = 'presentations';
  static const entryLabel = 'label';
  static const entryValue = 'value';
  static const entryUrl = 'url';

  final TradMapModel? label;
  final TradMapModel value;
  final String? url;

  const Presentation({
    this.label,
    required this.value,
    this.url,
  });

  @override
  String toString() => 'Presentation(label: $label, value: $value, url: $url)';

  Presentation copyWith({
    TradMapModel? label,
    TradMapModel? value,
    String? url,
  }) {
    return Presentation(
      label: label ?? this.label,
      value: value ?? this.value,
      url: url ?? this.url,
    );
  }

  factory Presentation.fromFireStore(Map<String, dynamic> json) => Presentation(
        label: json[entryLabel] == null
            ? null
            : json[entryLabel] is String
                ? TradMapModel.fromJsonString(json[entryLabel] as String)
                : TradMapModel.fromJson(
                    json[entryLabel] as Map<String, dynamic>,
                  ),
        value: json[entryValue] is String
            ? TradMapModel.fromJsonString(json[entryValue] as String)
            : TradMapModel.fromJson(json[entryValue] as Map<String, dynamic>),
        url: json[entryUrl] != null ? json[entryUrl] as String : null,
      );

  Map<String, dynamic> toJson() => {
        entryLabel: label?.toJson(),
        entryValue: value.toJson(),
        entryUrl: url,
      };

  @override
  List<Object?> get props => [label, value, url];
}
