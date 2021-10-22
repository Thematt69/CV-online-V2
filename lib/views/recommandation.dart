import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/widgets/custom_card_recommandation_mobile.dart';
import 'package:cv_online_v2/widgets/custom_card_recommandation_web.dart';
import 'package:flutter/material.dart';

class RecommandationSection extends StatefulWidget {
  const RecommandationSection({
    Key? key,
  }) : super(key: key);

  @override
  _RecommandationSectionState createState() => _RecommandationSectionState();
}

class _RecommandationSectionState extends State<RecommandationSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkLightColor,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: whiteDarkerColor.withOpacity(0.2),
            width: 10,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding40,
          vertical: defaultPadding150,
        ),
        child: const Responsive(
          desktop: CustomCardRecommandationWeb(),
          tablet: CustomCardRecommandationMobile(),
          mobile: CustomCardRecommandationMobile(),
        ),
      ),
    );
  }
}
