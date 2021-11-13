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
      padding: const EdgeInsets.only(
        left: defaultPadding60,
        right: defaultPadding150,
        top: defaultPadding60,
        bottom: defaultPadding60,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            assetDoubleQuote,
            width: 60,
            cacheWidth: 60,
            frameBuilder: (_, child, __, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return const SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return child;
            },
            errorBuilder: (_, __, ___) => const SizedBox(width: 60),
          ),
          const SizedBox(width: defaultPadding30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommandation.texte.currentLang,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        letterSpacing: 0,
                        height: 1.6,
                        fontWeight: FontWeight.w300,
                        color: whiteDarkerColor,
                      ),
                ),
                const SizedBox(height: defaultPadding30),
                Text(
                  recommandation.auteur.currentLang,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: greyColor,
                      ),
                ),
                const SizedBox(height: defaultPadding6),
                Text(
                  recommandation.poste.currentLang,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: orangeColor,
                        fontSize: 18,
                      ),
                ),
                Text(
                  recommandation.entreprise.currentLang,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: orangeColor,
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
