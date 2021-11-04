import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';

Widget logInShadow (){
  return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child:  SvgPicture.asset(
              LoginShadow
          ),
        ),
        Container(
            child:Text("Вхід",style: TextStyle(fontSize: 28 ,color: whiteThings))
        )
      ]);
}