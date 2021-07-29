import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCardEtudes extends StatelessWidget {
  final double widthCard;
  final String periode;
  final String nom;
  final String description;
  final String ecole;

  const CustomCardEtudes({
    Key? key,
    required this.widthCard,
    required this.periode,
    required this.nom,
    required this.description,
    required this.ecole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: widthCard,
      padding: const EdgeInsets.only(
        top: defaultPadding30,
        left: defaultPadding30,
        bottom: defaultPadding30,
      ),
      decoration: const BoxDecoration(
        color: whiteColor,
        border: Border(
          right: BorderSide(
            color: orangeLightColor,
            width: 8,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding30 - 8),
            child: Text(
              periode,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          const SizedBox(height: defaultPadding30 / 2),
          const Divider(
            thickness: 8,
            color: orangeLightColor,
          ),
          const SizedBox(height: defaultPadding30),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding30 - 8),
            child: Text(
              nom,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          const SizedBox(height: defaultPadding30 / 2),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding30 - 8),
            child: Text(
              ecole,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: greyDarkColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding30 - 8),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                    color: greyDarkColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
