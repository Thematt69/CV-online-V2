// ignore_for_file: avoid_positional_boolean_parameters

import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomItemMenu extends StatelessWidget {

  const CustomItemMenu({
    required this.onHover,
    required this.onTap,
    required this.hover,
    required this.title,
    super.key,
  });
  final void Function(bool value)? onHover;
  final void Function()? onTap;
  final bool hover;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: onTap,
      child: Container(
        width: CvSizes.px120,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height > CvSizes.px338
              ? CvSizes.px10
              : CvSizes.px6,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: hover
                    ? Theme.of(context).colorScheme.primary
                    : CvColors.black,
              ),
        ),
      ),
    );
  }
}
