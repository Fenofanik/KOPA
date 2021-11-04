import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';

import 'logIn_shadow_image.dart';


class FirstPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top : 20.0),
        child: Column(children: [
          Image.asset(
            SplashLogo,
          ),
          logInShadow()
          // Stack(
          //     alignment: Alignment.center,
          //     children: [
          //       Container(
          //         child:  SvgPicture.asset(
          //             LoginShadow
          //           // 'assets/images/3.svg',
          //         ),
          //
          //       ),
          //       Container(
          //           child:Text("Вхід",style: TextStyle(fontSize: 28 ,color: whiteThings))
          //       )
          //     ]),
        ],),
      );
  }
}