import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/widgets/LogIn/Verification.dart';
import 'package:provider/provider.dart';

import 'google.dart';

class ButtonLogIn extends StatefulWidget {
  @override
  ButtonLogInState createState() => ButtonLogInState();
}

class ButtonLogInState extends State<ButtonLogIn> {
  int showTextField = 1;

  @override
  Widget build(BuildContext context) {
    return showTextField == 1
        ? Padding(padding: const EdgeInsets.only(bottom: 30),
        child :Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.phoneButton),
                    child: IconButton(
                      iconSize: 25.0,
                      onPressed: () {
                        setState(() {
                          showTextField = 2;
                        });
                      },
                      icon: Icon(Icons.phone, color: ThemeManager.whiteThings),
                    )),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.faceBookButton),
                    child: IconButton(
                        color: ThemeManager.whiteThings,
                        iconSize: 25.0,
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom:2,left: 1),
                          child: new Center(
                              child: new Icon(FontAwesomeIcons.facebook)),
                        ),
                        alignment: Alignment.center,
                        onPressed: () {})),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeManager.googleButton),
                    child: IconButton(
                        color: ThemeManager.whiteThings,
                        iconSize: 25.0,
                        icon: Center(child: new Icon(FontAwesomeIcons.google)),
                        alignment: Alignment.center,
                        onPressed: () {
                          final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                          provider.googleLogIn();
                          Navigator.pushNamed(context, '/Verification3');

                        }))
              ]))
        : Verification();
  }
}
