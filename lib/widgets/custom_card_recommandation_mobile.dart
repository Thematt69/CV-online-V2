import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/models/recommandation.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:flutter/material.dart';

class CustomCardRecommandationMobile extends StatefulWidget {
  const CustomCardRecommandationMobile({super.key});

  @override
  State<CustomCardRecommandationMobile> createState() =>
      _CustomCardRecommandationMobileState();
}

class _CustomCardRecommandationMobileState
    extends State<CustomCardRecommandationMobile> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    final Recommandation recommandation = _firestoreBloc.recommandations.first;

    return Padding(
      padding: CvSizes.all30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            recommandation.texte.currentLang(context),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: 0,
                  height: 1.6,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          const SizedBox(height: CvSizes.px30),
          SelectableText(
            recommandation.auteur.currentLang(context),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
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
                      recommandation.poste.currentLang(context),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 18,
                          ),
                    ),
                    SelectableText(
                      recommandation.entreprise.currentLang(context),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
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
          ),
        ],
      ),
    );
  }
}
