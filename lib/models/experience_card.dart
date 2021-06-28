import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum TypeExperience { DIPLOME, ALTERNANCE, STAGE, INTERIMAIRE }

class Experience {
  DateTimeRange periode;
  String poste;
  TypeExperience type;
  String lieu;
  String? service;
  String? description;

  Experience({
    required this.periode,
    required this.poste,
    required this.type,
    required this.lieu,
    this.service,
    this.description,
  });

  Experience copyWith({
    DateTimeRange? periode,
    String? poste,
    TypeExperience? type,
    String? lieu,
    String? service,
    String? description,
  }) {
    return Experience(
      periode: periode ?? this.periode,
      poste: poste ?? this.poste,
      type: type ?? this.type,
      lieu: lieu ?? this.lieu,
      service: service ?? this.service,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Experience(periode: $periode, poste: $poste, type: $type, lieu: $lieu, service: $service, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Experience &&
        other.periode == periode &&
        other.poste == poste &&
        other.type == type &&
        other.lieu == lieu &&
        other.service == service &&
        other.description == description;
  }

  @override
  int get hashCode {
    return periode.hashCode ^
        poste.hashCode ^
        type.hashCode ^
        lieu.hashCode ^
        service.hashCode ^
        description.hashCode;
  }
}
