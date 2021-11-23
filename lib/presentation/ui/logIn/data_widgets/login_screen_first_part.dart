import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/images.dart';

import 'logIn_shadow_image.dart';

class FirstPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top : 20.0),
        child: Column(children: [
          Image.asset(SplashLogo,),
          logInShadow()
        ],),
      );
  }
}