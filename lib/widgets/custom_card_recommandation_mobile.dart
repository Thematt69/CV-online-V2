import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:flutter/material.dart';

class CustomCardRecommandationMobile extends StatelessWidget {
  const CustomCardRecommandationMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding30),
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              Visibility(
                visible: Responsive.isTablet(context),
                child: Image.asset(
                  assetDoubleQuote,
                  width: 60,
                  cacheWidth: 60,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    width: 60,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
