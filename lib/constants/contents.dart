import 'package:cv_online_v2/models/experience_card.dart';
import 'package:cv_online_v2/models/realisation_card.dart';
import 'package:flutter/material.dart';

List<String> listCompetences = [
  'HTML 5',
  'CSS 3',
  'PHP 7',
  'OBS Studio',
  'Streamlabs OBS',
  'Suite Office',
  'Google Docs',
  'Flutter',
  'Dart',
  'Adobe Photoshop',
  'Sony Vegas Pro 17',
  'Android Studio (Java)',
  'Linux',
  'SQL',
  'PHPMyAdmin',
  'Docker',
  'Git',
  'Jira',
  'Figma',
];

List<Realisation> listRealisation = [
  Realisation(
    assetImage: 'images/project/canhumanitaire.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Canhumanitaire - Association humanitaire',
  ),
  Realisation(
    assetImage: 'images/project/Google_logo.webp',
    tag: FilterRealisation.ONLINE,
    title: 'CV en ligne',
    url: 'https://matthieudevilliers.fr',
  ),
  Realisation(
    assetImage: 'images/project/Göteborg.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Site récapitulatif du séjour de mon frère à Göteborg',
  ),
  Realisation(
    assetImage: 'images/project/jdr.webp',
    tag: FilterRealisation.ONLINE,
    title: 'World: Become Human - Jeu de rôle',
    url: 'https://sites.google.com/view/jdrdufutur',
  ),
  Realisation(
    assetImage: 'images/project/lsrpfr.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Los Santos RolePlay FR - Projet GTA V',
  ),
  Realisation(
    assetImage: 'images/project/sn.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Conseil de classe - BTS SN',
  ),
  Realisation(
    assetImage: 'images/project/Spa.webp',
    tag: FilterRealisation.ONLINE,
    title: 'PureSpa Corbas - Projet personel',
    url: 'https://spa.matthieudevilliers.fr',
  ),
];

List<Experience> listExperience = [
  Experience(
    periode: DateTimeRange(
      start: DateTime(2015, 01, 26),
      end: DateTime(2015, 01, 30),
    ),
    poste: 'Accueil clientèle',
    type: TypeExperience.STAGE,
    lieu: 'Gare SNCF Lyon Part-Dieu',
    service: 'Service accueil',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2016, 05, 23),
      end: DateTime(2016, 07, 01),
    ),
    poste: 'Technicien',
    type: TypeExperience.STAGE,
    lieu: 'Mobile Hut',
    description:
        'Accueil clientèle et vente des produits (téléphone, accessoires, réparation).',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2017, 06, 06),
      end: DateTime(2017, 06, 30),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeExperience.STAGE,
    lieu: 'Le Polaris',
    service: 'Complexe culturel',
    description:
        'Préparation sonore et éclairage pour différents spectacles, assistance au régisseur.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2016, 11, 21),
      end: DateTime(2016, 12, 16),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeExperience.STAGE,
    lieu: 'Transit Melody',
    description: 'Prestataire technique en sonorisation, vidéo et éclairage.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2017, 10, 02),
      end: DateTime(2017, 10, 20),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeExperience.STAGE,
    lieu: 'Transit Melody',
    description: 'Prestataire technique en sonorisation, vidéo et éclairage.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2018, 01, 29),
      end: DateTime(2018, 03, 16),
    ),
    poste: 'Technicien maintenance',
    type: TypeExperience.STAGE,
    lieu: 'Hub One',
    service: 'Service paramétrage',
    description:
        'Réglage d\'usine ou reconfiguration de masse de terminal mobile.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2015, 09),
      end: DateTime(2018, 06),
    ),
    poste: 'Bac Pro Système Electronique et Numérique',
    type: TypeExperience.DIPLOME,
    lieu: 'Mention Bien',
    description: 'Lycée professionel Marc Seguin, Vénissieux.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2018, 06, 25),
      end: DateTime(2018, 08, 24),
    ),
    poste: 'Agent logistique',
    type: TypeExperience.INTERIMAIRE,
    lieu: 'Hub One',
    service: 'Service logistique',
    description:
        'Réception, gestion logistique et remplacement des terminaux défectueux.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2019, 05, 27),
      end: DateTime(2019, 07, 05),
    ),
    poste: 'Développeur R&D',
    type: TypeExperience.STAGE,
    lieu: 'Renault Trucks St-Priest',
    service: 'Service Special Vehicle Development',
    description:
        'Intégration d\'un nouvel écran de bord pour des camions prototypes.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2018, 09),
      end: DateTime(2020, 06),
    ),
    poste: 'BTS Système Numérique',
    type: TypeExperience.DIPLOME,
    lieu: 'Option Informatique et Réseaux',
    description: 'Lycée Marcel Sembat, Vénissieux.',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    poste: 'Dévellopeur',
    type: TypeExperience.ALTERNANCE,
    lieu: 'Groupe XEFI',
    service: 'XEFI Software',
  ),
  Experience(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    poste: 'Licence Concepteur Dévellopeur d\'Application',
    type: TypeExperience.DIPLOME,
    lieu: 'XEFI ACADEMY',
    service: 'En partenariat avec EPSI',
  ),
];
