import 'package:test_task/data/models/remote/login_response.dart';
abstract class LoginContract {
  Future<LoginResponse> login(String username, String password);
}