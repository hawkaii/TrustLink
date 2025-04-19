import 'package:flutter/material.dart';
import 'package:trustlink/res/extensions/outline_boader_extensions.dart';
import '../constants/colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightWhite,
      focusColor: Colors.white,
      border: const OutlineInputBorder().textFieldBorder,
      enabledBorder: const OutlineInputBorder().textFieldEnableBorder,
      focusedBorder: const OutlineInputBorder().textFieldFocusBorder),
);
