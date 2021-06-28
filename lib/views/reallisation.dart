import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/models/realisation_card.dart';
import 'package:cv_online_v2/widgets/custom_card_image.dart';
import 'package:flutter/material.dart';

class RealisationSection extends StatefulWidget {
  const RealisationSection({Key? key}) : super(key: key);

  @override
  _RealisationSectionState createState() => _RealisationSectionState();
}

class _RealisationSectionState extends State<RealisationSection> {
  FilterRealisation selectedFilter = FilterRealisation.ALL;
  bool hoverAll = false;
  bool hoverOnline = false;
  bool hoverArchive = false;

  List<Realisation> get list => listRealisation
      .where(
        (element) =>
            element.tag == selectedFilter ||
            selectedFilter == FilterRealisation.ALL,
      )
      .toList();

  double get widthCard =>
      MediaQuery.of(context).size.width - defaultPadding > 1290
          ? (MediaQuery.of(context).size.width - defaultPadding * 5) / 4
          : MediaQuery.of(context).size.width - defaultPadding > 860
              ? (MediaQuery.of(context).size.width - defaultPadding * 4) / 3
              : MediaQuery.of(context).size.width - defaultPadding > 550
                  ? (MediaQuery.of(context).size.width - defaultPadding * 3) / 2
                  : (MediaQuery.of(context).size.width - defaultPadding * 2);

  String selectedFilterToString(FilterRealisation value) {
    if (value == FilterRealisation.ONLINE) {
      return 'En ligne';
    } else if (value == FilterRealisation.ARCHIVE) {
      return 'Archive';
    } else {
      return 'Tous';
    }
  }

  @override
  Widget build(BuildContext context) {
    list.sort((a, b) => a.title.compareTo(b.title));
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 3,
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
          const SizedBox(height: defaultPadding),
          _buildTabBar(context),
          const SizedBox(height: defaultPadding),
          Wrap(
            spacing: defaultPadding,
            runSpacing: defaultPadding,
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
            padding: const EdgeInsets.all(defaultPadding / 2),
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
            padding: const EdgeInsets.all(defaultPadding / 2),
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
            padding: const EdgeInsets.all(defaultPadding / 2),
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
}
