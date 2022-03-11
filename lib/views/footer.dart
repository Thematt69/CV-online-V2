import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  Future<PackageInfo> _getPackageInfo() async => PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkLightColor,
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding60,
        horizontal: defaultPadding16,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Matthieu Devilliers ©2022',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              const SizedBox(width: 4),
              Text(
                '|',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              const SizedBox(width: 4),
              Text(
                translations.text('views_footer.develop_flutter'),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              const SizedBox(width: 4),
              const FlutterLogo(),
            ],
          ),
          FutureBuilder<PackageInfo>(
            future: _getPackageInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return Text(
                  'v${snapshot.data!.version}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
