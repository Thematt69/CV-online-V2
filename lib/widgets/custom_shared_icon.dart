import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class CustomSharedIcon extends StatelessWidget {
  const CustomSharedIcon({
    super.key,
    required this.onEnter,
    required this.onExit,
    required this.onPressed,
    required this.iconData,
    required this.hover,
    required this.title,
    this.size = 30,
  });

  final void Function(PointerEnterEvent event)? onEnter;
  final void Function(PointerExitEvent event)? onExit;
  final void Function()? onPressed;
  final bool hover;
  final IconData iconData;
  final double size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: IconButton(
          onPressed: onPressed,
          icon: FaIcon(
            iconData,
            color:
                hover ? Theme.of(context).colorScheme.primary : CvColors.black,
          ),
          splashRadius: CvSizes.defaultSplashRadius,
          iconSize: CvSizes.defaultIconSize,
          tooltip: title,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
