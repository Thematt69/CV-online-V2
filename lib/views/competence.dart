import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/competence.dart';
import 'package:cv_online_v2/widgets/custom_card_competence.dart';
import 'package:flutter/material.dart';

class CompetenceSection extends StatefulWidget {
  const CompetenceSection({Key? key}) : super(key: key);

  @override
  State<CompetenceSection> createState() => _CompetenceSectionState();
}

class _CompetenceSectionState extends State<CompetenceSection> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _competencesStream =
      FirebaseFirestore.instance
          .collection('competences')
          .orderBy('label')
          .snapshots();

  @override
  Widget build(BuildContext context) {
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
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _competencesStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return Text(
                  'Erreur lors de la récupération des compétences',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.all(4),
                      child: const CircularProgressIndicator(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Récupération des compétences en cours...',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                    ),
                  ],
                );
              }

              final List<Competence> listCompetences = snapshot.data!.docs
                  .map((document) => Competence.fromFireStore(document.data()))
                  .toList();

              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  listCompetences.length,
                  (index) => CustomCardCompetence(
                    competence: listCompetences[index],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
