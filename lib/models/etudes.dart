import 'package:flutter/material.dart';

class Etudes {
  Etudes({
    required this.periode,
    required this.nom,
    required this.description,
    required this.ecole,
  });

  String description;
  String ecole;
  String nom;
  DateTimeRange periode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Etudes &&
        other.periode == periode &&
        other.nom == nom &&
        other.description == description &&
        other.ecole == ecole;
  }

  @override
  int get hashCode {
    return periode.hashCode ^
        nom.hashCode ^
        description.hashCode ^
        ecole.hashCode;
  }

  @override
  String toString() {
    return 'Etudes(periode: $periode, nom: $nom, description: $description, ecole: $ecole)';
  }

  Etudes copyWith({
    DateTimeRange? periode,
    String? nom,
    String? description,
    String? ecole,
  }) {
    return Etudes(
      periode: periode ?? this.periode,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      ecole: ecole ?? this.ecole,
    );
  }
}
