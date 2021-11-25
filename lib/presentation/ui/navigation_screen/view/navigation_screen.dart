import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/view/main_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/view/profile_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/view/user_favorite_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/view/user_products_screen.dart';
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
          backgroundColor: bottomBarBack,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex,
          selectedLabelStyle: buildThemeData().textTheme.caption,
          items: [
            BottomNavigationBarItem(
                // icon: SvgPicture.asset(menu, color: bottomBarNotFocus)
                //     .paddingOnly(top: 4),
                // activeIcon: SvgPicture.asset(menu, color: forButtons)
                //     .paddingOnly(top: 4),
              icon: const Icon(Icons.home_outlined,color: bottomBarNotFocus,),
                activeIcon: const Icon(Icons.home,color: forButtons),
                label: "Home"),
            BottomNavigationBarItem(
              icon: const Icon(Icons.create_outlined,color: bottomBarNotFocus,),
                activeIcon: const Icon(Icons.create,color: forButtons),
                // icon:
                // SvgPicture.asset(sneaker, color: bottomBarNotFocus),
                // activeIcon: SvgPicture.asset(sneaker, color: forButtons),
                label: "User products"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_outline, color: bottomBarNotFocus),
                activeIcon: const Icon(Icons.favorite, color: forButtons),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon:
                    const Icon(Icons.account_circle_outlined, color: bottomBarNotFocus),
                activeIcon: const Icon(Icons.account_circle, color: forButtons),
                label: "Profile")
          ],
          onTap: controller.onTapHandler,
        ),
        appBar: getAppBar(context, controller),
        floatingActionButton: getButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
