import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

const String description =
    "Je suis développeur web et Android, passionné et dévoué pour mes études et mon avenir. Avec 29 semaines de stage en entreprise, j'ai acquis les compétences et les connaissances nécessaires pour finaliser mes études et intégrer le monde du travail via l'alternance ou l'apprentissage.";

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

List<Realisation> listRealisations = [
  Realisation(
    assetImage: 'images/project/Google_logo.webp',
    tag: FilterRealisation.ONLINE,
    title: 'CV en ligne V1',
    url: 'https://matthieudevilliers.fr',
  ),
  Realisation(
    assetImage: 'images/project/Google_logo.webp',
    tag: FilterRealisation.ONLINE,
    title: 'CV en ligne V2',
    url: 'https://flutter.matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/CV-online-V2',
  ),
  Realisation(
    assetImage: 'images/project/Minecraft_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Serveur minecraft sur Raspberry',
    urlGitHub: 'https://github.com/Thematt69/minecraft/tree/1.14',
  ),
  Realisation(
    assetImage: 'images/project/ldc.webp',
    tag: FilterRealisation.ONLINE,
    title: "Liste d'idée cadeaux - Projet personel",
    url: 'https://family.matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/Liste-d-idee-cadeaux',
  ),
  Realisation(
    assetImage: 'images/project/games.webp',
    tag: FilterRealisation.ARCHIVE,
    title: "Librairie de jeux - TP Scolaire",
    urlGitHub: 'https://github.com/Thematt69/games-librairies',
  ),
  Realisation(
    assetImage: 'images/project/Google_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: "Listing client FRONT - TP Scolaire",
    urlGitHub: 'https://github.com/Thematt69/clients-front',
  ),
  Realisation(
    assetImage: 'images/project/Google_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: "Listing client API - TP Scolaire",
    urlGitHub: 'https://github.com/Thematt69/clients-api',
  ),
  Realisation(
    assetImage: 'images/project/Octocat.webp',
    tag: FilterRealisation.ONLINE,
    title: "Flutter DropdownSearch - Contribution",
    url: 'https://pub.dev/packages/dropdown_search',
    urlGitHub: 'https://github.com/salim-lachdhaf/searchable_dropdown/pull/189',
  ),
  Realisation(
    assetImage: 'images/project/canhumanitaire.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Canhumanitaire - Association humanitaire',
    urlGitHub:
        'https://github.com/Thematt69/Canhumanitaire/tree/master/Canhumanitaire',
  ),
  Realisation(
    assetImage: 'images/project/Göteborg.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Site récapitulatif du séjour de mon frère à Göteborg',
  ),
  Realisation(
    assetImage: 'images/project/jdr.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'World: Become Human - Jeu de rôle',
  ),
  Realisation(
    assetImage: 'images/project/lsrpfr.webp',
    tag: FilterRealisation.ARCHIVE,
    title: 'Los Santos RolePlay FR - Projet GTA V',
    urlGitHub: 'https://github.com/Thematt69/LSRP/tree/master/LSRP',
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
    urlGitHub: 'https://github.com/Thematt69/PureSpa-Corbas',
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
      end: DateTime(2016, 07),
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
        "Réglage d'usine ou reconfiguration de masse de terminal mobile.",
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
        "Intégration d'un nouvel écran de bord pour des camions prototypes.",
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
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2021, 09, 08),
      end: DateTime.now(),
    ),
    poste: 'Dévellopeur Cross-Platform',
    type: TypeJobs.cdi,
    lieu: 'Sully Group',
    service: 'CDS MAPP',
    description:
        "Développement d'applications mobile ou web pour les cients.", // TODO - A complété
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
    nom: "Titre Concepteur Dévellopeur d'Application",
    ecole: 'XEFI ACADEMY - EPSI Lyon',
    description: '', // TODO - A complété
  ),
];

const String recommandation =
    "Appliqué, sérieux, a le sens de l'écoute et ponctuel.\n"
    "Respecte les consignes, s'intègre bien dans une équipe.\n"
    "Sait répondre techniquement et faire des propositions.\n"
    "En synthèse Matthieu a les capacités d'atteindre le niveau ingénieur.";

const String auteurRecommandation = 'Palmieri Serge';
const String posteRecommandation = 'Electronic pre-study leader';
const String entrepriseRecommandation = 'Renault Trucks St-Priest';

 List<Contact> listContacts = [
  Contact(
    icon: const Icon(
      Icons.place,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Localisation",
    name: "Corbas, 69960 France",
    url: urlMaps,
  ),
  Contact(
    icon: const Icon(
      Icons.email,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Mail",
    name: "devilliers.matthieu@gmail.com",
    url: urlMail,
  ),
  // Contact(
  //   icon: const Icon(
  //     Icons.phone,
  //     color: greyDarkColor,
  //     size: 16,
  //   ),
  //   label: "Téléphone",
  //   name: '06 45 56 48 45',
  //   url: urlTel,
  // ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.linkedinIn,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Linkedin",
    name: 'Matthieu Devilliers',
    url: urlLinkedin,
  ),
  // Contact(
  //   icon: const FaIcon(
  //     FontAwesomeIcons.instagram,
  //     color: greyDarkColor,
  //     size: 16,
  //   ),
  //   label: "Instagram",
  //   name: "thematt69",
  //   url: urlInstagram,
  // ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.twitter,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Twitter",
    name: "@DevilliersMatt",
    url: urlTwitter,
  ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.twitch,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Twitch",
    name: "TheMatt69",
    url: urlTwitch,
  ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.youtube,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Youtube",
    name: 'Matthieu Devilliers',
    url: urlYoutube,
  ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.discord,
      color: greyDarkColor,
      size: 16,
    ),
    label: "Discord",
    name: "Thematt69#9999",
    url: urlDiscord,
  ),
  Contact(
    icon: const FaIcon(
      FontAwesomeIcons.github,
      color: greyDarkColor,
      size: 16,
    ),
    label: "GitHub",
    name: "Matthieu Devilliers",
    url: urlGithub,
  ),
];
