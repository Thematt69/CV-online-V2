import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_style.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light(
    primary: orangeDarkColor,
    primaryVariant: orangeColor,
    onPrimary: whiteColor,
    secondary: darkLightColor,
    secondaryVariant: darkColor,
    onSecondary: whiteColor,
    error: redColor,
    onError: darkDarkerColor,
    surface: whiteColor,
    onSurface: darkDarkerColor,
    background: whiteColor,
    onBackground: darkDarkerColor,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: bodyText1,
    headline2: headline2,
    headline3: headline3,
    headline5: headline5,
    headline6: headline6,
    button: button,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith();
