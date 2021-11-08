import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/widgets/custom_card_image.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class RealisationSection extends StatefulWidget {
  const RealisationSection({
    Key? key,
    required this.isShowDrawer,
  }) : super(key: key);

  final bool isShowDrawer;

  @override
  _RealisationSectionState createState() => _RealisationSectionState();
}

class _RealisationSectionState extends State<RealisationSection> {
  bool hoverAll = false;
  bool hoverArchive = false;
  bool hoverOnline = false;
  bool? online;

  List<Realisation> get list {
    listRealisations
        .sort((a, b) => a.name.currentLang.compareTo(b.name.currentLang));
    return listRealisations
        .where(
          (element) => online == null || online!
              ? element.url != null
              : element.url == null,
        )
        .toList();
  }

  double get widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - 180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get widthCard {
    if (widthMediaQuery - defaultPadding30 > 1290) {
      return (widthMediaQuery - defaultPadding30 * 5) / 4;
    } else if (widthMediaQuery - defaultPadding30 > 860) {
      return (widthMediaQuery - defaultPadding30 * 4) / 3;
    } else if (widthMediaQuery - defaultPadding30 > 550) {
      return (widthMediaQuery - defaultPadding30 * 3) / 2;
    } else {
      return widthMediaQuery - defaultPadding30 * 2;
    }
  }

  String selectedFilterToString({bool? value}) {
    if (value == null) {
      return translations.text('views_realisation.all');
    } else if (value) {
      return translations.text('views_realisation.online');
    } else {
      return translations.text('views_realisation.archive');
    }
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              online = null;
            });
          },
          onHover: (bool value) {
            setState(() {
              hoverAll = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: Text(
              translations.text('views_realisation.all'),
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverAll || online == null
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: online == null
                        ? FontWeight.w600
                        : Theme.of(context).textTheme.button?.fontWeight,
                  ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              online = true;
            });
          },
          onHover: (bool value) {
            setState(() {
              hoverOnline = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: Text(
              translations.text('views_realisation.online'),
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverOnline || online == true
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: online == true
                        ? FontWeight.w600
                        : Theme.of(context).textTheme.button?.fontWeight,
                  ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              online = false;
            });
          },
          onHover: (bool value) {
            setState(() {
              hoverArchive = value;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: Text(
              translations.text('views_realisation.archive'),
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverArchive || online == false
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: online == false
                        ? FontWeight.w600
                        : Theme.of(context).textTheme.button?.fontWeight,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding30 * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: translations.text('views_realisation.my_different'),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_realisation.realisation'),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: defaultPadding30),
          _buildTabBar(context),
          const SizedBox(height: defaultPadding30),
          Wrap(
            spacing: defaultPadding30,
            runSpacing: defaultPadding30,
            children: List.generate(
              list.length,
              (index) => CustomCardImage(
                widthCard: widthCard,
                assetImage: list[index].assetImage,
                title: list[index].name.currentLang,
                tag: selectedFilterToString(value: list[index].online),
                url: list[index].url,
                urlGitHub: list[index].urlGitHub,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
