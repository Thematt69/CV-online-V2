import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IconButtonDrawer extends StatefulWidget {
  const IconButtonDrawer({
    super.key,
    required this.isShowDrawer,
    required this.onShowDrawer,
  });
  final bool isShowDrawer;
  final void Function(bool isShowDrawer) onShowDrawer;

  @override
  State<IconButtonDrawer> createState() => _IconButtonDrawerState();
}

class _IconButtonDrawerState extends State<IconButtonDrawer>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _myAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 0,
    );

    _myAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: CvSizes.px30,
      left: widget.isShowDrawer ? 180 : 0,
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: CvColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onTap: () {
              if (widget.isShowDrawer) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
              widget.onShowDrawer(!widget.isShowDrawer);
            },
            child: Center(
              child: Tooltip(
                message: widget.isShowDrawer
                    ? tr('drawer_hideMenu')
                    : tr('drawer_showMenu'),
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: _myAnimation,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
