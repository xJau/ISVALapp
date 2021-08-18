import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Routes/login.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';
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
              onTap: ()  {
                logout(context);
              })
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
  accountInstance.logout();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', '');
    Navigator.pop(context);
     Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => LoginRoute()));
    HapticFeedback.lightImpact();
  }

  String getUsername() {
    Customer currentCustomer = accountInstance.currentCustomer;
    return currentCustomer.name.toUpperCase();
  }
}
