import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomSharedIcon extends StatelessWidget {
  const CustomSharedIcon({
    Key? key,
    required this.onEnter,
    required this.onExit,
    required this.onPressed,
    required this.iconData,
    required this.hover,
    required this.title,
    this.size = 30,
  }) : super(key: key);

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
          icon: Icon(
            iconData,
            color: hover ? Theme.of(context).colorScheme.primary : blackColor,
          ),
          splashRadius: defaultSplashRadius,
          iconSize: defaultIconSize,
          tooltip: title,
          padding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
