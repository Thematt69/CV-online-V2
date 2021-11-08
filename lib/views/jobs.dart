import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/widgets/custom_card_jobs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../responsive.dart';

class JobsSection extends StatefulWidget {
  const JobsSection({
    Key? key,
    required this.isShowDrawer,
  }) : super(key: key);

  final bool isShowDrawer;

  @override
  _JobsSectionState createState() => _JobsSectionState();
}

class _JobsSectionState extends State<JobsSection> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _jobsStream =
      FirebaseFirestore.instance
          .collection('jobs')
          .orderBy('periode.end', descending: true)
          .snapshots();

  DateFormat dateFormat = DateFormat.yMMMd('fr');

  double get widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - 180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get widthCard {
    if (widthMediaQuery - defaultPadding30 > 1290) {
      return (widthMediaQuery - defaultPadding30 * 4) / 3;
    } else if (widthMediaQuery - defaultPadding30 > 860) {
      return (widthMediaQuery - defaultPadding30 * 3) / 2;
    } else {
      return widthMediaQuery - defaultPadding30 * 2;
    }
  }

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
              text: translations.text('views_jobs.my'),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_jobs.jobs'),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding30),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _jobsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return Text(
                  'Erreur lors de la récupération des jobs',
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
                      'Récupération des jobs en cours...',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                    ),
                  ],
                );
              }

              final List<Jobs> listJobs = snapshot.data!.docs
                  .map((document) => Jobs.fromFireStore(document.data()))
                  .toList();

              return Wrap(
                spacing: defaultPadding30,
                runSpacing: defaultPadding30,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(
                  listJobs.length,
                  (index) => CustomCardJobs(
                    periode:
                        '${dateFormat.format(listJobs[index].periode.start)} - ${dateFormat.format(listJobs[index].periode.end)}',
                    lieu: listJobs[index].lieu.currentLang,
                    poste: listJobs[index].poste.currentLang,
                    widthCard: widthCard,
                    description: listJobs[index].description.currentLang,
                    service: listJobs[index].service?.currentLang,
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
