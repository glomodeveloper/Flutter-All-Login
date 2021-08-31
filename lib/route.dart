

import 'package:demo/pages/facebooklogin/facebook.dart';
import 'package:demo/pages/google_sign/googlesign.dart';
import  'package:flutter/widgets.dart';
import 'package:demo/pages/sign_in/sign.dart';
import 'package:demo/pages/signup/sign_up.dart';
import 'package:demo/pages/home/home.dart';
import 'package:demo/pages/phone/phones.dart';

final Map<String,WidgetBuilder> routes={

  signin.routeName:(context) =>signin(),

  SignUp.routeName:(context) => SignUp(),
  facebook.routeName:(context) =>facebook(),
  HomePage.routeName:(context) => HomePage(),
  GoogleSign.routeName:(context) =>GoogleSign(),
  OtpScrenn.routeName:(context) =>OtpScrenn(),


};