import 'package:flutter/material.dart';
import 'package:test_task/utilities/extensions/material_state_properity_all.dart';

import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_text_styles.dart';

class LoginBtn extends StatelessWidget {

  const LoginBtn({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;
 
   @override
   Widget build(BuildContext context) {
       return SizedBox(
        width: 120,
        height: 55,
         child: ElevatedButton(
            onPressed: onPressed,style: ButtonStyle(
              backgroundColor: AppColors.blue.mspAll,
              foregroundColor: AppColors.white.mspAll,
              elevation: 10.0.mspAll,
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              )
            ),
            child: const Text("Login",style: AppTextStyles.buttonTextStyle,)
            ),
       );
  }
}
