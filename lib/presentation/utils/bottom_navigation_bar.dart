import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';

// final NavigationController navigationController = Get.find();

BottomNavigationBar getBottomBar(NavigationController controller) {

  return
    BottomNavigationBar(
    backgroundColor: ThemeManager.bottomBarBack,
    type: BottomNavigationBarType.fixed,
    currentIndex: controller.selectedIndex,
    items: [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(menu,
              color: controller.selectedIndex == 0
                  ? ThemeManager.forButtons
                  : ThemeManager.bottomBarNotFocus),
          label: "Menu"),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(sneaker,
              color: controller.selectedIndex == 1
                  ? ThemeManager.forButtons
                  : ThemeManager.bottomBarNotFocus),
          label: "User Choice"),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite,
              color: controller.selectedIndex == 2
                  ? ThemeManager.forButtons
                  : ThemeManager.bottomBarNotFocus),
          label: "Favorite",
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings,
              color: controller.selectedIndex == 3
                  ? ThemeManager.forButtons
                  : ThemeManager.bottomBarNotFocus),
          label: "Profile")
    ],
    // onTap: (int index) {
    //   controller.onTapHandler(index);
    //
    // },
  );
}
