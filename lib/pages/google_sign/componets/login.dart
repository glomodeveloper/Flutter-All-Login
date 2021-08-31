import 'package:demo/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:demo/pages/home/home.dart';
import 'package:demo/pages/google_sign/componets/login.dart';
class LoginGoogle extends StatefulWidget {
  @override
  _LoginGoogleState createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final googles=GoogleSignIn();
  Future<UserCredential> signInWithGoogle() async{
  final googleUser=await googles.signIn();
  final GoogleSignInAuthentication googleAuth= await googleUser.authentication;
  final GoogleAuthCredential credential=GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  return await _auth.signInWithCredential(credential);
  }
  void Logout() async{
    await googles.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DefaultButton(
              text: 'Sign',
              press: () async{
              await  signInWithGoogle();
                Navigator.pushNamed(context, HomePage.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
