import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:cv_online_v2/widgets/custom_card_presentation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationSection extends StatelessWidget {
  const PresentationSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translations.text('views_presentation.i_am'),
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          CustomAnimatedTextKit(
            textAlign: TextAlign.start,
            prefix: '${translations.text('views_header.i_am')} ',
            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 26,
                  height: 1,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(height: defaultPadding30),
          RichText(
            text: TextSpan(
              text: translations.text('views_presentation.my_name_is'),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: greyDarkColor,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_presentation.name'),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('contents.description'),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: greyDarkColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding30),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CustomCardPresentation(
                  label: translations.text('views_presentation.date_birth'),
                  value:
                      translations.text('views_presentation.date_birth_value'),
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.age'),
                  value:
                      '${DateTime.now().difference(DateTime(2000, 09, 29)).inDays ~/ 365.25} ${translations.text('views_presentation.years')}',
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.mobility'),
                  value: translations.text('views_presentation.permit_b'),
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.location'),
                  value: 'Corbas, 69960 France',
                  url: urlMaps,
                ),
                // TODO - Cacher et afficher au clic - Eviter le spam robot
                CustomCardPresentation(
                  label: translations.text('views_presentation.email'),
                  value: 'devilliers.matthieu@gmail.com',
                  url: urlMail,
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.interests'),
                  value:
                      translations.text('views_presentation.interests_value'),
                ),
                // CustomCardPresentation(
                //
                //   label: 'Diplôme',
                //   value:
                //       'BAC Système Electronique et Numérique & BTS Système Numérique, option Informatique et Réseaux',
                // ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.school'),
                  value: "XEFI ACADEMY - EPSI Lyon",
                  url: urlXefiAcademy,
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.formation'),
                  value:
                      translations.text('views_presentation.formation_value'),
                ),
                CustomCardPresentation(
                  label: translations.text('views_presentation.company'),
                  value: "Sully Group",
                  url: urlSullyGroup,
                ),
                // CustomCardPresentation(
                //
                //   label: 'Téléphone',
                //   value: '06 45 56 48 45',
                //   url: urlTel,
                // ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => launch(urlCV),
                child:
                    Text(translations.text('views_presentation.download_cv')),
              ),
              if (Responsive.isMobile(context))
                const Spacer()
              else
                const SizedBox(width: defaultPadding60),
              ElevatedButton(
                onPressed: () {
                  scrollController.animateTo(
                    positionContact,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                child: Text(translations.text('views_presentation.contact_me')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
