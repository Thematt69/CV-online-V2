import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/text_style.dart';
import 'package:flutter/material.dart';

mixin CvThemeDatas {
  static final ThemeData lightTheme = ThemeData.light(
    useMaterial3: false,
  ).copyWith(
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
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(24),
        ),
      ),
    ),
    scrollbarTheme: const ScrollbarThemeData(
      thumbVisibility: WidgetStatePropertyAll(true),
    ),
  );
}
