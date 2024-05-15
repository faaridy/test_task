import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_task/data/models/local/user_response.dart';

class CacheHelper {

  static Future<void> saveUser(UserResponse user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  static Future<UserResponse?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      return UserResponse.fromJson(jsonDecode(userData));
    }
    return null;
  }
  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}