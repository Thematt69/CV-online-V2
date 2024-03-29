import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/sizes.dart';

class RealisationTabBar extends StatelessWidget {
  const RealisationTabBar({
    super.key,
    required this.online,
    required this.hoverAll,
    required this.hoverOnline,
    required this.hoverArchive,
  });

  final ValueNotifier<bool?> online;
  final ValueNotifier<bool> hoverAll;
  final ValueNotifier<bool> hoverOnline;
  final ValueNotifier<bool> hoverArchive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            online.value = null;
          },
          onHover: (bool value) {
            hoverAll.value = value;
          },
          child: Padding(
            padding: CvSizes.all15,
            child: ValueListenableBuilder<bool?>(
              valueListenable: online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: hoverAll,
                builder: (context, hover, child) => Text(
                  AppLocalizations.of(context)!.realisationViews_all,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: hover || online == null
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: online == null
                            ? FontWeight.w600
                            : Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.fontWeight,
                      ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            online.value = true;
          },
          onHover: (bool value) {
            hoverOnline.value = value;
          },
          child: Padding(
            padding: CvSizes.all15,
            child: ValueListenableBuilder<bool?>(
              valueListenable: online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: hoverOnline,
                builder: (context, hover, child) => Text(
                  AppLocalizations.of(context)!.realisationViews_online,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: hover || (online != null && online)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: (online != null && online)
                            ? FontWeight.w600
                            : Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.fontWeight,
                      ),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            online.value = false;
          },
          onHover: (bool value) {
            hoverArchive.value = value;
          },
          child: Padding(
            padding: CvSizes.all15,
            child: ValueListenableBuilder<bool?>(
              valueListenable: online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: hoverArchive,
                builder: (context, hover, child) => Text(
                  AppLocalizations.of(context)!.realisationViews_archive,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: hover || online == false
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: online == false
                            ? FontWeight.w600
                            : Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.fontWeight,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
