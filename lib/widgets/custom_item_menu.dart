import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomItemMenu extends StatelessWidget {
  const CustomItemMenu({
    required this.onHover,
    required this.onTap,
    required this.hover,
    required this.title,
    Key? key,
  }) : super(key: key);

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
        width: 180 - (defaultPadding30 * 2),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height > 338
              ? defaultPadding10
              : defaultPadding6,
        ),
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
