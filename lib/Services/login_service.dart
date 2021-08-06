import 'package:isval_test/Models/login_request_model.dart';
import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { notLoggedin, loggedIn }

class LoginInstance {
  AuthStatus authStatus = AuthStatus.notLoggedin;
  String authToken = "";
  late User currentUser;
  static final LoginInstance _instance = LoginInstance._inizialize();

  factory LoginInstance() => _instance;

  LoginInstance._inizialize() {
    authStatus = AuthStatus.notLoggedin;
    this.currentUser = User.nullUser();
  }

  void loginT(String token) async {
    this.authToken = token;
    this.authStatus = AuthStatus.loggedIn;
    obtainUser();
  }

  void login(LoginRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();    
    ApiService.login(model).then((String token) {
      this.authStatus = AuthStatus.loggedIn;
      this.authToken = token;
      obtainUser();
      prefs.setString('token', token);
    });
    this.authStatus = AuthStatus.loggedIn;
  }

  void logout() {
    this.authToken = '';
    this.authStatus = AuthStatus.notLoggedin;
    this.currentUser = User.nullUser();
  }

  void obtainUser() async {
    ApiService.getUser(authToken).then((value) => this.currentUser = value);
  }
}
