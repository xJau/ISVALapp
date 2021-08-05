import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/api_service.dart';

enum AuthStatus { notLoggedin, loggedIn }

class LoginInstance {
  AuthStatus authStatus = AuthStatus.notLoggedin;
  String authToken = '';
  late User currentUser;
  
  LoginInstance(this.authToken);

  factory LoginInstance.firstInstance() => LoginInstance('');

  void login(token){
    this.authToken = token;
    this.authStatus = AuthStatus.loggedIn;
    obtainUser();
  }
  
  void logout () {
    this.authToken = '';
    this.authStatus = AuthStatus.notLoggedin;
    this.currentUser.nullUser();
  }

  void obtainUser() async {
    currentUser = await ApiService.getUser(authToken);
  }
}
