import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/sizes.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  Future<PackageInfo> _getPackageInfo() async => PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      padding: CvSizes.hor16ver30,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Matthieu Devilliers ©2022',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  AppLocalizations.of(context)!.footerViews_developFlutter,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
              ),
              const SizedBox(width: CvSizes.px4),
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
