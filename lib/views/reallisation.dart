import 'package:flutter/material.dart';

import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/models/realisation_card.dart';
import 'package:cv_online_v2/widgets/custom_card_image.dart';

import '../responsive.dart';

class RealisationSection extends StatefulWidget {
  RealisationSection({
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
  FilterRealisation selectedFilter = FilterRealisation.ALL;

  List<Realisation> get list => listRealisations
      .where(
        (element) =>
            element.tag == selectedFilter ||
            selectedFilter == FilterRealisation.ALL,
      )
      .toList();

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

  String selectedFilterToString(FilterRealisation value) {
    if (value == FilterRealisation.ONLINE) {
      return 'En ligne';
    } else if (value == FilterRealisation.ARCHIVE) {
      return 'Archive';
    } else {
      return 'Tous';
    }
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selectedFilter = FilterRealisation.ALL;
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
              'Tous',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverAll || selectedFilter == FilterRealisation.ALL
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: selectedFilter == FilterRealisation.ALL
                        ? FontWeight.w600
                        : Theme.of(context).textTheme.button?.fontWeight,
                  ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedFilter = FilterRealisation.ONLINE;
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
              'En ligne',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverOnline ||
                            selectedFilter == FilterRealisation.ONLINE
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: selectedFilter == FilterRealisation.ONLINE
                        ? FontWeight.w600
                        : Theme.of(context).textTheme.button?.fontWeight,
                  ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedFilter = FilterRealisation.ARCHIVE;
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
              'Archive',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: hoverArchive ||
                            selectedFilter == FilterRealisation.ARCHIVE
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onBackground,
                    fontWeight: selectedFilter == FilterRealisation.ARCHIVE
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
    list.sort((a, b) => a.title.compareTo(b.title));
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
              text: 'Mes différentes ',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'réalisations',
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
                title: list[index].title,
                tag: selectedFilterToString(list[index].tag),
                url: list[index].url,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
