import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBuilder {
  Widget showCircularShimmer(
      {double size = 100, Color baseColor = Colors.grey, Widget? child}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          height: size,
          width: size,
          color: baseColor,
          child: child ?? Container(),
        ),
      ),
    );
  }

  Widget showRectangularShimmer(
      {double height = 100,
      double width = 200,
      double radius = 6.0,
      Color baseColor = Colors.grey,
      Widget? child}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: Colors.white,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: baseColor),
        child: child ?? Container(),
      ),
    );
  }
}
