import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
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

List<Jobs> listJobs = [
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2015, 01, 26),
      end: DateTime(2015, 01, 30),
    ),
    poste: 'Accueil clientèle',
    type: TypeJobs.stage,
    lieu: 'Gare SNCF Lyon Part-Dieu',
    service: 'Service accueil',
    description: '', // TODO - A complété
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 05, 23),
      end: DateTime(2016, 07, 01),
    ),
    poste: 'Technicien',
    type: TypeJobs.stage,
    lieu: 'Mobile Hut',
    description:
        'Accueil clientèle et vente des produits (téléphone, accessoires, réparation).',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 06, 06),
      end: DateTime(2017, 06, 30),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeJobs.stage,
    lieu: 'Le Polaris',
    service: 'Complexe culturel',
    description:
        'Préparation sonore et éclairage pour différents spectacles, assistance au régisseur.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 11, 21),
      end: DateTime(2016, 12, 16),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeJobs.stage,
    lieu: 'Transit Melody',
    description: 'Prestataire technique en sonorisation, vidéo et éclairage.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 10, 02),
      end: DateTime(2017, 10, 20),
    ),
    poste: 'Technicien audiovisuel',
    type: TypeJobs.stage,
    lieu: 'Transit Melody',
    description: 'Prestataire technique en sonorisation, vidéo et éclairage.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 01, 29),
      end: DateTime(2018, 03, 16),
    ),
    poste: 'Technicien maintenance',
    type: TypeJobs.stage,
    lieu: 'Hub One',
    service: 'Service paramétrage',
    description:
        'Réglage d\'usine ou reconfiguration de masse de terminal mobile.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 06, 25),
      end: DateTime(2018, 08, 24),
    ),
    poste: 'Agent logistique',
    type: TypeJobs.interimaire,
    lieu: 'Hub One',
    service: 'Service logistique',
    description:
        'Réception, gestion logistique et remplacement des terminaux défectueux.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2019, 05, 27),
      end: DateTime(2019, 07, 05),
    ),
    poste: 'Développeur R&D',
    type: TypeJobs.stage,
    lieu: 'Renault Trucks St-Priest',
    service: 'Service Special Vehicle Development',
    description:
        'Intégration d\'un nouvel écran de bord pour des camions prototypes.',
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    poste: 'Dévellopeur',
    type: TypeJobs.alternance,
    lieu: 'Groupe XEFI',
    service: 'XEFI Software',
    description: '', // TODO - A complété
  ),
];

List<Etudes> listEtudes = [
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2015, 09),
      end: DateTime(2018, 06),
    ),
    nom: 'Bac Pro Système Electronique et Numérique',
    ecole: 'Lycée professionel Marc Seguin, Vénissieux.',
    description: '', // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2018, 09),
      end: DateTime(2020, 06),
    ),
    nom: 'BTS Système Numérique',
    ecole: 'Lycée Marcel Sembat, Vénissieux.',
    description: '', // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    nom: "Licence Concepteur Dévellopeur d'Application",
    ecole: 'XEFI ACADEMY',
    description: '', // TODO - A complété
  ),
];
