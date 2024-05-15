
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/cubits/cubit/products_cubit.dart';
import 'package:test_task/cubits/login/login_cubit.dart';
import 'package:test_task/presentations/pages/home_page/home_page.dart';
import 'package:test_task/presentations/pages/login_page/login_page.dart';
import 'package:test_task/utilities/di/locator.dart';

class Pager {
  Pager._();

  static Widget get login => BlocProvider(
    create: (context) => LoginCubit(locator()),
    child: const LoginPage(),
  );

   static Widget get home => BlocProvider(
    create: (context) => ProductsCubit(locator())..getProducts(),
    child: const HomePage(),
  );
}