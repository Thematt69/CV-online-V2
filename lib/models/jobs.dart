import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Job {
  static const entryDescription = 'description';
  static const entryLieu = 'lieu';
  static const entryPeriode = 'periode';
  static const entryPeriodeStart = 'start';
  static const entryPeriodeEnd = 'end';
  static const entryPoste = 'poste';
  static const entryService = 'service';
  static const entryType = 'type';

  final TradMapModel? description;
  final TradMapModel lieu;
  final DateTimeRange periode;
  final TradMapModel poste;
  final TradMapModel? service;
  final TradMapModel type;

  Job({
    required this.periode,
    required this.poste,
    required this.lieu,
    required this.description,
    required this.type,
    this.service,
  });

  String get periodeString {
    final DateFormat dateFormat = DateFormat.yMMMd('fr');
    String value = '${dateFormat.format(periode.start)} - ';
    if (periode.end.day == DateTime.now().day &&
        periode.end.month == DateTime.now().month &&
        periode.end.year == DateTime.now().year) {
      value += translations.text('contents.today');
    } else {
      value += dateFormat.format(periode.end);
    }
    return value;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Job &&
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

  @override
  String toString() {
    return 'Jobs(periode: $periode, poste: $poste, lieu: $lieu, description: $description, type: $type, service: $service)';
  }

  Job copyWith({
    TradMapModel? description,
    TradMapModel? lieu,
    DateTimeRange? periode,
    TradMapModel? poste,
    TradMapModel? service,
    TradMapModel? type,
  }) {
    return Job(
      description: description ?? this.description,
      lieu: lieu ?? this.lieu,
      periode: periode ?? this.periode,
      poste: poste ?? this.poste,
      service: service ?? this.service,
      type: type ?? this.type,
    );
  }

  factory Job.fromFireStore(Map<String, dynamic> json) => Job(
        description: json[entryDescription] != null
            ? json[entryDescription] is String
                ? TradMapModel.fromJsonString(json[entryDescription] as String)
                : TradMapModel.fromJson(
                    json[entryDescription] as Map<String, dynamic>,
                  )
            : null,
        lieu: json[entryLieu] is String
            ? TradMapModel.fromJsonString(json[entryLieu] as String)
            : TradMapModel.fromJson(json[entryLieu] as Map<String, dynamic>),
        periode: DateTimeRange(
          start: (json[entryPeriode][entryPeriodeStart] as Timestamp).toDate(),
          end: json[entryPeriode][entryPeriodeEnd] != null
              ? (json[entryPeriode][entryPeriodeEnd] as Timestamp).toDate()
              : DateTime.now(),
        ),
        poste: json[entryPoste] is String
            ? TradMapModel.fromJsonString(json[entryPoste] as String)
            : TradMapModel.fromJson(json[entryPoste] as Map<String, dynamic>),
        service: json[entryService] != null
            ? json[entryService] is String
                ? TradMapModel.fromJsonString(json[entryService] as String)
                : TradMapModel.fromJson(
                    json[entryService] as Map<String, dynamic>,
                  )
            : null,
        type: json[entryType] is String
            ? TradMapModel.fromJsonString(json[entryType] as String)
            : TradMapModel.fromJson(json[entryType] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        entryDescription: description?.toJson(),
        entryLieu: lieu.toJson(),
        entryPeriode: {
          entryPeriodeStart: Timestamp.fromDate(periode.start),
          entryPeriodeEnd: Timestamp.fromDate(periode.end),
        },
        entryPoste: poste.toJson(),
        entryService: service?.toJson(),
        entryType: type.toJson(),
      };
}
