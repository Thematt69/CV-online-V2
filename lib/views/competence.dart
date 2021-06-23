import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Competence extends StatelessWidget {
  const Competence({Key? key}) : super(key: key);

  static List<String> listCompetences = [
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

  @override
  Widget build(BuildContext context) {
    listCompetences.sort((a, b) => a.compareTo(b));
    return Container(
      color: greyLightColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Mes ',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Compétences',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              listCompetences.length,
              (index) => CustomCard.competence(
                context: context,
                label: listCompetences[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
