import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:cv_online_v2/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Presentation extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey keyHeader;
  final GlobalKey keyPresentation;
  final GlobalKey keyCompetence;
  final GlobalKey keyRealisation;
  final GlobalKey keyExperience;
  final GlobalKey keyContact;

  const Presentation({
    Key? key,
    required this.scrollController,
    required this.keyHeader,
    required this.keyPresentation,
    required this.keyCompetence,
    required this.keyRealisation,
    required this.keyExperience,
    required this.keyContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Je suis DEVILLIERS Matthieu et ',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                overflow: TextOverflow.ellipsis,
                child: CustomAnimatedTextKit(),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          RichText(
            text: TextSpan(
              text: 'Mon nom est ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: greyColor,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'DEVILLIERS Matthieu',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                TextSpan(
                  text:
                      ". Je suis développeur web et Android, passionné et dévoué pour mes études et mon avenir. Avec 29 semaines de stage en entreprise, j'ai acquis les compétences et les connaissances nécessaires pour finaliser mes études et intégrer le monde du travail via l'alternance ou l'apprentissage.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: greyColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CustomCard(
                  context: context,
                  label: 'Date de naissance',
                  value: '29/09/2000',
                ),
                CustomCard(
                  context: context,
                  label: 'Age',
                  value:
                      '${DateTime.now().difference(DateTime(2000, 09, 29)).inDays ~/ 365.25} ans',
                ),
                CustomCard(
                  context: context,
                  label: 'Mobilité',
                  value: 'Permis B',
                ),
                CustomCard(
                  context: context,
                  label: 'Localisation',
                  value: '2 Rue Jean Jacques Rousseau, Corbas 69960, France',
                  url: urlMaps,
                ),
                CustomCard(
                  context: context,
                  label: 'Intérêts',
                  value:
                      'Jeux vidéo, Photographie, Streaming & Vidéo, Musique, Rollers, Vélo, Informatique',
                ),
                CustomCard(
                  context: context,
                  label: 'Diplôme',
                  value:
                      'BAC Système Electronique et Numérique & BTS Système Numérique, option Informatique et Réseaux',
                ),
                CustomCard(
                  context: context,
                  label: 'École',
                  value: 'XEFI ACADEMY en partenariat avec EPSI',
                  url: urlXefiAcademy,
                ),
                CustomCard(
                  context: context,
                  label: 'Formation',
                  value: "Concepteur Développeur d'Application",
                ),
                CustomCard(
                  context: context,
                  label: 'Entreprise',
                  value: 'XEFI Software',
                  url: urlXefi,
                ),
                CustomCard(
                  context: context,
                  label: 'Adresse mail',
                  value: 'devilliers.matthieu@gmail.com',
                  url: urlMail,
                ),
                CustomCard(
                  context: context,
                  label: 'Téléphone',
                  value: '06 45 56 48 45',
                  url: urlTel,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => await canLaunch(urlCV)
                    ? await launch(urlCV)
                    : debugPrint('Could not launch $urlCV'),
                child: Text('Télécharger CV'),
              ),
              const SizedBox(width: defaultPadding * 2),
              ElevatedButton(
                onPressed: () {
                  scrollController.animateTo(
                    (keyHeader.currentContext?.size?.height ?? 0) +
                        (keyPresentation.currentContext?.size?.height ?? 0) +
                        (keyCompetence.currentContext?.size?.height ?? 0) +
                        (keyRealisation.currentContext?.size?.height ?? 0) +
                        (keyExperience.currentContext?.size?.height ?? 0),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                child: Text('Me contacter'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
