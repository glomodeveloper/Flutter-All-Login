import 'package:flutter/material.dart';
import 'package:demo/pages/sign_in/elements/body.dart';
import 'package:demo/size_settings.dart';
class signin extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
        style: TextStyle(color: Color(0xFF1A237E)),),
      ),
      body: Body(),
    );
  }
}