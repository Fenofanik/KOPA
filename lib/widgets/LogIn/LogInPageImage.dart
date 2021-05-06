import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/widgets/LogIn/ImageLogIn.dart';
class LogInPageImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.only(bottom: 1,top: 100),
          child:Column(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: Image.asset(
              "assets/images/2.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            )),
        Expanded(
            flex: 1,
            child: ImageLogIn()),
      ],
    ));
  }
}
