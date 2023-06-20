import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import '../controllers/bloc_provider.dart';
import '../controllers/firestore_bloc.dart';
import '../responsive.dart';
import '../widgets/custom_card_recommandation_mobile.dart';
import '../widgets/custom_card_recommandation_web.dart';

class RecommandationSection extends StatefulWidget {
  const RecommandationSection({super.key});

  @override
  RecommandationSectionState createState() => RecommandationSectionState();
}

class RecommandationSectionState extends State<RecommandationSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  Widget build(BuildContext context) {
    if (_firestoreBloc.recommandations.isEmpty) {
      return const SizedBox();
    }
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
            width: 10,
          ),
        ),
        margin: CvSizes.hor40ver150,
        child: const Responsive(
          desktop: CustomCardRecommandationWeb(),
          tablet: CustomCardRecommandationMobile(),
          mobile: CustomCardRecommandationMobile(),
        ),
      ),
    );
  }
}
