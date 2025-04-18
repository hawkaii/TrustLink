import 'package:flutter/material.dart';

extension OutlineBorderExtensions on OutlineInputBorder {
  static double? borderRadius;

  set setRadius(double radius) {
    borderRadius = radius;
  }

  double get getRadius => borderRadius ?? 10.0;

  static Color? borderColor;

  set setBorderColor(Color color) {
    borderColor = color;
  }

  static double? borderWidth;

  set setBorderWidth(double width) {
    borderWidth = width;
  }

  double get getBorderWidth => borderWidth ?? 1.0;

  Color get getBorderColor => borderColor ?? Colors.grey;

  OutlineInputBorder get textFieldBorder =>
      OutlineInputBorder(borderRadius: _radius(), borderSide: _side());

  OutlineInputBorder get textFieldEnableBorder => OutlineInputBorder(
        borderRadius: _radius(),
        borderSide: _side(),
      );

  OutlineInputBorder get textFieldFocusBorder=> OutlineInputBorder(
        borderRadius: _radius(),
        borderSide: _side(),
      );

  OutlineInputBorder get textFieldErrorBorder=> OutlineInputBorder(
        borderRadius: _radius(),
        borderSide: _side(),
      );

  OutlineInputBorder get textFieldDisableBorder => OutlineInputBorder(
        borderRadius: _radius(),
        borderSide: _side(),
      );

  BorderRadius _radius() => BorderRadius.all(Radius.circular(getRadius));

  BorderSide _side() =>
      BorderSide(width: getBorderWidth, color: getBorderColor);
}
