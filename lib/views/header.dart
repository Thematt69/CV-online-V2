import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: darkLightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: Responsive.isDesktop(context),
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
          const SizedBox(width: defaultPadding * 2),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: !Responsive.isDesktop(context),
                  child: Container(
                    width: 260,
                    height: 260,
                    margin: const EdgeInsets.only(bottom: defaultPadding * 2),
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
                      'DEVILLIERS ',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Text(
                      'Matthieu',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Je suis ',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                      child: const CustomAnimatedTextKit(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: defaultPadding * 2),
        ],
      ),
    );
  }
}
