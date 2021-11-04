import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/view/main_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile/view/profile_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/view/user_favorite_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/view/user_products_view.dart';
import 'package:kopamain/presentation/utils/app_bar.dart';
import 'package:kopamain/presentation/utils/floating_action_button.dart';

import '../navigation_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.selectedIndex,
            children: [
              MainScreen1(),
              UserProductsScreen(),
              UserFavoriteScreen(),
              ProfileScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ThemeManager.bottomBarBack,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon:
                  SvgPicture.asset(menu, color: ThemeManager.bottomBarNotFocus),
              label: "Menu",
              activeIcon:
                  SvgPicture.asset(menu, color: ThemeManager.forButtons),
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(sneaker,
                    color: ThemeManager.bottomBarNotFocus),
                activeIcon:
                    SvgPicture.asset(sneaker, color: ThemeManager.forButtons),
                label: "User Choice"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: ThemeManager.bottomBarNotFocus),
              activeIcon: Icon(Icons.favorite, color: ThemeManager.forButtons),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.settings, color: ThemeManager.bottomBarNotFocus),
                activeIcon:
                    Icon(Icons.settings, color: ThemeManager.forButtons),
                label: "Profile")
          ],
          onTap: controller.onTapHandler,
        ),
        appBar: getAppBar(context),
        floatingActionButton: getButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
