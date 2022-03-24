import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:equatable/equatable.dart';

class Competence extends Equatable {
  static const entryLabel = 'label';
  static const entryUrl = 'url';

  final TradMapModel label;
  final String? url;

  const Competence({
    required this.label,
    this.url,
  });

  @override
  String toString() => 'Competence(label: $label, url: $url)';

  Competence copyWith({
    TradMapModel? label,
    String? url,
  }) {
    return Competence(
      label: label ?? this.label,
      url: url ?? this.url,
    );
  }

  factory Competence.fromFireStore(Map<String, dynamic> json) => Competence(
        label: json[entryLabel] is String
            ? TradMapModel.fromJsonString(json[entryLabel] as String)
            : TradMapModel.fromJson(json[entryLabel] as Map<String, dynamic>),
        url: json[entryUrl] != null ? json[entryUrl] as String : null,
      );

  Map<String, dynamic> toJson() => {
        entryLabel: label.toJson(),
        entryUrl: url,
      };

  @override
  List<Object?> get props => [label, url];
}
