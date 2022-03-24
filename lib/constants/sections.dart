import 'package:flutter/material.dart';

mixin CvSections {
  static final GlobalKey keyHeader = GlobalKey();
  static final GlobalKey keyPresentation = GlobalKey();
  static final GlobalKey keyCompetence = GlobalKey();
  static final GlobalKey keyRealisation = GlobalKey();
  static final GlobalKey keyEtudes = GlobalKey();
  static final GlobalKey keyRecommandation = GlobalKey();
  static final GlobalKey keyJobs = GlobalKey();
  static final GlobalKey keyContact = GlobalKey();

  static double get positionHeader => 0;
  static double get positionPresentation =>
      keyHeader.currentContext?.size?.height ?? 0;
  static double get positionCompetence =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0);
  static double get positionRealisation =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0) +
      (keyCompetence.currentContext?.size?.height ?? 0);
  static double get positionEtudes =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0) +
      (keyCompetence.currentContext?.size?.height ?? 0) +
      (keyRealisation.currentContext?.size?.height ?? 0);
  static double get positionRecommandation =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0) +
      (keyCompetence.currentContext?.size?.height ?? 0) +
      (keyRealisation.currentContext?.size?.height ?? 0) +
      (keyEtudes.currentContext?.size?.height ?? 0);
  static double get positionJobs =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0) +
      (keyCompetence.currentContext?.size?.height ?? 0) +
      (keyRealisation.currentContext?.size?.height ?? 0) +
      (keyEtudes.currentContext?.size?.height ?? 0) +
      (keyRecommandation.currentContext?.size?.height ?? 0);
  static double get positionContact =>
      (keyHeader.currentContext?.size?.height ?? 0) +
      (keyPresentation.currentContext?.size?.height ?? 0) +
      (keyCompetence.currentContext?.size?.height ?? 0) +
      (keyRealisation.currentContext?.size?.height ?? 0) +
      (keyEtudes.currentContext?.size?.height ?? 0) +
      (keyRecommandation.currentContext?.size?.height ?? 0) +
      (keyJobs.currentContext?.size?.height ?? 0);

  /// Retourne la position X de la [section]
  static double positionToSection(Section section) {
    switch (section) {
      case Section.header:
        return positionHeader;
      case Section.presentation:
        return positionPresentation;
      case Section.competence:
        return positionCompetence;
      case Section.realisation:
        return positionRealisation;
      case Section.etudes:
        return positionEtudes;
      case Section.recommandation:
        return positionRecommandation;
      case Section.jobs:
        return positionJobs;
      case Section.contact:
        return positionContact;
      default:
        return positionHeader;
    }
  }
}

enum Section {
  header,
  presentation,
  competence,
  realisation,
  etudes,
  recommandation,
  jobs,
  contact
}
