import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kopamain/AppColors/Colors_app.dart';

class ImageLogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child:  SvgPicture.asset(
              'assets/images/3.svg',
            ),

          ),
          Container(
              child:Text("Вхід",style: TextStyle(fontSize: 28 ,color: ThemeManager.whiteThings))
          )
        ]);
  }
}