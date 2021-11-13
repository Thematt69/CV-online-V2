import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/extensions/date_time_extension.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/widgets/custom_card_etudes.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

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
      return MediaQuery.of(context).size.width - 180;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  double get _widthCard {
    if (_widthMediaQuery - defaultPadding30 > 1290) {
      return (_widthMediaQuery - defaultPadding30 * 4) / 3;
    } else if (_widthMediaQuery - defaultPadding30 > 860) {
      return (_widthMediaQuery - defaultPadding30 * 3) / 2;
    } else {
      return _widthMediaQuery - defaultPadding30 * 2;
    }
  }

  @override
  void dispose() {
    _firestoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyLightColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding30 * 3,
      ),
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
          const SizedBox(height: defaultPadding30),
          Wrap(
            spacing: defaultPadding30,
            runSpacing: defaultPadding30,
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
