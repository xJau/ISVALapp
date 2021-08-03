import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Models/login_model.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:isval_test/Utility/colorscheme.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute();
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  LoginRequestModel _requestModel =
      LoginRequestModel(username: '', password: '');

// @override
//   void initState(){
//     super.initState();
//     _requestModel = LoginRequestModel(username: '',password: '');
//   }

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
            onSaved: (input) => _requestModel.username = input!,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14, left: 20, bottom: 10),
                hintText: 'Username',
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  bool _showPassword = false;

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
            onSaved: (input) => _requestModel.password = input!,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !this._showPassword,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: EdgeInsets.only(top: 16, left: 14),
              hintStyle: TextStyle(fontSize: 12),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: this._showPassword
                      ? Colorpalette.AZZURRO_ISVAL
                      : Colors.grey,
                ),
                onPressed: () {
                  setState(() => this._showPassword = !this._showPassword);
                },
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ),
            validator: (password) => password != null && password.length < 8
                ? 'Enter min. 8 characters'
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 45,
      width: 100,
      child: ElevatedButton(
        onPressed: () {
          if (_validateAndSave()) print(_requestModel.toJson());
          ApiService.login(_requestModel).then((value) => null);
        },
        child: Text('LOGIN'),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colorpalette.AZZURRO_ISVAL,
          minimumSize: Size(88, 20),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Form(
                        key: _globalFormKey,
                        child: Column(
                          children: [
                            _buildUsernameTF(),
                            SizedBox(
                              height: 30,
                            ),
                            _buildPasswordTF(),
                            SizedBox(height: 30),
                            _buildLoginButton(),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateAndSave() {
    final form = _globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
