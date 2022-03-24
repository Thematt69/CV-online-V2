import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/text_style.dart';
import 'package:flutter/material.dart';

mixin CvThemeDatas {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: CvColors.orangeDark,
      onPrimary: CvColors.whiteDarker,
      primaryContainer: CvColors.orange,
      onPrimaryContainer: CvColors.white,
      secondary: CvColors.darkLight,
      onSecondary: CvColors.whiteDarker,
      secondaryContainer: CvColors.dark,
      onSecondaryContainer: CvColors.white,
      error: CvColors.red,
      onError: CvColors.black,
      surface: CvColors.whiteDarker,
      background: CvColors.whiteDarker,
    ),
    cardTheme: const CardTheme(
      shape: RoundedRectangleBorder(),
    ),
    textTheme: const TextTheme(
      bodyText1: CvTextStyle.bodyText1,
      headline1: CvTextStyle.headline1,
      headline2: CvTextStyle.headline2,
      headline3: CvTextStyle.headline3,
      headline5: CvTextStyle.headline5,
      headline6: CvTextStyle.headline6,
      button: CvTextStyle.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(24),
        ),
      ),
    ),
    scrollbarTheme: const ScrollbarThemeData(
      interactive: true,
      showTrackOnHover: true,
    ),
  );
}
