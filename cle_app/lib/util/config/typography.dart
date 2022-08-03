import 'package:flutter/material.dart';

class AppText {
  AppText._();

  static TextStyle? displayLarge(context) =>
      Theme.of(context).textTheme.displayLarge;
  static TextStyle? displayMedium(context) =>
      Theme.of(context).textTheme.displayMedium;
  static TextStyle? displaySmall(context) =>
      Theme.of(context).textTheme.displaySmall;
  static TextStyle? headlineLarge(context) =>
      Theme.of(context).textTheme.headlineLarge;
  static TextStyle? headlineMedium(context) =>
      Theme.of(context).textTheme.headlineMedium;
  static TextStyle? headlineSmall(context) =>
      Theme.of(context).textTheme.headlineSmall;
  static TextStyle? labelLarge(context) =>
      Theme.of(context).textTheme.labelLarge;
  static TextStyle? labelMedium(context) =>
      Theme.of(context).textTheme.labelMedium;
  static TextStyle? labelSmall(context) =>
      Theme.of(context).textTheme.labelSmall;
  static TextStyle? bodyLarge(context) => Theme.of(context).textTheme.bodyLarge;
  static TextStyle? bodyMedium(context) =>
      Theme.of(context).textTheme.bodyMedium;
  static TextStyle? bodySmall(context) => Theme.of(context).textTheme.bodySmall;
}
