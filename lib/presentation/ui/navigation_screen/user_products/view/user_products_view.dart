import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/container_borders.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_products/data_widgets/user_products_view.dart';
import 'package:kopamain/presentation/utils/utils.dart';
import '../../navigation_screen_controller.dart';
import '../user_products_controller.dart';

class UserProductsScreen extends StatelessWidget {
  final UserProductsController upc = Get.put(UserProductsController());
  final NavigationController nc = Get.find();
  final MainScreenController msc = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductsController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: tabBordersDecoration,
                  child: TabBar(
                    onTap: (index) {
                      controller.checkTabIndex(index);
                    },
                    controller: controller.userTabController,
                    indicator: tabIndicatorDecoration,
                    labelColor: whiteThings,
                    unselectedLabelColor: whiteThings,
                    tabs: [
                      Tab(
                        text: AppStrings.active,
                      ),
                      Tab(
                        text: AppStrings.archive,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.userTabController,
                    children: [
                      controller.loading
                          ? getProgress()
                          : controller.sneakers.length != 0
                              ? RefreshIndicator(
                                  key: controller.userProducts,
                                  onRefresh: () async {
                                    await controller.getUsersProducts();
                                  },
                                  child: SingleChildScrollView(
                                    child: Column(
                                        children: controller.sneakers
                                            .map((e) => userProductsView(
                                                e, controller, nc, msc))
                                            .toList()),
                                  ),
                                )
                              : Center(child: Text(AppStrings.NoInfo)),
                      controller.loadingArchive
                          ? getProgress()
                          : controller.sneakersArchive.length != 0?
                      RefreshIndicator(
                              key: controller.userArchive,
                              onRefresh: () async {
                                await controller.getUsersArchive();
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                    children: controller.sneakersArchive
                                        .map((e) => userProductsView(
                                            e, controller, nc, msc))
                                        .toList()),
                              ),
                            ):
                      Center(child: Text(AppStrings.NoInfo)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: background,
      );
    });
  }
}
