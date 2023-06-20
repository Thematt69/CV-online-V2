import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import 'custom_menu.dart';

class CustomDrawer extends StatelessWidget {
  final bool isShowDrawer;
  final ScrollController scrollController;

  const CustomDrawer({
    required this.scrollController,
    required this.isShowDrawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: isShowDrawer ? 0 : -180,
      top: 0,
      bottom: 0,
      width: 180,
      child: Material(
        elevation: 20,
        child: Container(
          width: 180,
          padding: EdgeInsets.symmetric(
            horizontal: CvSizes.px30,
            vertical: MediaQuery.of(context).size.height > CvSizes.px390
                ? CvSizes.px30
                : CvSizes.px10,
          ),
          color: CvColors.white,
          child: CustomMenu(scrollController: scrollController),
        ),
      ),
    );
  }
}
