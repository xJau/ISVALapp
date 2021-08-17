import 'package:flutter/material.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.get('token') as String;
  if (token == null) token = '';
  LoginInstance accountActive = LoginInstance();
  if (token != '') accountActive.loginT(token);
  runApp(MaterialApp(
    initialRoute: accountActive.authStatus == AuthStatus.loggedIn
        ? RouteGenerator.dashboard
        : RouteGenerator.dashboard,
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
