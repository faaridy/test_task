import 'package:test_task/data/contracts/login_contract.dart';
import 'package:test_task/data/models/remote/login_response.dart';
import 'package:test_task/data/services/remote/login_services.dart';

class LoginRepository implements LoginContract {
  LoginRepository(this._loginServices);

  final LoginServices _loginServices;

  @override
  Future<LoginResponse> login(String username, String password) =>
      _loginServices.login(username, password);
}
