import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Text("Welcome to 30 days of coding"),
          ),
        ),
      ),
    );
  }
}
