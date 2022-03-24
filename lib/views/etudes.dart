import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/extensions/date_time_extension.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_card_etudes.dart';
import 'package:flutter/material.dart';

class EtudesSection extends StatefulWidget {
  const EtudesSection({
    Key? key,
    required this.isShowDrawer,
  }) : super(key: key);

  final bool isShowDrawer;

  @override
  _EtudesSectionState createState() => _EtudesSectionState();
}

class _EtudesSectionState extends State<EtudesSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  double get _widthMediaQuery {
    if (widget.isShowDrawer && Responsive.isDesktop(context)) {
      return MediaQuery.of(context).size.width - CvSizes.px180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get _widthCard {
    if (_widthMediaQuery - CvSizes.px30 > CvSizes.px1290) {
      return (_widthMediaQuery - CvSizes.px120) / 3;
    } else if (_widthMediaQuery - CvSizes.px30 > CvSizes.px860) {
      return (_widthMediaQuery - CvSizes.px90) / 2;
    } else {
      return _widthMediaQuery - CvSizes.px60;
    }
  }

  @override
  void dispose() {
    _firestoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _firestoreBloc.etudes
        .sort((a, b) => b.periode.end.compareTo(a.periode.end));
    return Container(
      color: CvColors.greyLight,
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: translations.text('views_etudes.my'),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_etudes.etudes'),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: CvSizes.px30),
          Wrap(
            spacing: CvSizes.px30,
            runSpacing: CvSizes.px30,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(
              _firestoreBloc.etudes.length,
              (index) {
                final Etude _etude = _firestoreBloc.etudes[index];
                return CustomCardEtudes(
                  periode:
                      '${_etude.periode.start.yMMM} - ${_etude.periode.end.yMMM}',
                  ecole: _etude.ecole.currentLang,
                  nom: _etude.diplome.currentLang,
                  description: _etude.description.currentLang,
                  widthCard: _widthCard,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
