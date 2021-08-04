import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    Key? key,
    required this.widthCard,
    required this.assetImage,
    required this.title,
    required this.tag,
    this.url,
    this.urlGitHub,
  }) : super(key: key);

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
      onTap: url != null ? () async => await launch(url!) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widthCard,
        height: widthCard,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetImage),
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
                  .secondaryVariant
                  .withOpacity(0.7),
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding30 / 2,
                vertical: defaultPadding30 / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: whiteColor),
                  ),
                  Row(
                    children: [
                      Text(
                        tag,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: whiteColor),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: urlGitHub != null,
                        child: IconButton(
                          tooltip: 'Aller sur GitHub',
                          onPressed: () async => await launch(urlGitHub!),
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: Theme.of(context).colorScheme.onSecondary,
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
