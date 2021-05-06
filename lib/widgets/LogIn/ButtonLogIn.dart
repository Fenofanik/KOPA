import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopamain/widgets/LogIn/Verification.dart';

class ButtonLogIn extends StatefulWidget {
  @override
  ButtonLogInState createState() => ButtonLogInState();
}

class ButtonLogInState extends State<ButtonLogIn> {
  int showTextField = 1;

  @override
  Widget build(BuildContext context) {
    return showTextField == 1
        ? Padding(padding: EdgeInsets.only(bottom: 30),
        child :Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.lightGreenAccent),
                    child: IconButton(
                      iconSize: 25.0,
                      onPressed: () {
                        setState(() {
                          showTextField = 2;
                        });
                      },
                      icon: Icon(Icons.phone, color: Colors.white),
                    )),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue[900]),
                    child: IconButton(
                        color: Colors.white,
                        iconSize: 25.0,
                        icon: new Center(
                            child: new Icon(FontAwesomeIcons.facebook)),
                        alignment: Alignment.center,
                        onPressed: () {})),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: IconButton(
                        color: Colors.white,
                        iconSize: 25.0,
                        icon: Center(child: new Icon(FontAwesomeIcons.google)),
                        alignment: Alignment.center,
                        onPressed: () {}))
              ]))
        : Verification();
  }
}
