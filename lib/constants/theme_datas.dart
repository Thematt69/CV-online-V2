import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_style.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  
  colorScheme: ColorScheme.light(
    primary: orangeDarkColor,
    primaryVariant: orangeColor,
    onPrimary: whiteDarkerColor,
    secondary: darkLightColor,
    secondaryVariant: darkColor,
    onSecondary: whiteDarkerColor,
    error: redColor,
    onError: blackColor,
    surface: whiteDarkerColor,
    onSurface: blackColor,
    background: whiteDarkerColor,
    onBackground: blackColor,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: bodyText1,
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline5: headline5,
    headline6: headline6,
    button: button,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith();