import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/contracts/login_contract.dart';
import 'package:test_task/data/services/local/hive_local_service.dart';
import 'package:test_task/utilities/di/locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginContract) : super(LoginInitial());

  final LoginContract _loginContract;

  late final controllers = {
    'username': TextEditingController(),
    'password': TextEditingController(),
  };

  void login() async {
    try {
      emit(LoginLoading());
      await _loginContract.login(
          controllers['username']!.text, 
          controllers['password']!.text);
      saveState();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  void saveState() async {
    final hive = locator<HiveLocalService>(); 
    await hive.saveState();
  }
}
