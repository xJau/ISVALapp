import 'package:flutter/material.dart';

class IsvalTheme {
  static final _fontColor = Color(0xFF276FB0);
  static final _containerColor = Color(0xFFF2F2F2);
  static final _backgroundColor = Colors.white;

  static final light = ThemeData(
      brightness: Brightness.light,
      primaryColor: _fontColor,
      scaffoldBackgroundColor: _containerColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _backgroundColor,
        iconTheme: IconThemeData(
          color: _fontColor),
        textTheme: TextTheme(
          headline6: TextStyle(color: _fontColor)
        )
      ),
      //accentColor same as primary one

      //default fault family, can also be imported
      fontFamily: 'futura',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 64), //record title font
        headline2: TextStyle(fontSize: 40), //record item font
        headline3: TextStyle(fontSize: 32), //record variable font
        bodyText2: TextStyle(fontSize: 24), //record value font
      ));
}
