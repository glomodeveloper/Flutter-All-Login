import 'package:flutter/material.dart';
import 'package:demo/pages/google_sign/componets/login.dart';
class GoogleSign extends StatelessWidget {
  static String routeName = "/google sign";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google login"),
      ),
      body:LoginGoogle() ,
    );
  }
}
