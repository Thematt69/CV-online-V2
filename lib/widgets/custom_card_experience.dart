import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCardExperience extends StatelessWidget {
  final double widthCard;
  final String periode;
  final String poste;
  final String type;
  final String lieu;
  final String? service;
  final String? description;

  const CustomCardExperience({
    Key? key,
    required this.widthCard,
    required this.periode,
    required this.poste,
    required this.type,
    required this.lieu,
    this.service,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: widthCard,
      padding: const EdgeInsets.only(
        top: defaultPadding,
        left: defaultPadding,
        bottom: defaultPadding,
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
            padding: const EdgeInsets.only(right: defaultPadding - 8),
            child: Text(
              periode,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          const Divider(
            thickness: 8,
            color: orangeLightColor,
          ),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding - 8),
            child: RichText(
              text: TextSpan(
                text: poste,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' - $type',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding - 8),
            child: Text(
              lieu,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: greyColor,
                  ),
            ),
          ),
          if (service != null)
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding - 8),
              child: Text(
                service!,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: greyColor,
                    ),
              ),
            ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding - 8),
              child: Text(
                description!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      color: greyColor,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
