import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: darkLightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: Responsive.isDesktop(context) &&
                MediaQuery.of(context).size.height > 450,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(130),
              child: Image.asset(
                assetPhoto3056,
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
            width: Responsive.isDesktop(context)
                ? defaultPadding60
                : defaultPadding30,
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
                      assetPhoto3056,
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
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Responsive.isDesktop(context) ? 72 : 50,
                          ),
                    ),
                    const SizedBox(width: defaultPadding6),
                    Text(
                      'Matthieu',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: Responsive.isDesktop(context) ? 72 : 50,
                          ),
                    ),
                  ],
                ),
                CustomAnimatedTextKit(
                  prefix: '${translations.text('views_header.i_am')} ',
                  textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: Responsive.isDesktop(context) ? 30 : 24,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Responsive.isDesktop(context)
                ? defaultPadding60
                : defaultPadding30,
          ),
        ],
      ),
    );
  }
}
