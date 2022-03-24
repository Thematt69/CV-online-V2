import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCardEtudes extends StatefulWidget {
  const CustomCardEtudes({
    Key? key,
    required this.widthCard,
    required this.periode,
    required this.nom,
    required this.description,
    required this.ecole,
  }) : super(key: key);

  final String description;
  final String ecole;
  final String nom;
  final String periode;
  final double widthCard;

  @override
  _CustomCardEtudesState createState() => _CustomCardEtudesState();
}

class _CustomCardEtudesState extends State<CustomCardEtudes> {
  final ValueNotifier<bool> _hover = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _hover.value = true,
      onExit: (event) => _hover.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _hover,
        builder: (context, hover, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.widthCard,
          padding: CvSizes.top30Left30Bottom30,
          decoration: BoxDecoration(
            color: CvColors.white,
            border: const Border(
              right: BorderSide(
                color: CvColors.orangeLight,
                width: 8,
              ),
            ),
            boxShadow: hover
                ? [
                    BoxShadow(
                      blurRadius: 30,
                      color: Theme.of(context).shadowColor.withOpacity(0.1),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: CvSizes.right22,
                child: Text(
                  widget.periode,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(height: CvSizes.px15),
              const Divider(
                thickness: 8,
                color: CvColors.orangeLight,
              ),
              const SizedBox(height: CvSizes.px30),
              Padding(
                padding: CvSizes.right22,
                child: Text(
                  widget.nom,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              const SizedBox(height: CvSizes.px15),
              Padding(
                padding: CvSizes.right22,
                child: Text(
                  widget.ecole,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: CvColors.greyDark,
                      ),
                ),
              ),
              Padding(
                padding: CvSizes.right22,
                child: Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                        color: CvColors.greyDark,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
