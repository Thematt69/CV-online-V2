import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../controllers/bloc_provider.dart';
import '../controllers/firestore_bloc.dart';
import '../models/recommandation.dart';

class CustomCardRecommandationWeb extends StatefulWidget {
  const CustomCardRecommandationWeb({super.key});

  @override
  State<CustomCardRecommandationWeb> createState() =>
      _CustomCardRecommandationWebState();
}

class _CustomCardRecommandationWebState
    extends State<CustomCardRecommandationWeb> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    final Recommandation recommandation = _firestoreBloc.recommandations.first;
    return Padding(
      padding: CvSizes.left60Top60Bottom60Right150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            CvAssets.doubleQuote,
            width: 60,
            errorBuilder: (_, __, ___) => const SizedBox(width: 60),
          ),
          const SizedBox(width: CvSizes.px30),
          Expanded(
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
                SelectableText(
                  recommandation.poste.currentLang(context),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 18,
                      ),
                ),
                SelectableText(
                  recommandation.entreprise.currentLang(context),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
