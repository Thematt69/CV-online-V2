import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/models/trap_map_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    name: TradMapModel(
      frFR: translations.text('contents.realisations.cv_online_v1'),
    ),
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.cv_online_v2'),
    ),
    url: 'https://matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/CV-online-V2',
  ),
  Realisation(
    assetImage: 'assets/images/project/Minecraft_logo.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.server_minecraft'),
    ),
    urlGitHub: 'https://github.com/Thematt69/minecraft/tree/1.14',
  ),
  Realisation(
    assetImage: 'assets/images/project/ldc.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.gift_idea_list'),
    ),
    url: 'https://family.matthieudevilliers.fr',
    urlGitHub: 'https://github.com/Thematt69/Liste-d-idee-cadeaux',
  ),
  Realisation(
    assetImage: 'assets/images/project/games.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.game_library'),
    ),
    urlGitHub: 'https://github.com/Thematt69/games-librairies',
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.front_customer_list'),
    ),
    urlGitHub: 'https://github.com/Thematt69/clients-front',
  ),
  Realisation(
    assetImage: 'assets/images/project/Google_logo.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.api_customer_list'),
    ),
    urlGitHub: 'https://github.com/Thematt69/clients-api',
  ),
  Realisation(
    assetImage: 'assets/images/project/Octocat.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.dropdownSearch_flutter'),
    ),
    url: 'https://pub.dev/packages/dropdown_search',
    urlGitHub: 'https://github.com/salim-lachdhaf/searchable_dropdown/pull/189',
  ),
  Realisation(
    assetImage: 'assets/images/project/canhumanitaire.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.canhumanitaire'),
    ),
    urlGitHub:
        'https://github.com/Thematt69/Canhumanitaire/tree/master/Canhumanitaire',
  ),
  Realisation(
    assetImage: 'assets/images/project/Göteborg.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.frero_goteborg'),
    ),
  ),
  Realisation(
    assetImage: 'assets/images/project/jdr.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.world_become_human'),
    ),
  ),
  Realisation(
    assetImage: 'assets/images/project/lsrpfr.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.los_santos_rp'),
    ),
    urlGitHub: 'https://github.com/Thematt69/LSRP/tree/master/LSRP',
  ),
  Realisation(
    assetImage: 'assets/images/project/sn.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.class_council'),
    ),
  ),
  Realisation(
    assetImage: 'assets/images/project/Spa.webp',
    name: TradMapModel(
      frFR: translations.text('contents.realisations.purespa_corbas'),
    ),
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
    poste: TradMapModel(frFR: translations.text('contents.jobs.sncf.poste')),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(frFR: translations.text('contents.jobs.sncf.lieu')),
    service:
        TradMapModel(frFR: translations.text('contents.jobs.sncf.service')),
    description: TradMapModel(frFR: ''), // TODO - A complété
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 05, 23),
      end: DateTime(2016, 07),
    ),
    poste:
        TradMapModel(frFR: translations.text('contents.jobs.mobile_hub.poste')),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(frFR: 'Mobile Hut'),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.mobile_hub.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 06, 06),
      end: DateTime(2017, 06, 30),
    ),
    poste: TradMapModel(frFR: translations.text('contents.jobs.polaris.poste')),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(frFR: translations.text('contents.jobs.polaris.lieu')),
    service:
        TradMapModel(frFR: translations.text('contents.jobs.polaris.service')),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.polaris.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2016, 11, 21),
      end: DateTime(2016, 12, 16),
    ),
    poste: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.poste'),
    ),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.lieu'),
    ),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2017, 10, 02),
      end: DateTime(2017, 10, 20),
    ),
    poste: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.poste'),
    ),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.lieu'),
    ),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.transit_melody.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 01, 29),
      end: DateTime(2018, 03, 16),
    ),
    poste: TradMapModel(frFR: translations.text('contents.jobs.hub_one.poste')),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(frFR: translations.text('contents.jobs.hub_one.lieu')),
    service:
        TradMapModel(frFR: translations.text('contents.jobs.hub_one.service')),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.hub_one.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2018, 06, 25),
      end: DateTime(2018, 08, 24),
    ),
    poste:
        TradMapModel(frFR: translations.text('contents.jobs.hub_one_1.poste')),
    type: TradMapModel(frFR: 'interimaire'),
    lieu: TradMapModel(frFR: translations.text('contents.jobs.hub_one_1.lieu')),
    service: TradMapModel(
      frFR: translations.text('contents.jobs.hub_one_1.service'),
    ),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.hub_one_1.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2019, 05, 27),
      end: DateTime(2019, 07, 05),
    ),
    poste: TradMapModel(
      frFR: translations.text('contents.jobs.renault_trucks.poste'),
    ),
    type: TradMapModel(frFR: 'stage'),
    lieu: TradMapModel(
      frFR: translations.text('contents.jobs.renault_trucks.lieu'),
    ),
    service: TradMapModel(
      frFR: translations.text('contents.jobs.renault_trucks.service'),
    ),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.renault_trucks.description'),
    ),
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    poste: TradMapModel(frFR: translations.text('contents.jobs.xefi.poste')),
    type: TradMapModel(frFR: 'alternance'),
    lieu: TradMapModel(frFR: translations.text('contents.jobs.xefi.lieu')),
    service:
        TradMapModel(frFR: translations.text('contents.jobs.xefi.service')),
    description: TradMapModel(frFR: ''), // TODO - A complété
  ),
  Jobs(
    periode: DateTimeRange(
      start: DateTime(2021, 09, 08),
      end: DateTime.now(),
    ),
    poste: TradMapModel(
      frFR: translations.text('contents.jobs.sully_group.poste'),
    ),
    type: TradMapModel(frFR: 'cdi'),
    lieu:
        TradMapModel(frFR: translations.text('contents.jobs.sully_group.lieu')),
    service: TradMapModel(
      frFR: translations.text('contents.jobs.sully_group.service'),
    ),
    description: TradMapModel(
      frFR: translations.text('contents.jobs.sully_group.description'),
    ), // TODO - A complété
  ),
];

