import 'package:flutter/material.dart';

final GlobalKey keyHeader = GlobalKey();
final GlobalKey keyPresentation = GlobalKey();
final GlobalKey keyCompetence = GlobalKey();
final GlobalKey keyRealisation = GlobalKey();
final GlobalKey keyExperience = GlobalKey();
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
double get positionExperiance =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0) +
    (keyRealisation.currentContext?.size?.height ?? 0);
double get positionContact =>
    (keyHeader.currentContext?.size?.height ?? 0) +
    (keyPresentation.currentContext?.size?.height ?? 0) +
    (keyCompetence.currentContext?.size?.height ?? 0) +
    (keyRealisation.currentContext?.size?.height ?? 0) +
    (keyExperience.currentContext?.size?.height ?? 0);

/// Retourne la position X de la [section]
double positionToSection(Section section) {
  switch (section) {
    case Section.HEADER:
      return positionHeader;
    case Section.PRESENTATION:
      return positionPresentation;
    case Section.COMPETENTCE:
      return positionCompetence;
    case Section.REALISATION:
      return positionRealisation;
    case Section.EXPERIENCE:
      return positionExperiance;
    case Section.CONTACT:
      return positionContact;
    default:
      return positionHeader;
  }
}

enum Section {
  // ignore: constant_identifier_names
  HEADER,
  // ignore: constant_identifier_names
  PRESENTATION,
  // ignore: constant_identifier_names
  COMPETENTCE,
  // ignore: constant_identifier_names
  REALISATION,
  // ignore: constant_identifier_names
  EXPERIENCE,
  // ignore: constant_identifier_names
  CONTACT
}
