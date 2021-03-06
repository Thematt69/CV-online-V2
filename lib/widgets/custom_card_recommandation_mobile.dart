import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/models/recommandation.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:flutter/material.dart';

class CustomCardRecommandationMobile extends StatefulWidget {
  const CustomCardRecommandationMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCardRecommandationMobile> createState() =>
      _CustomCardRecommandationMobileState();
}

class _CustomCardRecommandationMobileState
    extends State<CustomCardRecommandationMobile> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    final Recommandation _recommandation = _firestoreBloc.recommandations.first;
    return Padding(
      padding: CvSizes.all30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            _recommandation.texte.currentLang,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  letterSpacing: 0,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          const SizedBox(height: CvSizes.px30),
          SelectableText(
            _recommandation.auteur.currentLang,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: CvColors.grey,
                ),
          ),
          const SizedBox(height: CvSizes.px6),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      _recommandation.poste.currentLang,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 18,
                          ),
                    ),
                    SelectableText(
                      _recommandation.entreprise.currentLang,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: Responsive.isTablet(context),
                child: Image.asset(
                  CvAssets.doubleQuote,
                  width: 60,
                  errorBuilder: (_, __, ___) => const SizedBox(width: 60),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
