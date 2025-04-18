import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WidgetExtension on Widget {
  /// Navigate to a new screen with replacement using GetX
  void pushWithReplacement({required BuildContext context}) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => this));

  /// Navigate to a new screen using GetX
  void pushWithWidget({required BuildContext context}) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => this));

  /// Navigate and remove all previous routes using GetX
  void pushWithRemoveUntil({required BuildContext context}) =>
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => this),(route) => false,);

  /// Navigate to a new screen using GetX
  void getPush() => Get.to(() => this);


  /// Navigate to a new screen with replacement using GetX
  void getPushReplacement() => Get.off(() => this);

  /// Navigate and remove all previous screens using GetX
  void getPushAndRemoveUntil() => Get.offAll(() => this);

  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// Center widget
  Center center() => Center(
        child: this,
      );

  Align align({AlignmentGeometry alignment = Alignment.center}) => Align(
        alignment: alignment,
        child: this,
      );

  /// Return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// Return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// Return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// Return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// Return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  InkWell onTap(void Function()? fun) => InkWell(
        onTap: fun,
        child: this,
      );

  Expanded expanded() => Expanded(child: this);

  Flexible flexible() => Flexible(child: this);

  /// Return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// Return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}
