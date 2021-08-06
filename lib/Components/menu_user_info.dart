import 'package:flutter/material.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("MINDGEAR SRL",
            style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
        Text("Alessandro Placidi", style: TextStyle(fontSize: 15)),
        SizedBox(height: 10),
        InkWell(
            child: Text("LOGOUT", style: TextStyle(fontSize: 15)),
            onTap: () async{
              LoginInstance accountInstance = LoginInstance();
              accountInstance.logout();
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('token', '');
                Navigator.of(context).pushNamed(RouteGenerator.login);})
      ],
    );
  }
}
