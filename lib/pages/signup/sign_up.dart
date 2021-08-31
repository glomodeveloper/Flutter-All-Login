import 'package:flutter/material.dart';
import 'package:demo/pages/signup/elements/body.dart';
class SignUp extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",
          style: TextStyle(color: Color(0xFF1A237E)),),
      ),
      body:SignMain() ,
    );
  }
}
