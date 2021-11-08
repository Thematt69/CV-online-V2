import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CompetenceSection extends StatelessWidget {
  const CompetenceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listCompetences.sort((a, b) => a.compareTo(b));
    return Container(
      color: greyLightColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding30 * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: translations.text('views_competence.my'),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_competence.competence'),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding30),
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
