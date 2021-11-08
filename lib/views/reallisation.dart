import 'package:cloud_firestore/cloud_firestore.dart';
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
  final Stream<QuerySnapshot<Map<String, dynamic>>> _realisationsStream =
      FirebaseFirestore.instance.collection('realisations').snapshots();
  final ValueNotifier<bool> _hoverAll = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverArchive = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverOnline = ValueNotifier<bool>(false);
  final ValueNotifier<bool?> _online = ValueNotifier<bool?>(null);

  @override
  void dispose() {
    _online.dispose();
    _hoverAll.dispose();
    _hoverArchive.dispose();
    _hoverOnline.dispose();
    super.dispose();
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
            _online.value = null;
          },
          onHover: (bool value) {
            _hoverAll.value = value;
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: ValueListenableBuilder<bool?>(
              valueListenable: _online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: _hoverAll,
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
            _online.value = true;
          },
          onHover: (bool value) {
            _hoverOnline.value = value;
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: ValueListenableBuilder<bool?>(
              valueListenable: _online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: _hoverOnline,
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
            _online.value = false;
          },
          onHover: (bool value) {
            _hoverArchive.value = value;
          },
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding30 / 2),
            child: ValueListenableBuilder<bool?>(
              valueListenable: _online,
              builder: (context, online, child) => ValueListenableBuilder<bool>(
                valueListenable: _hoverArchive,
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
          ValueListenableBuilder<bool?>(
            valueListenable: _online,
            builder: (context, online, child) =>
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _realisationsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                  debugPrintStack(stackTrace: snapshot.stackTrace);
                  return Text(
                    'Erreur lors de la récupération des réalisations',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.all(4),
                        child: const CircularProgressIndicator(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Récupération des réalisations en cours...',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                    ],
                  );
                }

                final List<Realisation> listRealisation = snapshot.data!.docs
                    .map(
                      (document) => Realisation.fromFireStore(document.data()),
                    )
                    .toList();

                listRealisation.sort(
                  (a, b) => a.name.currentLang.compareTo(b.name.currentLang),
                );

                final List<Realisation> list = listRealisation
                    .where(
                      (element) => online == null || online == element.online,
                    )
                    .toList();

                return Wrap(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
