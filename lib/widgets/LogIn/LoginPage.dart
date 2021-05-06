import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/widgets/LogIn/LogInPageImage.dart';
import 'package:kopamain/widgets/LogIn/ButtonLogIn.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(child: LogInPageImage(), flex: 6),
                  Expanded(child: ButtonLogIn(), flex: 2)
                ])));
  }
}

