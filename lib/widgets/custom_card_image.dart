import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardImage extends StatelessWidget {
  final double widthCard;
  final String assetImage;
  final String title;
  final String tag;
  final String? url;

  const CustomCardImage({
    Key? key,
    required this.widthCard,
    required this.assetImage,
    required this.title,
    required this.tag,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor:
          url != null ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
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
              color: darkColor.withOpacity(0.7),
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
                  Text(
                    tag,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: whiteColor),
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
