import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_card_image.dart';
import 'package:cv_online_v2/widgets/realisation_tab_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RealisationSection extends StatefulWidget {
  const RealisationSection({
    super.key,
    required this.isShowDrawer,
  });

  final bool isShowDrawer;

  @override
  RealisationSectionState createState() => RealisationSectionState();
}

class RealisationSectionState extends State<RealisationSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);
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
    _firestoreBloc.dispose();
    super.dispose();
  }

  double get _widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - CvSizes.px180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get _widthCard {
    if (_widthMediaQuery - CvSizes.px30 > CvSizes.px1290) {
      return (_widthMediaQuery - CvSizes.px150) / 4;
    } else if (_widthMediaQuery - CvSizes.px30 > CvSizes.px860) {
      return (_widthMediaQuery - CvSizes.px120) / 3;
    } else if (_widthMediaQuery - CvSizes.px30 > CvSizes.px550) {
      return (_widthMediaQuery - CvSizes.px90) / 2;
    } else {
      return _widthMediaQuery - CvSizes.px60;
    }
  }

  String _selectedFilterToString({
    bool? value,
    required BuildContext context,
  }) {
    if (value == null) {
      return tr('realisationViews_all');
    } else if (value) {
      return tr('realisationViews_online');
    } else {
      return tr('realisationViews_archive');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: tr('realisationViews_myDifferent'),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: tr('realisationViews_realisation'),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: CvSizes.px30),
          RealisationTabBar(
            online: _online,
            hoverAll: _hoverAll,
            hoverOnline: _hoverOnline,
            hoverArchive: _hoverArchive,
          ),
          const SizedBox(height: CvSizes.px30),
          ValueListenableBuilder<bool?>(
            valueListenable: _online,
            builder: (context, online, child) {
              final List<Realisation> list = _firestoreBloc.realisations
                  .where(
                    (element) => online == null || online == element.online,
                  )
                  .toList()
                ..sort(
                  (a, b) => a.name
                      .currentLang(context)
                      .compareTo(b.name.currentLang(context)),
                );
              return Wrap(
                spacing: CvSizes.px30,
                runSpacing: CvSizes.px30,
                children: List.generate(
                  list.length,
                  (index) {
                    final Realisation realisation = list[index];
                    return CustomCardImage(
                      widthCard: _widthCard,
                      assetImage: realisation.imageUrl,
                      title: realisation.name.currentLang(context),
                      tag: _selectedFilterToString(
                        value: realisation.online,
                        context: context,
                      ),
                      url: realisation.url,
                      urlGitHub: realisation.urlGitHub,
                      urlGoogleAppStore: realisation.urlGoogleAppStore,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
