import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/view/main_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/view/profile_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/view/user_favorite_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/view/user_products_view.dart';
import 'package:kopamain/presentation/utils/app_bar.dart';
import 'package:kopamain/presentation/utils/floating_action_button.dart';
import '../navigation_screen_controller.dart';

class NavigationScreen extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

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
          // showSelectedLabels: true,
          // showUnselectedLabels: false,
          // selectedLabelStyle: buildThemeData().textTheme.headline1,
          backgroundColor: bottomBarBack,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(menu, color: bottomBarNotFocus),
              label: "Menu",
              activeIcon: SvgPicture.asset(menu, color: forButtons),
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(sneaker,
                color: bottomBarNotFocus),
                activeIcon: SvgPicture.asset(sneaker, color: forButtons),
                label: "User products"
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite, color: bottomBarNotFocus),
              activeIcon: const Icon(Icons.favorite, color: forButtons),
              label: "Favorite"
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle,color: bottomBarNotFocus),
                activeIcon: const Icon(Icons.account_circle, color: forButtons),
                label: "Profile"
            )
          ],
          onTap: controller.onTapHandler,
        ),
        appBar: getAppBar(context,controller),
        floatingActionButton: getButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
