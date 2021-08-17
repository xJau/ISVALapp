import 'dart:convert';

import 'package:isval_test/Models/login_request_model.dart';
import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { notLoggedin, loggedIn }

class LoginInstance {
  bool signedIn = false;
  late User currentUser;
  static final LoginInstance _instance = LoginInstance._inizialize();

  factory LoginInstance() => _instance;

  LoginInstance._inizialize() {
    this.signedIn = false;
    this.currentUser = User.nullUser();
  }

  void loginU(User user) {
    currentUser = user;
    if (currentUser.role == 'Administrator' || currentUser.role == 'Customer')
      this.signedIn = true;
  }

  void saveUserInfos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(currentUser.toJson()));
    prefs.setBool('signedIn', true);
  }

  void login(LoginRequestModel model) async {
    ApiService.login(model).then((User user) {
      currentUser = user;
      if (currentUser.role == 'Administrator' ||
          currentUser.role == 'Customer') {
        saveUserInfos();
        this.signedIn = true;
      }
    });
  }

  void logout() {
    this.signedIn = true;
    this.currentUser = User.nullUser();
  }
}
