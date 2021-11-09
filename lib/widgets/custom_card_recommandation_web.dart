import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
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
  final Stream<QuerySnapshot<Map<String, dynamic>>> _recommandationsStream =
      FirebaseFirestore.instance.collection('recommandations').snapshots();

  @override
  Widget build(BuildContext context) {
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
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 60,
            ),
          ),
          const SizedBox(width: defaultPadding30),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _recommandationsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                  debugPrintStack(stackTrace: snapshot.stackTrace);
                  return Text(
                    'Erreur lors de la récupération de la recommandation',
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
                        'Récupération de la recommandation en cours...',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                    ],
                  );
                }

                final List<Recommandation> listRecommandations =
                    snapshot.data!.docs
                        .map(
                          (document) =>
                              Recommandation.fromFireStore(document.data()),
                        )
                        .toList();

                final Recommandation recommandation = listRecommandations.first;
                return Column(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
