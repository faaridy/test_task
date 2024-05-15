import 'package:flutter/material.dart';

import '../../utilities/constants/app_borders.dart';
import '../../utilities/constants/app_colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.text,
    required this.isObsecure,
    this.controller,
  });

  final String text;
  final bool isObsecure;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightBorderColor,
        border: AppBorders.enableBorder,
        enabledBorder: AppBorders.enableBorder,
        focusedBorder: AppBorders.disableBorder,
        errorBorder: AppBorders.enableBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: AppBorders.enableBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.red),
        ),
        hintText: text,
      ),
    );
  }
}
