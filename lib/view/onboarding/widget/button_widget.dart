import 'package:flutter/material.dart';
import 'package:tienext/res/extensions/media_query_extensions.dart';
import '../../../res/constants/colors.dart';
import '../../../res/constants/text_theme.dart';

Widget onBoardingBtn({
  required BuildContext context,
  required String text,
  required VoidCallback onTap,
  Color textColor = AppColors.white,
  Color color = AppColors.onBoardingBtnColor2,
  double? width,
  double? height,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width ?? context.fullWidth * 0.8,
      height: height ?? context.fullHeight * 0.06,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextTheme.bodyMedium.copyWith(color: textColor),
        ),
      ),
    ),
  );
}
