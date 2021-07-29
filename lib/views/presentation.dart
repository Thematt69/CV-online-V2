import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:cv_online_v2/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationSection extends StatelessWidget {
  final ScrollController scrollController;

  PresentationSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding30 * 2,
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
                child: const CustomAnimatedTextKit(),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding30),
          RichText(
            text: TextSpan(
              text: 'Mon nom est ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: greyDarkColor,
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
                        color: greyDarkColor,
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
                CustomCard.presentation(
                  context: context,
                  label: 'Date de naissance : ',
                  value: '29/09/2000',
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Age : ',
                  value:
                      '${DateTime.now().difference(DateTime(2000, 09, 29)).inDays ~/ 365.25} ans',
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Mobilité : ',
                  value: 'Permis B',
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Localisation : ',
                  value: '2 Rue Jean Jacques Rousseau, Corbas 69960, France',
                  url: urlMaps,
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Intérêts : ',
                  value:
                      'Jeux vidéo, Photographie, Streaming & Vidéo, Musique, Rollers, Vélo, Informatique',
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Diplôme : ',
                  value:
                      'BAC Système Electronique et Numérique & BTS Système Numérique, option Informatique et Réseaux',
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'École : ',
                  value: 'XEFI ACADEMY en partenariat avec EPSI',
                  url: urlXefiAcademy,
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Formation : ',
                  value: "Concepteur Développeur d'Application",
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Entreprise : ',
                  value: 'XEFI Software',
                  url: urlXefi,
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Adresse mail : ',
                  value: 'devilliers.matthieu@gmail.com',
                  url: urlMail,
                ),
                CustomCard.presentation(
                  context: context,
                  label: 'Téléphone : ',
                  value: '06 45 56 48 45',
                  url: urlTel,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => await launch(urlCV),
                child: const Text('Télécharger CV'),
              ),
              const SizedBox(width: defaultPadding30 * 2),
              ElevatedButton(
                onPressed: () {
                  scrollController.animateTo(
                    positionContact,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                child: const Text('Me contacter'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
