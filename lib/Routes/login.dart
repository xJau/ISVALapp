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
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand'),
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: 50,
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
                    EdgeInsets.symmetric(vertical: 17, horizontal: 25),
                // hintText: 'Username',
                // hintStyle: TextStyle(fontSize: 12),
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
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand'),
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: 50,
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
              // hintText: 'Password',
              // hintStyle: TextStyle(fontSize: 12),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 25),
              border: InputBorder.none,
              suffixIcon: IconButton(
                padding: EdgeInsets.only(right: 15),
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
        Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colorpalette.AZZURRO_1, Colorpalette.AZZURRO_2],
                stops: [0.0008194930069930072, 0.9992897727272727],
                begin: Alignment(-0.71, -0.71),
                end: Alignment(0.71, 0.71),
                // angle: 135,
                // scale: undefined,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0x690a7bc0),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30)),
          child: TextButton(
            onPressed: () {
              _requestSession();
              if (accountInstance.signedIn) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => DashboardRoute()));
              }
              HapticFeedback.lightImpact();
            },
            child: Text('Login',
                style: TextStyle(fontSize: 20, color: Colors.white)),
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
                    Image.asset(
                      'assets/images/isval_logo.png',
                      scale: 1.2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ISVAL.COM',
                      style: TextStyle(
                        color: Color(0xff0a7bc0),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'CUSTOMER DASHBOARD',
                      style: TextStyle(
                        color: Colorpalette.AZZURRO_ISVAL,
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        _buildUsernameTF(),
                        SizedBox(
                          height: 20,
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
  }
}
