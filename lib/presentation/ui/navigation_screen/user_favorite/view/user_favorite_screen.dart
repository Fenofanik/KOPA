import 'package:kopamain/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_favorite/data_widgets/favorite_products_view.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import '../user_favorite_controller.dart';

class UserFavoriteScreen extends StatelessWidget {
  final UserFavoriteController ufc = Get.find();
  final MainScreenController msc = Get.find();
  final NavigationController nc = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserFavoriteController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: controller.loading
                ? getProgress()
                : controller.sneakers.isNotEmpty
                    ? RefreshIndicator(
                        key: controller.favorite,
                        onRefresh: () async {
                          await controller.getFavoriteSneakers();
                        },
                        child: SingleChildScrollView(
                            child: Column(
                                children: controller.sneakers
                                    .map((e) => favoriteProductsView(
                                        e, controller, nc, msc))
                                    .toList())),
                      )
                    : Center(
                        child: Text('No favorites  yet'),
                      )),
        backgroundColor: background,
      );
    });
  }
}