List<Etudes> listEtudes = [
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2015, 09),
      end: DateTime(2018, 06),
    ),
    diplome:
        TradMapModel(frFR: translations.text('contents.etudes.bac_pro.nom')),
    ecole:
        TradMapModel(frFR: translations.text('contents.etudes.bac_pro.ecole')),
    description: TradMapModel(frFR: ''), // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2018, 09),
      end: DateTime(2020, 06),
    ),
    diplome: TradMapModel(frFR: translations.text('contents.etudes.bts.nom')),
    ecole: TradMapModel(frFR: translations.text('contents.etudes.bts.ecole')),
    description: TradMapModel(frFR: ''), // TODO - A complété
  ),
  Etudes(
    periode: DateTimeRange(
      start: DateTime(2020, 08, 24),
      end: DateTime(2021, 09, 07),
    ),
    diplome: TradMapModel(frFR: translations.text('contents.etudes.epsi.nom')),
    ecole: TradMapModel(frFR: translations.text('contents.etudes.epsi.ecole')),
    description: TradMapModel(frFR: ''), // TODO - A complété
  ),
];

const String auteurRecommandation = 'PALMIERI Serge';
const String entrepriseRecommandation = 'Renault Trucks St-Priest';

List<Contact> listContacts = [
  Contact(
    icon: FontAwesomeIcons.mapMarkerAlt,
    label: TradMapModel(frFR: "Localisation"),
    value: "Corbas, 69960 France",
    url: urlMaps,
  ),
  Contact(
    icon: FontAwesomeIcons.envelope,
    label: TradMapModel(frFR: "Mail"),
    value: "devilliers.matthieu@gmail.com",
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
    icon: FontAwesomeIcons.linkedinIn,
    label: TradMapModel(frFR: "Linkedin"),
    value: 'Matthieu Devilliers',
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
    icon: FontAwesomeIcons.twitter,
    label: TradMapModel(frFR: "Twitter"),
    value: "@DevilliersMatt",
    url: urlTwitter,
  ),
  Contact(
    icon: FontAwesomeIcons.twitch,
    label: TradMapModel(frFR: "Twitch"),
    value: "TheMatt69",
    url: urlTwitch,
  ),
  Contact(
    icon: FontAwesomeIcons.youtube,
    label: TradMapModel(frFR: "Youtube"),
    value: 'Matthieu Devilliers',
    url: urlYoutube,
  ),
  Contact(
    icon: FontAwesomeIcons.discord,
    label: TradMapModel(frFR: "Discord"),
    value: "Thematt69#9999",
    url: urlDiscord,
  ),
  Contact(
    icon: FontAwesomeIcons.github,
    label: TradMapModel(frFR: "GitHub"),
    value: "Matthieu Devilliers",
    url: urlGithub,
  ),
];
