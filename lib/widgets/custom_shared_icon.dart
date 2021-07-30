import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomSharedIcon extends StatelessWidget {
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function()? onPressed;
  final IconData iconData;
  final bool hover;
  final String title;
  final double size;

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
