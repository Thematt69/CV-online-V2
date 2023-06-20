import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../models/competence.dart';

class CustomCardCompetence extends StatelessWidget {
  final Competence competence;

  const CustomCardCompetence({
    super.key,
    required this.competence,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.orangeLight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: competence.url != null
            ? () async => launchUrl(Uri.parse(competence.url!))
            : null,
        child: Text(
          competence.label.currentLang(context),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.6,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground,
                decoration:
                    competence.url != null ? TextDecoration.underline : null,
              ),
        ),
      ),
    );
  }
}
