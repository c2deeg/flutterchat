import 'package:cle_app/util/config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      textTheme: GoogleFonts.oswaldTextTheme(ThemeData.light().textTheme),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Palette.red,
        secondary: Palette.teal,
        tertiary: Palette.grey,
        surface: Palette.red,
        background: Palette.grey,
        error: Colors.red,
        onPrimary: Palette.white,
        onSecondary: Palette.black,
        onTertiary: Palette.black,
        onSurface: Palette.white,
        onBackground: Palette.black,
        onError: Palette.white,
      ),
      useMaterial3: true);

  static final darkTheme = ThemeData(
      textTheme: GoogleFonts.oswaldTextTheme(ThemeData.dark().textTheme),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Palette.darkRed,
        secondary: Palette.redlight,
        tertiary: Palette.darkRed,
        surface: Palette.darkRed,
        background: Palette.darkGrey,
        error: Colors.red.shade300,
        onPrimary: Palette.white,
        onSecondary: Palette.black,
        onTertiary: Palette.white,
        onSurface: Palette.white,
        onBackground: Palette.white,
        onError: Palette.black,
      ),
      useMaterial3: true);
}
