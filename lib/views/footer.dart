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
  late PackageInfo _packageInfo;

  Future<void> getPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkLightColor,
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding60,
        horizontal: defaultPadding16,
      ),
      width: double.infinity,
      child: MediaQuery.of(context).size.width > 900
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
                  ' | Copyright ©2021 ${translations.text('views_footer.all_rights_reserved')} | ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Text(
                  translations.text('views_footer.develop_flutter'),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: FlutterLogo(),
                ),
                FutureBuilder(
                  future: getPackageInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        '| Version ${_packageInfo.version}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
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
                  'Copyright ©2021 ${translations.text('views_footer.all_rights_reserved')}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      translations.text('views_footer.develop_flutter'),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: FlutterLogo(),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: getPackageInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        'Version ${_packageInfo.version}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
    );
  }
}
