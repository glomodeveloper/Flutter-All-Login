import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo/pages/home/home.dart';
import 'package:pinput/pin_put/pin_put.dart';
class OptController extends StatefulWidget {
  final String phone ;
  OptController(this.phone);

  @override
  _OptControllerState createState() => _OptControllerState();
}

class _OptControllerState extends State<OptController> {
  final GlobalKey<ScaffoldState> _scaffolkey= GlobalKey<ScaffoldState>();
  String _varificationcode;
  final TextEditingController _pinPutController=TextEditingController();
  final FocusNode _pinPutFoucus =FocusNode();
  final BoxDecoration pinPutdecoration=BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        title: Text('OTP verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Varify +92-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(30.0),
          child: PinPut(
            fieldsCount: 6,

            textStyle: const TextStyle(fontSize: 25.0,color: Colors.white),
            eachFieldWidth: 40.0,
            eachFieldHeight: 55.0,
            focusNode: _pinPutFoucus,
            controller: _pinPutController,
            submittedFieldDecoration: pinPutdecoration,
            selectedFieldDecoration: pinPutdecoration,
            followingFieldDecoration: pinPutdecoration,
            pinAnimationType: PinAnimationType.fade,
            onSubmit: (pin)async{
              try{
                await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _varificationcode, smsCode: pin)).
                then((value) async{
                  if (value.user!=null){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                  }
                });
              }
              catch(e){
                FocusScope.of(context).unfocus();
                _scaffolkey.currentState.showSnackBar(SnackBar(content: Text("invalid OTP"),));
              }
            },



          )
          )
        ],
      ),
    );
  }
  _varifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+92${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
        if(value.user!=null){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),
      (route) => false);
      }

      });
      },
      verificationFailed: (FirebaseAuthException e){
      print(e.message);
      },
      codeSent: (String verficationID,int resendToken){
      setState(() {
        _varificationcode=verficationID;
      });
      },
      codeAutoRetrievalTimeout: (String verificationID){
      setState(() {
        _varificationcode=verificationID;
      });
      },
      timeout: Duration(seconds: 120)

    );
  }
  @override @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _varifyPhone();
  }

}
