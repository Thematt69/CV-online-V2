import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class CustomCardRecommandationWeb extends StatelessWidget {
  const CustomCardRecommandationWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding60,
        right: defaultPadding150,
        top: defaultPadding60,
        bottom: defaultPadding60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            assetDoubleQuote,
            width: 60,
            cacheWidth: 60,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 60,
            ),
          ),
          const SizedBox(width: defaultPadding30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translations.text('contents.recommandation'),
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        letterSpacing: 0,
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                        color: whiteDarkerColor,
                      ),
                ),
                const SizedBox(height: defaultPadding30),
                Text(
                  auteurRecommandation,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: greyColor,
                      ),
                ),
                const SizedBox(height: defaultPadding6),
                Text(
                  translations.text('contents.poste_recommandation'),
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: orangeColor,
                        fontSize: 18,
                      ),
                ),
                Text(
                  entrepriseRecommandation,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: orangeColor,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
