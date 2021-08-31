import 'package:demo/pages/sign_in/sign.dart';
import 'package:demo/route.dart';
import 'package:demo/thems.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    theme: theme(),
      initialRoute: signin.routeName,
      routes: routes,

    );
  }
}

