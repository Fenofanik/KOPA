
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_create_screen/view/user_create_screen.dart';

final MainScreenController msc = Get.find();

FloatingActionButton getButton (BuildContext context){
  return FloatingActionButton(
    child: Stack(
      children: [
        SvgPicture.asset(BottomBarButton,color: forButtons),
        const Positioned(
            left: 5,
            right: 5,
            top: 15,
            child: const Icon(Icons.add)),
      ],
    ),
    backgroundColor: bottomBarBack,
    onPressed: () async{
     await Get.to(()=>UserCreateScreen());
     await msc.getAllSneakers();
    },
  );
}