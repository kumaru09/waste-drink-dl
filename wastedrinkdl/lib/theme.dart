import 'package:flutter/material.dart';

//color
const Color primaryColor = Color(0xFF544B3D);
const Color secondaryColor = Color(0xFF7EBC89);
const Color secondaryLight = Color(0xFFC1DBB3);
const Color errorColor = Color(0xFFFF0000);
const Color whiteColor = Colors.white;

//color scheme
const ColorScheme _appColorScheme = ColorScheme(
  primary: primaryColor,
  primaryVariant: primaryColor,
  secondary: secondaryColor,
  secondaryVariant: secondaryLight,
  surface: whiteColor,
  background: whiteColor,
  error: errorColor,
  onPrimary: whiteColor,
  onSecondary: whiteColor,
  onSurface: secondaryColor,
  onBackground: secondaryColor,
  onError: whiteColor,
  brightness: Brightness.light,
);

//text theme
const TextTheme textTheme = TextTheme(
  headline6: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
  subtitle1: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
  overline: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
);

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      // Define text theme
      fontFamily: "Quicksand",
      textTheme: textTheme,

      //define the default brightness and color
      colorScheme: _appColorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: whiteColor,
      cardColor: whiteColor,
      errorColor: errorColor,
      indicatorColor: whiteColor,
      buttonTheme: const ButtonThemeData(
        colorScheme: _appColorScheme,
      ),
    );
  }
}