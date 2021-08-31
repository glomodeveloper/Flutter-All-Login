
import 'package:flutter/material.dart';
import 'package:demo/pages/home/button.dart';
import 'package:demo/pages/google_sign/componets/login.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/Home Page";

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: Text("Home Page Screen",
        style: TextStyle(color: Color(0xFF1A237E)),),
    ),

    body: Button(),
  );
  }
}
