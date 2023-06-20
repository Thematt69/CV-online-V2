import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extensions/date_time_extension.dart';
import 'trap_map_model.dart';

class Job extends Equatable {
  static const collectionName = 'jobs';
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

  const Job({
    required this.periode,
    required this.poste,
    required this.lieu,
    required this.description,
    required this.type,
    this.service,
  });

  String periodeString(BuildContext context) {
    String value = '${periode.start.yMMMd(context)} - ';
    if (periode.end.day == DateTime.now().day &&
        periode.end.month == DateTime.now().month &&
        periode.end.year == DateTime.now().year) {
      value += AppLocalizations.of(context)!.contents_today;
    } else {
      value += periode.end.yMMMd(context);
    }
    return value;
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
          start: ((json[entryPeriode]
                  as Map<String, dynamic>)[entryPeriodeStart] as Timestamp)
              .toDate(),
          end: (json[entryPeriode] as Map<String, dynamic>)[entryPeriodeEnd] !=
                  null
              ? ((json[entryPeriode] as Map<String, dynamic>)[entryPeriodeEnd]
                      as Timestamp)
                  .toDate()
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

  @override
  List<Object?> get props {
    return [
      description,
      lieu,
      periode,
      poste,
      service,
      type,
    ];
  }
}
