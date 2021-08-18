import 'dart:convert';

import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Models/login_request_model.dart';
import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { notLoggedin, loggedIn }

class LoginInstance {
  bool signedIn = false;
  late User currentUser;
  late Customer currentCustomer;
  static final LoginInstance _instance = LoginInstance._inizialize();
 


  factory LoginInstance() => _instance;

  LoginInstance._inizialize() {
    this.signedIn = false;
    this.currentUser = User.nullUser();
  }

  void login(LoginRequestModel model) async {
    ApiService.login(model).then((User user) {
      currentUser = user;
      if (currentUser.role == 'Administrator' ||
          currentUser.role == 'Customer') {
        selectCustomer(0);
        saveUserInfos();
        this.signedIn = true;
      }
    });
  }

  void loginU(User user) {
    currentUser = user;
    if (currentUser.role == 'Administrator' || currentUser.role == 'Customer') {
      selectCustomer(0);
      this.signedIn = true;
    }
  }

  void saveUserInfos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(currentUser.toJson()));
    prefs.setBool('signedIn', true);
  }

  void removeUserInfos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.setBool('signedIn', false);
  }


  void selectCustomer(int i) {
     int magicNumber = currentUser.customers.length - 10;
    currentCustomer = currentUser.customers[magicNumber];
    
  }

  void logout() async {
    this.signedIn = false;
    this.currentUser = User.nullUser();
    removeUserInfos();
  }
}
