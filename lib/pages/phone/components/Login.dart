import 'package:flutter/material.dart';
import 'package:demo/pages/phone/components/optController.dart';
class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin:EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    "Phone Athentification",
                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28) ,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40,right: 10,left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+92'),
                    )
                  ),
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                child: FlatButton(
                  color: Colors.deepOrange,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OptController(_controller.text)));
                  },
                  child: Text('Next',style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
