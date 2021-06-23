import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomItemMenu extends StatelessWidget {
  final void Function(bool)? onHover;
  final void Function()? onTap;
  final bool hover;
  final String title;

  const CustomItemMenu({
    required this.onHover,
    required this.onTap,
    required this.hover,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: onTap,
      child: Container(
        width: 180 - (defaultPadding * 2),
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 3),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color:
                    hover ? Theme.of(context).colorScheme.primary : blackColor,
              ),
        ),
      ),
    );
  }
}
