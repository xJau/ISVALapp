import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool signedIn = prefs.getBool('signedIn') as bool;

  runApp(MaterialApp(
      initialRoute: initialRoute(signedIn),
      onGenerateRoute: RouteGenerator.generateRoute));
}

String initialRoute(bool signedIn) {
  if (signedIn == null) return RouteGenerator.starting;
  if (signedIn) {
    signIn();
    return RouteGenerator.dashboard;
  } else
    return RouteGenerator.login;
}

void signIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userString = prefs.getString('user') as String;
  var userMap = json.decode(userString);
  User currentUser = User.fromJson(userMap);
  LoginInstance accountActive = LoginInstance();
  accountActive.loginU(currentUser);
}
