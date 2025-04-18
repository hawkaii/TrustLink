import 'package:flutter/material.dart';
import '../constants/colors.dart';

extension TextStyleExtensions on TextStyle?{
  TextStyle get whiteTextStyle => const TextStyle(color: AppColors.white,fontSize: 14.0);
  TextStyle get whiteTitleTextStyle => const TextStyle(color: AppColors.white,fontSize: 20.0,fontWeight: FontWeight.w500,letterSpacing: 1);
  TextStyle get blackTextStyle => const TextStyle(color: AppColors.black,fontSize: 14.0);
  TextStyle get primaryTextStyle => const TextStyle(color: AppColors.black,fontSize: 14.0);
}