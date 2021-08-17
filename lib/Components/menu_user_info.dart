import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuUserInfo extends StatelessWidget {
  LoginInstance accountInstance = LoginInstance();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Text("MINDGEAR SRL",
              style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
          Text(getUsername(), style: TextStyle(fontSize: 15)),
          SizedBox(height: 10),
          InkWell(
              child: Text("LOGOUT", style: TextStyle(fontSize: 15)),
              onTap: () async {
                accountInstance.logout();
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString('token', '');
                Navigator.of(context).pushNamed(RouteGenerator.login);
                HapticFeedback.lightImpact();
              })
        ],
      ),
    );
  }

  String getUsername() {
    User currentUser = accountInstance.currentUser;
    return currentUser.username.toUpperCase();
  }
}
