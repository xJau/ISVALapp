import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool signedIn = await signIn();

  runApp(MaterialApp(
      initialRoute: signedIn ? RouteGenerator.dashboard : RouteGenerator.login,
      onGenerateRoute: RouteGenerator.generateRoute));
}

Future<bool> signIn() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool signedIn = prefs.getBool('signedIn') as bool;
  if (signedIn == null)
    signedIn = false;
  else {
    String userString = prefs.getString('user') as String;
    var userMap = json.decode(userString);
    User currentUser = User.fromJson(userMap);
    LoginInstance accountActive = LoginInstance();
    accountActive.loginU(currentUser);
  }
  return signedIn;
}
