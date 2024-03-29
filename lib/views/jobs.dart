import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../controllers/bloc_provider.dart';
import '../controllers/firestore_bloc.dart';
import '../models/jobs.dart';
import '../responsive.dart';
import '../widgets/custom_card_jobs.dart';

class JobsSection extends StatefulWidget {
  const JobsSection({
    super.key,
    required this.isShowDrawer,
  });

  final bool isShowDrawer;

  @override
  JobsSectionState createState() => JobsSectionState();
}

class JobsSectionState extends State<JobsSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  double get _widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - CvSizes.px180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get _widthCard {
    if (_widthMediaQuery - CvSizes.px30 > CvSizes.px1290) {
      return (_widthMediaQuery - CvSizes.px120) / 3;
    } else if (_widthMediaQuery - CvSizes.px30 > CvSizes.px860) {
      return (_widthMediaQuery - CvSizes.px90) / 2;
    } else {
      return _widthMediaQuery - CvSizes.px60;
    }
  }

  @override
  void dispose() {
    _firestoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _firestoreBloc.jobs.sort((a, b) => b.periode.end.compareTo(a.periode.end));
    return Container(
      color: CvColors.greyLight,
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.jobsViews_my,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: AppLocalizations.of(context)!.jobsViews_jobs,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: CvSizes.px30),
          Wrap(
            spacing: CvSizes.px30,
            runSpacing: CvSizes.px30,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              _firestoreBloc.jobs.length,
              (index) {
                final Job job = _firestoreBloc.jobs[index];
                return CustomCardJobs(
                  periode: job.periodeString(context),
                  lieu: job.lieu.currentLang(context),
                  poste: job.poste.currentLang(context),
                  widthCard: _widthCard,
                  description: job.description?.currentLang(context),
                  service: job.service?.currentLang(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
