import 'package:test_task/dio/client_dio.dart';
import 'package:test_task/utilities/constants/endpoints.dart';

import '../../models/remote/login_response.dart';

class LoginServices {
  Future<LoginResponse> login(String username, String password) async {
    const endpoint = Endpoints.login;
    final requestBody = {
      "username": username,
      "password": password,
    };

    final response = await dio.post(endpoint, data: requestBody);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    }
    throw Exception();
  }
}
