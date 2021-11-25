import 'package:get/get.dart';
import 'package:kopamain/presentation/bindings/login_bindings.dart';
import 'package:kopamain/presentation/bindings/navigation_screen_bindings.dart';
import 'package:kopamain/presentation/bindings/profile_screen_bindings.dart';
import 'package:kopamain/presentation/bindings/splash_binding.dart';
import 'package:kopamain/presentation/ui/logIn/view/logIn_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/view/detail_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/view/main_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/profile_screen/view/profile_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/view/user_favorite_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/view/user_products_screen.dart';
import 'package:kopamain/presentation/ui/navigation_screen/view/navigation_screen.dart';
import 'package:kopamain/presentation/ui/splash/view/splash_screen.dart';
import 'package:kopamain/presentation/ui/user_add_info/view/user_add_info_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.Splash;

  static final routes = [
    GetPage(
      name: Routes.Splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    //LoginPage
    GetPage(
      name: Routes.LogIn,
      page: () => LogInScreen(),
      // binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.NavigationScreen,
      page: () => NavigationScreen(),
      binding: NavigationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.UserAddInfo,
      page: () => UserAddInfoScreen(),
      // binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.MainScreen1,
      page: () => MainScreen1(),
      // binding: MainScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.DetailScreen,
      page: () => DetailScreen(),
      // binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.UserProducts,
      page: () => UserProductsScreen(),
      // binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.UserFavorite,
      page: () => UserFavoriteScreen(),
      // binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ProfileScreen,
      page: () => ProfileScreen(),
      binding: ProfileScreenBinding(),
      transition: Transition.fadeIn,
    ),

    //
//DetailScreen

  ];
}
