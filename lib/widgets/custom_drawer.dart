import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final bool isShowDrawer;
  final ScrollController scrollController;

  const CustomDrawer({
    required this.scrollController,
    required this.isShowDrawer,
    Key? key,
  }) : super(key: key);

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
            horizontal: defaultPadding30,
            vertical: MediaQuery.of(context).size.height > 390
                ? defaultPadding30
                : defaultPadding10,
          ),
          color: whiteColor,
          child: CustomMenu(scrollController: scrollController),
        ),
      ),
    );
  }
}
