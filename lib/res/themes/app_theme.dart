import 'package:flutter/material.dart';
import 'package:tienext/res/extensions/text_style_extensions.dart';
import '../constants/colors.dart';


class AppTheme {
  ThemeData getAppTheme() => ThemeData(
      primaryColor: AppColors.orange400,
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _buttonThemeData(),
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      dialogTheme: _dialogTheme());

  AppBarTheme _appBarTheme() =>
       AppBarTheme(backgroundColor: AppColors.orange400,titleTextStyle: const TextStyle().whiteTitleTextStyle);

  ElevatedButtonThemeData _buttonThemeData() => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange300,
      ));

  DialogTheme _dialogTheme() =>
      DialogTheme(contentTextStyle: const TextStyle().primaryTextStyle);

  get _floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData(backgroundColor: AppColors.orange300);
}
