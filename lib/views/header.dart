import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({Key? key}) : super(key: key);

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
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                image: const DecorationImage(
                  image: AssetImage(
                    'images/IMG_20180831_004109_835.webp',
                  ),
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
                  child: Container(
                    width: 260,
                    height: 260,
                    margin: const EdgeInsets.only(bottom: defaultPadding60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(130),
                      image: const DecorationImage(
                        image: AssetImage(
                          'images/IMG_20180831_004109_835.webp',
                        ),
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
                  prefix: 'Je suis ',
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
