import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
      primarySwatch: Colors.green,
      cardColor: Colors.white,
      canvasColor: creamColor,
      errorColor: Vx.black,
      
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)));

  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,
      primarySwatch: Colors.green,
      cardColor: Colors.black,
      errorColor: Colors.white,
      canvasColor: darkcreamColor,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
   static Color lightBluishColor = Vx.indigo500;
}
