import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Models/login_request_model.dart';
import 'package:isval_test/Routes/dashboard.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute();
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = false;
  LoginInstance accountInstance = LoginInstance();

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Username',
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 16,
                fontFamily: 'Quicksand'),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff0a7bc0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40)),
          child: TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                hintText: 'Username',
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Password',
            style: TextStyle(
                color: Color(0xff444444),
                fontSize: 16,
                fontFamily: 'Quicksand'),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colorpalette.AZZURRO_ISVAL,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40)),
          child: TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !this._showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              hintStyle: TextStyle(fontSize: 12),
              border: InputBorder.none,
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 10, top: 5),
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this._showPassword
                      ? Colorpalette.AZZURRO_ISVAL
                      : Color(0x459E9E9E),
                ),
                onPressed: () {
                  setState(() => this._showPassword = !this._showPassword);
                },
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _requestSession();
          },
          child: Text(
            'LOGIN',
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colorpalette.AZZURRO_ISVAL,
            fixedSize: Size(150, 40),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            enableFeedback: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/isval_logo.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ISVAL.COM',
                      style: TextStyle(
                        color: Color(0xff0a7bc0),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'CUSTOMER DASHBOARD',
                      style: TextStyle(
                        color: Colorpalette.AZZURRO_ISVAL,
                        fontFamily: 'Quicksand',
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    Column(
                      children: [
                        _buildUsernameTF(),
                        SizedBox(
                          height: 30,
                        ),
                        _buildPasswordTF(),
                        SizedBox(height: 30),
                        _buildLoginButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _requestSession() async {
    LoginRequestModel _requestModel = LoginRequestModel(
        username: usernameController.text, password: passwordController.text);
    accountInstance.login(_requestModel);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => DashboardRoute()));
  }
}
