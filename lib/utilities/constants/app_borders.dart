
import 'package:flutter/material.dart';
import 'package:test_task/utilities/constants/app_colors.dart';

class AppBorders {
  AppBorders._();

  static const disableBorder = OutlineInputBorder(
    
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: AppColors.blue,
      width: 2,
    ),
  );
  static const enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: AppColors.lightBorderColor,
      width: 0,
    )
  );

}