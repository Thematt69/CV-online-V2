import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../controllers/bloc_provider.dart';
import '../controllers/firestore_bloc.dart';
import '../widgets/custom_card_competence.dart';

class CompetenceSection extends StatefulWidget {
  const CompetenceSection({super.key});

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
              text: AppLocalizations.of(context)!.competenceViews_my,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text:
                      AppLocalizations.of(context)!.competenceViews_competence,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
