

import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/cart_page.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';
import 'package:flutter_catelog/pages/widgets/themes.dart';
import 'package:flutter_catelog/store/store.dart';
import 'package:flutter_catelog/utilities/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      darkTheme:MyTheme.darkTheme(),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: ((context) => LoginPage()),
        MyRoutes.cartRoute: ((context) => CartPage()
        )
      },
    );
  }
}
