import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'trap_map_model.dart';

class Etude extends Equatable {
  static const collectionName = 'etudes';
  static const entryDescription = 'description';
  static const entryEcole = 'ecole';
  static const entryDiplome = 'diplome';
  static const entryPeriode = 'periode';
  static const entryPeriodeStart = 'start';
  static const entryPeriodeEnd = 'end';

  final TradMapModel description;
  final TradMapModel ecole;
  final TradMapModel diplome;
  final DateTimeRange periode;

  const Etude({
    required this.periode,
    required this.diplome,
    required this.description,
    required this.ecole,
  });

  @override
  String toString() {
    return 'Etudes(periode: $periode, nom: $diplome, description: $description, ecole: $ecole)';
  }

  Etude copyWith({
    DateTimeRange? periode,
    TradMapModel? diplome,
    TradMapModel? description,
    TradMapModel? ecole,
  }) {
    return Etude(
      periode: periode ?? this.periode,
      diplome: diplome ?? this.diplome,
      description: description ?? this.description,
      ecole: ecole ?? this.ecole,
    );
  }

  factory Etude.fromFireStore(Map<String, dynamic> json) => Etude(
        diplome: json[entryDiplome] is String
            ? TradMapModel.fromJsonString(json[entryDiplome] as String)
            : TradMapModel.fromJson(json[entryDiplome] as Map<String, dynamic>),
        description: json[entryDescription] is String
            ? TradMapModel.fromJsonString(json[entryDescription] as String)
            : TradMapModel.fromJson(
                json[entryDescription] as Map<String, dynamic>,
              ),
        ecole: json[entryEcole] is String
            ? TradMapModel.fromJsonString(json[entryEcole] as String)
            : TradMapModel.fromJson(json[entryEcole] as Map<String, dynamic>),
        periode: DateTimeRange(
          start: ((json[entryPeriode]
                  as Map<String, dynamic>)[entryPeriodeStart] as Timestamp)
              .toDate(),
          end: ((json[entryPeriode] as Map<String, dynamic>)[entryPeriodeEnd]
                  as Timestamp)
              .toDate(),
        ),
      );

  Map<String, dynamic> toJson() => {
        entryDiplome: diplome.toJson(),
        entryDescription: description.toJson(),
        entryEcole: ecole.toJson(),
        entryPeriode: {
          entryPeriodeStart: Timestamp.fromDate(periode.start),
          entryPeriodeEnd: Timestamp.fromDate(periode.end),
        }
      };

  @override
  List<Object> get props => [description, ecole, diplome, periode];
}
