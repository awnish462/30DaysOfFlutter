// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_catelog/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String Name = "";
  bool changeButton = false;
  moveToHome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        changeButton = false;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = true;
      });

    }
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $Name",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Enter Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Enter Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "dafgfsadf";
                          } else if (value.length < 6) {
                            return "Password length should be 6";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),

                Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 5),
                  child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
