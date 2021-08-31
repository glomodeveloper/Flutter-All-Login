import 'package:demo/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:demo/pages/home/home.dart';
class facelogin extends StatefulWidget {


  @override
  _faceloginState createState() => _faceloginState();
}

class _faceloginState extends State<facelogin> {
  Future<UserCredential> signInWithFacebook() async{
    final LoginResult result= await FacebookAuth.instance.login();
    final FacebookAuthCredential facebookAuthCredential= FacebookAuthProvider.credential(result.accessToken.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            DefaultButton(
              text:  'Sign',
              press: ()async{
                await signInWithFacebook();
                Navigator.pushNamed(context, HomePage.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
