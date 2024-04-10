import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    super.key,
    required this.widthCard,
    required this.assetImage,
    required this.title,
    required this.tag,
    required this.url,
    required this.urlGitHub,
    required this.urlGoogleAppStore,
  });

  final String assetImage;
  final String tag;
  final String title;
  final String? url;
  final String? urlGitHub;
  final String? urlGoogleAppStore;
  final double widthCard;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
                      .headlineSmall
                      ?.copyWith(color: CvColors.white),
                ),
                Row(
                  children: [
                    Text(
                      tag,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: CvColors.white),
                    ),
                    const Spacer(),
                    if (url != null)
                      IconButton(
                        tooltip: tr('cardImage_goWebSite'),
                        onPressed: () async => launchUrl(Uri.parse(url!)),
                        icon: FaIcon(
                          FontAwesomeIcons.globe,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                    if (urlGoogleAppStore != null)
                      IconButton(
                        tooltip: tr('cardImage_goGooglePlayStore'),
                        onPressed: () async =>
                            launchUrl(Uri.parse(urlGoogleAppStore!)),
                        icon: FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                    if (urlGitHub != null)
                      IconButton(
                        tooltip: tr('cardImage_goGithub'),
                        onPressed: () async => launchUrl(Uri.parse(urlGitHub!)),
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
