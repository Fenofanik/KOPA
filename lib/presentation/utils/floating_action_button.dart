

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:get/get.dart';
//
// final MainScreenController msc = Get.put(MainScreenController());

FloatingActionButton getButton (BuildContext context){
  return FloatingActionButton(
    child: Stack(
      children: [
        SvgPicture.asset(BottomBarButton,color: ThemeManager.forButtons),
        Positioned(
            left: 5,
            right: 5,
            top: 15,
            child: Icon(Icons.add)),
      ],
    ),
    backgroundColor: ThemeManager.bottomBarBack,
    onPressed: () async{
      Get.snackbar('WILL BE', "SOON ",backgroundColor: redThings);
    },
  );
}