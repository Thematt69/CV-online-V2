import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_style.dart';

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
      bodyLarge: CvTextStyle.bodyText1,
      displayLarge: CvTextStyle.headline1,
      displayMedium: CvTextStyle.headline2,
      displaySmall: CvTextStyle.headline3,
      headlineSmall: CvTextStyle.headline5,
      titleLarge: CvTextStyle.headline6,
      labelLarge: CvTextStyle.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(24),
        ),
      ),
    ),
    scrollbarTheme: const ScrollbarThemeData(
      thumbVisibility: MaterialStatePropertyAll(true),
    ),
  );
}
