import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class RealisationTabBar extends StatelessWidget {
  const RealisationTabBar({
    Key? key,
    required this.online,
    required this.hoverAll,
    required this.hoverOnline,
    required this.hoverArchive,
  }) : super(key: key);

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
                  translations.text('views_realisation.all'),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: hover || online == null
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: online == null
                            ? FontWeight.w600
                            : Theme.of(context).textTheme.button?.fontWeight,
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
                  translations.text('views_realisation.online'),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: hover || online == true
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: online == true
                            ? FontWeight.w600
                            : Theme.of(context).textTheme.button?.fontWeight,
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
                  translations.text('views_realisation.archive'),
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: hover || online == false
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onBackground,
                        fontWeight: online == false
                            ? FontWeight.w600
                            : Theme.of(context).textTheme.button?.fontWeight,
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
