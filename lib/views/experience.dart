import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/models/experience_card.dart';
import 'package:cv_online_v2/widgets/custom_card_experience.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../responsive.dart';

class ExperienceSection extends StatefulWidget {
  final bool isShowDrawer;

  const ExperienceSection({
    Key? key,
    required this.isShowDrawer,
  }) : super(key: key);

  @override
  _ExperienceSectionState createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  DateFormat dateFormat = DateFormat.yMMMd('fr');

  double get widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - 180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get widthCard {
    if (widthMediaQuery - defaultPadding > 1290) {
      return (widthMediaQuery - defaultPadding * 4) / 3;
    } else if (widthMediaQuery - defaultPadding > 860) {
      return (widthMediaQuery - defaultPadding * 3) / 2;
    } else {
      return (widthMediaQuery - defaultPadding * 2);
    }
  }

  String selectedFilterToString(TypeExperience value) {
    if (value == TypeExperience.DIPLOME) {
      return 'Diplome';
    } else if (value == TypeExperience.ALTERNANCE) {
      return 'Alternance';
    } else if (value == TypeExperience.STAGE) {
      return 'Stage';
    } else if (value == TypeExperience.INTERIMAIRE) {
      return 'Intérimaire';
    } else {
      return 'Expérience';
    }
  }

  @override
  Widget build(BuildContext context) {
    listExperience.sort((a, b) => a.periode.end.compareTo(b.periode.end));
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
                  text: 'expériences',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            spacing: defaultPadding,
            runSpacing: defaultPadding,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              listExperience.length,
              (index) => CustomCardExperience(
                periode:
                    '${dateFormat.format(listExperience[index].periode.start)} - ${dateFormat.format(listExperience[index].periode.end)}',
                lieu: listExperience[index].lieu,
                poste: listExperience[index].poste,
                widthCard: widthCard,
                description: listExperience[index].description,
                service: listExperience[index].service,
                type: selectedFilterToString(listExperience[index].type),
              ),
            ),
          )
        ],
      ),
    );
  }
}
