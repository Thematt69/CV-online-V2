import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_card_image.dart';
import 'package:flutter/material.dart';

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

  String _selectedFilterToString({bool? value}) {
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
            padding: CvSizes.all15,
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
            padding: CvSizes.all15,
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
            padding: CvSizes.all15,
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
      padding: CvSizes.hor30ver90,
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
          const SizedBox(height: CvSizes.px30),
          _buildTabBar(context),
          const SizedBox(height: CvSizes.px30),
          ValueListenableBuilder<bool?>(
            valueListenable: _online,
            builder: (context, online, child) {
              final List<Realisation> _list = _firestoreBloc.realisations
                  .where(
                    (element) => online == null || online == element.online,
                  )
                  .toList();
              _list.sort(
                (a, b) => a.name.currentLang.compareTo(b.name.currentLang),
              );
              return Wrap(
                spacing: CvSizes.px30,
                runSpacing: CvSizes.px30,
                children: List.generate(
                  _list.length,
                  (index) {
                    final Realisation _realisation = _list[index];
                    return CustomCardImage(
                      widthCard: _widthCard,
                      assetImage: _realisation.imageUrl,
                      title: _realisation.name.currentLang,
                      tag: _selectedFilterToString(value: _realisation.online),
                      url: _realisation.url,
                      urlGitHub: _realisation.urlGitHub,
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
