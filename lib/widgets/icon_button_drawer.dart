// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class IconButtonDrawer extends StatefulWidget {
  final bool isShowDrawer;
  final void Function(bool isShowDrawer) onShowDrawer;

  const IconButtonDrawer({
    super.key,
    required this.isShowDrawer,
    required this.onShowDrawer,
  });

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
                    ? AppLocalizations.of(context)!.drawer_hideMenu
                    : AppLocalizations.of(context)!.drawer_showMenu,
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
