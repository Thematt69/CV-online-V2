import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:cv_online_v2/widgets/custom_card_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationSection extends StatefulWidget {
  const PresentationSection({
    super.key,
    required this.scrollController,
  });

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
            AppLocalizations.of(context)!.presentationViews_iAm,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          CustomAnimatedTextKit(
            textAlign: TextAlign.start,
            prefix: '${AppLocalizations.of(context)!.headerViews_iAm} ',
            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 26,
                  height: 1,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(height: CvSizes.px30),
          if (_firestoreBloc.description != null)
            SelectableText.rich(
              TextSpan(
                text: AppLocalizations.of(context)!.presentationViews_myNameIs,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: CvColors.greyDark,
                    ),
                children: <TextSpan>[
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: AppLocalizations.of(context)!.presentationViews_name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text:
                        _firestoreBloc.description!.value.currentLang(context),
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
                  label: _firestoreBloc.presentations[index].label!
                      .currentLang(context),
                  value: _firestoreBloc.presentations[index].value
                      .currentLang(context),
                  url: _firestoreBloc.presentations[index].url,
                ),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => launchUrl(Uri.parse(CvUrls.urlCV)),
                child: Text(
                  AppLocalizations.of(context)!.presentationViews_downloadCv,
                ),
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
                child: Text(
                  AppLocalizations.of(context)!.presentationViews_contactMe,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
