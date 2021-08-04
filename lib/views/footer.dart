import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkLightColor,
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding60,
        horizontal: defaultPadding16,
      ),
      width: double.infinity,
      child: MediaQuery.of(context).size.width > 650
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Matthieu Devilliers',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Text(
                  ' | Copyright ©2021 All rights reserved | ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Text(
                  'Made with Flutter',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                const FlutterLogo(),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Matthieu Devilliers',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Text(
                  'Copyright ©2021 All rights reserved',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Made with Flutter',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    const FlutterLogo(),
                  ],
                ),
              ],
            ),
    );
  }
}
