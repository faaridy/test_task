import 'package:flutter/material.dart';
import 'package:test_task/data/models/local/user_response.dart';
import 'package:test_task/utilities/helpers/chace_helper.dart';

class UserProvider with ChangeNotifier {
  UserResponse _user = UserResponse(name: 'david', email: 'morrison', phone: '1-570-236-7033');

  UserResponse get user => _user;

  UserProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    UserResponse? cachedUser = await CacheHelper.getUser();
    if (cachedUser != null) {
      _user = cachedUser;
      notifyListeners();
    }
  }

  void saveUser(UserResponse user) {
    _user = user;
    CacheHelper.saveUser(user);
    notifyListeners();
  }

  void deleteUser() {
    CacheHelper.deleteUser();
    _user = UserResponse(name: '', email: '', phone: '');
    notifyListeners();
  }
}
