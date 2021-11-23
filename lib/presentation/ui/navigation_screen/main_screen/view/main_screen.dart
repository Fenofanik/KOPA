import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/data_widgets/main_screen_product_search.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/data_widgets/products_view.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/user_favorite_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import '../main_screen_controller.dart';

class MainScreen1 extends StatelessWidget {
  final MainScreenController msc = Get.put(MainScreenController());
  final UserFavoriteController ufc = Get.put(UserFavoriteController());
  final NavigationController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.loading
              ? getProgress()
              : RefreshIndicator(
                  key: controller.refreshIndicatorKey,
                  onRefresh: () async {
                    await controller.getAllSneakers();
                  },
                  child: SingleChildScrollView(
                      child: Column(
                          children: controller.sneakers
                              .map((e) =>
                                  searchItem(context, controller, e, nc, ufc))
                              .toList()))),
        ),
        backgroundColor: background,
      );
    });
  }
}
