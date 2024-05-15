import 'package:flutter/material.dart';
import 'package:test_task/utilities/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const _w600s20White = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.white,
    fontFamily: 'Poppins',
  );

  static const _w600s35Blue = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 35,
    color: AppColors.blue,
    fontFamily: 'Poppins',
  );

  static const welcomePageBlueStyle = _w600s35Blue;

  static const buttonTextStyle = _w600s20White;
}
