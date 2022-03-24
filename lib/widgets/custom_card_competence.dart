import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/models/competence.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardCompetence extends StatelessWidget {
  final Competence competence;

  const CustomCardCompetence({
    Key? key,
    required this.competence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.orangeLight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap:
            competence.url != null ? () async => launch(competence.url!) : null,
        child: Text(
          competence.label.currentLang,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
