import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_english/utils/theme/widgeTheme/textTheme.dart';

@immutable
class AppColors {
  final white = const Color(0xffffffff);
  final black = const Color(0xFF000000);
  final red = const Color(0xFFFF0000);
  final primaryColor = const Color(0xFF222831); // e.g: app bar
  final onPrimaryColor = const Color(0xffffffff); // e.g: Text
  final secondaryColor = const Color(0xFF00ADB5); // e.g: Button
  final onSecondaryColor = const Color(0xFFEEEEEE);
  const AppColors();
}

class MyTheme {
  static const colors = AppColors();

  const MyTheme._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryTextTheme: GoogleFonts.robotoTextTheme(MyTextTheme.lightTextTheme),
    textTheme: GoogleFonts.robotoTextTheme(MyTextTheme.lightTextTheme),
    colorScheme: ColorScheme(
      primary: colors.primaryColor,
      //primaryContainer: colors.onPrimaryColor,
      onPrimary: colors.onPrimaryColor,
      secondary: colors.secondaryColor,
      onSecondary: colors.onSecondaryColor,
      brightness: Brightness.light,
      background: colors.black,
      error: colors.red,
      onBackground: colors.white,
      onError: colors.white,
      onSurface: colors.black,
      surface: colors.white,
    ),
    scaffoldBackgroundColor: colors.onSecondaryColor,
    //iconTheme: IconThemeData(color: colors.onSecondaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.secondaryColor,
        foregroundColor: colors.onSecondaryColor),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryTextTheme: MyTextTheme.lightTextTheme,
    textTheme: GoogleFonts.robotoTextTheme(MyTextTheme.lightTextTheme),
    colorScheme: ColorScheme(
      primary: colors.primaryColor,
      //primaryContainer: colors.onPrimaryColor,
      onPrimary: colors.onPrimaryColor,
      secondary: colors.secondaryColor,
      onSecondary: colors.onSecondaryColor,
      brightness: Brightness.light,
      background: colors.black,
      error: colors.red,
      onBackground: colors.white,
      onError: colors.white,
      onSurface: colors.black,
      surface: colors.white,
    ),
    scaffoldBackgroundColor: colors.onSecondaryColor,
    //iconTheme: IconThemeData(color: colors.onSecondaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.secondaryColor,
        foregroundColor: colors.onSecondaryColor),
  );
}
