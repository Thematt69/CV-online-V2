import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget desktop;
  final Widget mobile;
  final Widget tablet;

  /// Si la largeur est inférieur à 425
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 425;

  /// Si la largeur est supérieur à 425 mais inférieur à 1024
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
      MediaQuery.of(context).size.width >= 425;

  /// Si la largeur est supérieur à 1024
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1024;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
