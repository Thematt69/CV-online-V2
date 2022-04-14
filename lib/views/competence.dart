import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/widgets/custom_card_competence.dart';
import 'package:flutter/material.dart';

class CompetenceSection extends StatefulWidget {
  const CompetenceSection({Key? key}) : super(key: key);

  @override
  State<CompetenceSection> createState() => _CompetenceSectionState();
}

class _CompetenceSectionState extends State<CompetenceSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.greyLight,
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver90,
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
          const SizedBox(height: CvSizes.px30),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              _firestoreBloc.competences.length,
              (index) => CustomCardCompetence(
                competence: _firestoreBloc.competences[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
