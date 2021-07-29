import 'package:flutter/material.dart';

final GlobalKey keyHeader = GlobalKey();
final GlobalKey keyPresentation = GlobalKey();
final GlobalKey keyCompetence = GlobalKey();
final GlobalKey keyRealisation = GlobalKey();
final GlobalKey keyJobs = GlobalKey();
final GlobalKey keyEtudes = GlobalKey();
final GlobalKey keyContact = GlobalKey();

double get positionHeader => 0;
double get positionPresentation =>
    (keyHeader.currentContext?.size?.height ?? 0);
double get positionCompetence =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0);
double get positionRealisation =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0);
double get positionJobs =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0) +
    (keyRealisation.currentContext?.size?.height ?? 0);
double get positionEtudes =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0) +
    (keyRealisation.currentContext?.size?.height ?? 0) +
    (keyJobs.currentContext?.size?.height ?? 0);
double get positionContact =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0) +
    (keyRealisation.currentContext?.size?.height ?? 0) +
    (keyJobs.currentContext?.size?.height ?? 0) +
    (keyEtudes.currentContext?.size?.height ?? 0);

/// Retourne la position X de la [section]
double positionToSection(Section section) {
  switch (section) {
    case Section.header:
      return positionHeader;
    case Section.presentation:
      return positionPresentation;
    case Section.competence:
      return positionCompetence;
    case Section.realisation:
      return positionRealisation;
    case Section.jobs:
      return positionJobs;
    case Section.etudes:
      return positionEtudes;
    case Section.contact:
      return positionContact;
    default:
      return positionHeader;
  }
}

enum Section {
  header,
  presentation,
  competence,
  realisation,
  jobs,
  etudes,
  contact
}
