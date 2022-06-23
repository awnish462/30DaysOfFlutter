import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)));

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.light,
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
