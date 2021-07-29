import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_card_jobs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../responsive.dart';

class JobsSection extends StatefulWidget {
  final bool isShowDrawer;

  JobsSection({
    Key? key,
    required this.isShowDrawer,
  }) : super(key: key);

  @override
  _JobsSectionState createState() => _JobsSectionState();
}

class _JobsSectionState extends State<JobsSection> {
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
      return (widthMediaQuery - defaultPadding30 * 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    listJobs.sort((a, b) => a.periode.end.compareTo(b.periode.end));
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
              text: 'Mes ',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'jobs',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding30),
          Wrap(
            spacing: defaultPadding30,
            runSpacing: defaultPadding30,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              listJobs.length,
              (index) => CustomCardJobs(
                periode:
                    '${dateFormat.format(listJobs[index].periode.start)} - ${dateFormat.format(listJobs[index].periode.end)}',
                lieu: listJobs[index].lieu,
                poste: listJobs[index].poste,
                widthCard: widthCard,
                description: listJobs[index].description,
                service: listJobs[index].service,
              ),
            ),
          )
        ],
      ),
    );
  }
}