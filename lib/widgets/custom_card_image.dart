import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    super.key,
    required this.widthCard,
    required this.assetImage,
    required this.title,
    required this.tag,
    this.url,
    this.urlGitHub,
  });

  final String assetImage;
  final String tag;
  final String title;
  final String? url;
  final String? urlGitHub;
  final double widthCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: url != null ? () async => launchUrl(Uri.parse(url!)) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widthCard,
        height: widthCard,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: widthCard,
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.7),
              padding: CvSizes.hor15ver15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: CvColors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        tag,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: CvColors.white),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: urlGitHub != null,
                        child: IconButton(
                          tooltip:
                              AppLocalizations.of(context)!.cardImage_goGithub,
                          onPressed: () async =>
                              launchUrl(Uri.parse(urlGitHub!)),
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
