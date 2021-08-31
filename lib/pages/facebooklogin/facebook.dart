import 'package:flutter/material.dart';
import 'package:demo/pages/facebooklogin/components/facelogin.dart';
class facebook extends StatelessWidget {
  static String routeName = "/facebook sign";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Facebook Login"),
      ),
      body: facelogin(),
    );
  }
}
