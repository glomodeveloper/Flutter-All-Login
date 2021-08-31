import 'package:demo/pages/facebooklogin/facebook.dart';
import 'package:demo/pages/phone/phones.dart';
import 'package:flutter/material.dart';
import 'package:demo/size_settings.dart';
import 'package:demo/constants.dart';
import 'package:demo/components/socal_card.dart';
import 'package:demo/pages/sign_in/elements/signform.dart';
import 'package:demo/components/no_account_text.dart';
import 'package:demo/pages/google_sign/googlesign.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Glomo Developer",
                  style: TextStyle(
                    color: Color(0xFF1A237E),
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        Navigator.pushNamed(context, GoogleSign.routeName);
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        Navigator.pushNamed(context, facebook.routeName);
                      },
                    ),
                    SocalCard(
                      icon: "assets/icons/Call.svg",
                      press: () {
                        Navigator.pushNamed(context, OtpScrenn.routeName);
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

