import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  const CustomDrawer({
    required this.scrollController,
    required this.isShowDrawer,
    super.key,
  });
  final bool isShowDrawer;
  final ScrollController scrollController;

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
