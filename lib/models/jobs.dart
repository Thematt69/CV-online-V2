import 'package:flutter/material.dart';

enum TypeJobs { alternance, stage, interimaire, cdi }

class Jobs {
  DateTimeRange periode;
  String poste;
  String lieu;
  String description;
  TypeJobs type;
  String? service;

  Jobs({
    required this.periode,
    required this.poste,
    required this.lieu,
    required this.description,
    required this.type,
    this.service,
  });

  Jobs copyWith({
    DateTimeRange? periode,
    String? poste,
    String? lieu,
    String? description,
    TypeJobs? type,
    String? service,
  }) {
    return Jobs(
      periode: periode ?? this.periode,
      poste: poste ?? this.poste,
      lieu: lieu ?? this.lieu,
      description: description ?? this.description,
      type: type ?? this.type,
      service: service ?? this.service,
    );
  }

  @override
  String toString() {
    return 'Jobs(periode: $periode, poste: $poste, lieu: $lieu, description: $description, type: $type, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Jobs &&
        other.periode == periode &&
        other.poste == poste &&
        other.lieu == lieu &&
        other.description == description &&
        other.type == type &&
        other.service == service;
  }

  @override
  int get hashCode {
    return periode.hashCode ^
        poste.hashCode ^
        lieu.hashCode ^
        description.hashCode ^
        type.hashCode ^
        service.hashCode;
  }
}
