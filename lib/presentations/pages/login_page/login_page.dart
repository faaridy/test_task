import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/cubits/login/login_cubit.dart';
import 'package:test_task/presentations/pages/login_page/widgets/login_btn.dart';
import 'package:test_task/utilities/constants/app_border_radius.dart';
import 'package:test_task/utilities/constants/app_colors.dart';
import 'package:test_task/utilities/constants/app_paddings.dart';
import 'package:test_task/utilities/constants/app_text_styles.dart';
import 'package:test_task/utilities/extensions/navigation_extension.dart';
import 'package:test_task/utilities/extensions/sizedbox_extension.dart';
import 'package:test_task/utilities/helpers/pager.dart';

import '../../widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: AppTextStyles.welcomePageBlueStyle,
        ),
      ),
      body: Padding(
        padding: AppPaddings.a30,
        child: Column(
          children: [
            Column(children: [
              50.h,
              CustomInput(
                text: "Username",
                isObsecure: false,
                controller: loginCubit.controllers['username'],
              ),
              25.h,
              CustomInput(
                text: "Password",
                isObsecure: true,
                controller: loginCubit.controllers['password'],
              ),
              30.h,
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) async {
                  if (state is LoginLoading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoginSuccess) {
                    context.removeAll(Pager.home);
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.red,
                        margin: AppPaddings.a30,
                        shape: RoundedRectangleBorder(
                            borderRadius: AppBorderRadius.a10),
                        behavior: SnackBarBehavior.floating,
                        content: Text('Error occured while trying to login'),
                      ),
                    );
                  }
                },
                child: LoginBtn(
                  onPressed: () => loginCubit.login(),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
