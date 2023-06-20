import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/assets.dart';
import '../constants/sizes.dart';
import '../responsive.dart';
import '../widgets/custom_animated_text_kit.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: Responsive.isDesktop(context) &&
                MediaQuery.of(context).size.height > 450,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(130),
              child: Image.asset(
                CvAssets.photo3056,
                fit: BoxFit.cover,
                width: 260,
                height: 260,
                errorBuilder: (_, __, ___) => const SizedBox(
                  width: 260,
                  height: 260,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Responsive.isDesktop(context) ? CvSizes.px60 : CvSizes.px30,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: Responsive.isTablet(context) &&
                      MediaQuery.of(context).size.height > 450,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(130),
                    child: Image.asset(
                      CvAssets.photo3056,
                      fit: BoxFit.cover,
                      width: 260,
                      height: 260,
                      errorBuilder: (_, __, ___) => const SizedBox(
                        width: 260,
                        height: 260,
                      ),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'DEVILLIERS',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Responsive.isDesktop(context) ? 72 : 50,
                          ),
                    ),
                    const SizedBox(width: CvSizes.px6),
                    Text(
                      'Matthieu',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Responsive.isDesktop(context) ? 72 : 50,
                          ),
                    ),
                  ],
                ),
                CustomAnimatedTextKit(
                  prefix: '${AppLocalizations.of(context)!.headerViews_iAm} ',
                  textStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Responsive.isDesktop(context) ? 30 : 24,
                          ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Responsive.isDesktop(context) ? CvSizes.px60 : CvSizes.px30,
          ),
        ],
      ),
    );
  }
}
