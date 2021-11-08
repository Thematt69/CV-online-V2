import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

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
    assetImage: 'assets/images/project/Google_logo.webp',
    tag: FilterRealisation.ONLINE,
    title: translations.text('contents.realisations.cv_online_v1'),
    url: 'https://matthieudevilliers.fr',
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    tag: FilterRealisation.ONLINE,
    title: translations.text('contents.realisations.cv_online_v2'),
    url: 'https://flutter.matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/CV-online-V2',
  ),
  Realisation(
    assetImage: 'assets/images/project/Minecraft_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.server_minecraft'),
    urlGitHub: 'https://github.com/Thematt69/minecraft/tree/1.14',
  ),
  Realisation(
    assetImage: 'assets/images/project/ldc.webp',
    tag: FilterRealisation.ONLINE,
    title: translations.text('contents.realisations.gift_idea_list'),
    url: 'https://family.matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/Liste-d-idee-cadeaux',
  ),
  Realisation(
    assetImage: 'assets/images/project/games.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.game_library'),
    urlGitHub: 'https://github.com/Thematt69/games-librairies',
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.front_customer_list'),
    urlGitHub: 'https://github.com/Thematt69/clients-front',
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.api_customer_list'),
    urlGitHub: 'https://github.com/Thematt69/clients-api',
  ),
  Realisation(
    assetImage: 'assets/images/project/Octocat.webp',
    tag: FilterRealisation.ONLINE,
    title: translations.text('contents.realisations.dropdownSearch_flutter'),
    url: 'https://pub.dev/packages/dropdown_search',
    urlGitHub: 'https://github.com/salim-lachdhaf/searchable_dropdown/pull/189',
  ),
  Realisation(
    assetImage: 'assets/images/project/canhumanitaire.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.canhumanitaire'),
    urlGitHub:
        'https://github.com/Thematt69/Canhumanitaire/tree/master/Canhumanitaire',
  ),
  Realisation(
    assetImage: 'assets/images/project/Göteborg.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.frero_goteborg'),
  ),
  Realisation(
    assetImage: 'assets/images/project/jdr.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.world_become_human'),
  ),
  Realisation(
    assetImage: 'assets/images/project/lsrpfr.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.los_santos_rp'),
    urlGitHub: 'https://github.com/Thematt69/LSRP/tree/master/LSRP',
  ),
  Realisation(
    assetImage: 'assets/images/project/sn.webp',
    tag: FilterRealisation.ARCHIVE,
    title: translations.text('contents.realisations.class_council'),
  ),
  Realisation(
    assetImage: 'assets/images/project/Spa.webp',
    tag: FilterRealisation.ONLINE,
    title: translations.text('contents.realisations.purespa_corbas'),
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
    poste: translations.text('contents.jobs.sncf.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.sncf.lieu'),
    service: translations.text('contents.jobs.sncf.service'),
    description: '', // TODO - A complété
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 05, 23),
      end: DateTime(2016, 07),
    ),
    poste: translations.text('contents.jobs.mobile_hub.poste'),
    type: TypeJobs.stage,
    lieu: 'Mobile Hut',
    description: translations.text('contents.jobs.mobile_hub.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 06, 06),
      end: DateTime(2017, 06, 30),
    ),
    poste: translations.text('contents.jobs.polaris.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.polaris.lieu'),
    service: translations.text('contents.jobs.polaris.service'),
    description: translations.text('contents.jobs.polaris.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 11, 21),
      end: DateTime(2016, 12, 16),
    ),
    poste: translations.text('contents.jobs.transit_melody.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.transit_melody.lieu'),
    description: translations.text('contents.jobs.transit_melody.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 10, 02),
      end: DateTime(2017, 10, 20),
    ),
    poste: translations.text('contents.jobs.transit_melody.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.transit_melody.lieu'),
    description: translations.text('contents.jobs.transit_melody.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 01, 29),
      end: DateTime(2018, 03, 16),
    ),
    poste: translations.text('contents.jobs.hub_one.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.hub_one.lieu'),
    service: translations.text('contents.jobs.hub_one.service'),
    description: translations.text('contents.jobs.hub_one.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 06, 25),
      end: DateTime(2018, 08, 24),
    ),
    poste: translations.text('contents.jobs.hub_one_1.poste'),
    type: TypeJobs.interimaire,
    lieu: translations.text('contents.jobs.hub_one_1.lieu'),
    service: translations.text('contents.jobs.hub_one_1.service'),
    description: translations.text('contents.jobs.hub_one_1.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2019, 05, 27),
      end: DateTime(2019, 07, 05),
    ),
    poste: translations.text('contents.jobs.renault_trucks.poste'),
    type: TypeJobs.stage,
    lieu: translations.text('contents.jobs.renault_trucks.lieu'),
    service: translations.text('contents.jobs.renault_trucks.service'),
    description: translations.text('contents.jobs.renault_trucks.description'),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    poste: translations.text('contents.jobs.xefi.poste'),
    type: TypeJobs.alternance,
    lieu: translations.text('contents.jobs.xefi.lieu'),
    service: translations.text('contents.jobs.xefi.service'),
    description: '', // TODO - A complété
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2021, 09, 08),
      end: DateTime.now(),
    ),
    poste: translations.text('contents.jobs.sully_group.poste'),
    type: TypeJobs.cdi,
    lieu: translations.text('contents.jobs.sully_group.lieu'),
    service: translations.text('contents.jobs.sully_group.service'),
    description: translations
        .text('contents.jobs.sully_group.description'), // TODO - A complété
  ),
];

List<Etudes> listEtudes = [
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2015, 09),
      end: DateTime(2018, 06),
    ),
    nom: translations.text('contents.etudes.bac_pro.nom'),
    ecole: translations.text('contents.etudes.bac_pro.ecole'),
    description: '', // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2018, 09),
      end: DateTime(2020, 06),
    ),
    nom: translations.text('contents.etudes.bts.nom'),
    ecole: translations.text('contents.etudes.bts.ecole'),
    description: '', // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    nom: translations.text('contents.etudes.epsi.nom'),
    ecole: translations.text('contents.etudes.epsi.ecole'),
    description: '', // TODO - A complété
  ),
];

const String auteurRecommandation = 'PALMIERI Serge';
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
