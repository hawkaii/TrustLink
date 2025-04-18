import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/constants/colors.dart';

class AppIcons extends StatelessWidget {
  const AppIcons({
    super.key,
    required this.imagePath,
    this.showBorder = true,
    this.size = 24.0,
  });

  final String imagePath;
  final bool showBorder;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 17,
      width: size + 17,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: showBorder
            ? Border.all(
          width: 1,
        )
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child:SvgPicture.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ).paddingSymmetric(horizontal: 8);
  }
}