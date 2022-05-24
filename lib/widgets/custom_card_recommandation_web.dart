import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/models/recommandation.dart';
import 'package:flutter/material.dart';

class CustomCardRecommandationWeb extends StatefulWidget {
  const CustomCardRecommandationWeb({
    Key? key,
  }) : super(key: key);

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
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        letterSpacing: 0,
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
                const SizedBox(height: CvSizes.px30),
                SelectableText(
                  recommandation.auteur.currentLang(context),
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: CvColors.grey,
                      ),
                ),
                const SizedBox(height: CvSizes.px6),
                SelectableText(
                  recommandation.poste.currentLang(context),
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        fontSize: 18,
                      ),
                ),
                SelectableText(
                  recommandation.entreprise.currentLang(context),
                  style: Theme.of(context).textTheme.headline5?.copyWith(
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
