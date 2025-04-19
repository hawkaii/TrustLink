import 'package:flutter/material.dart';
import 'package:trustlink/res/extensions/outline_boader_extensions.dart';
import '../constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black54),
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.lightWhite,
      focusColor: Colors.black,
      border: const OutlineInputBorder().textFieldBorder,
      enabledBorder: const OutlineInputBorder().textFieldEnableBorder,
      focusedBorder: const OutlineInputBorder().textFieldFocusBorder),
);
