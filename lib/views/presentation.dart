import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:cv_online_v2/widgets/custom_card_presentation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationSection extends StatefulWidget {
  const PresentationSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<PresentationSection> createState() => _PresentationSectionState();
}

class _PresentationSectionState extends State<PresentationSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.white,
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver60,
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
          const SizedBox(height: CvSizes.px30),
          if (_firestoreBloc.description != null)
            RichText(
              text: TextSpan(
                text: translations.text('views_presentation.my_name_is'),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: CvColors.greyDark,
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
                    text: _firestoreBloc.description!.value.currentLang,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: CvColors.greyDark,
                        ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: CvSizes.ver30,
            child: Wrap(
              spacing: CvSizes.px10,
              runSpacing: CvSizes.px10,
              children: List.generate(
                _firestoreBloc.presentations.length,
                (index) => CustomCardPresentation(
                  label: _firestoreBloc.presentations[index].label!.currentLang,
                  value: _firestoreBloc.presentations[index].value.currentLang,
                  url: _firestoreBloc.presentations[index].url,
                ),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => launch(CvUrls.urlCV),
                child:
                    Text(translations.text('views_presentation.download_cv')),
              ),
              if (Responsive.isMobile(context))
                const Spacer()
              else
                const SizedBox(width: CvSizes.px60),
              ElevatedButton(
                onPressed: () {
                  widget.scrollController.animateTo(
                    CvSections.positionContact,
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
