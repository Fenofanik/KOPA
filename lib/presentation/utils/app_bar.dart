import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/presentation/ui/navigation_screen/main_screen/main_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/navigation_screen_controller.dart';
import 'package:kopamain/presentation/utils/utils.dart';

final MainScreenController msc = Get.find();

AppBar getAppBar(BuildContext context,NavigationController nc ) {
  return AppBar(
    backgroundColor: bottomBarBack,
    leading: Builder(
      builder: (context) {
        if (nc.isMainScreen) {
          return IconButton(
              icon: const Icon(Icons.filter_list_alt),
              color: whiteThings,
              onPressed: () {
                filterAddButtonSheet(context, msc);
              });
        } else if (nc.isProfileScreen) {
          return const Icon(
            Icons.account_circle,
            color: textSize,
          );
        } else if (nc.isUserProductScreen) {
          return const Icon(
            Icons.create_outlined,
            color: green,
          );
        } else if (nc.isFavoriteScreen) {
          return const Icon(
            Icons.favorite,
            color: redThings,
          );
        } else {
          return IconButton(
              onPressed: () {
                Get.back();
              },
              icon: buildBackIosButton());
        }
      },
    ),
    title: Builder(
      builder: (context) {
        if (nc.isMainScreen == true) {
          return Text('Main Screen');
        } else if (nc.isProfileScreen == true) {
          return Text('Profile');
        } else if (nc.isFavoriteScreen == true) {
          return Text('Favorite');
        } else if (nc.isUserProductScreen == true) {
          return Text('User Products');
        } else {
          return Text('Detail');
        }
      },
    ),
  );
}

void filterAddButtonSheet(context, MainScreenController controller) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: filterBack,
          height: MediaQuery.of(context).size.height * 45,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: buildBackIosButton(),
                    onPressed: () {
                      Get.back();
                    }),
                TextField(
                  controller: controller.brand,
                  decoration: InputDecoration(
                    labelText: AppStrings.Model,
                    labelStyle: buildThemeData().textTheme.headline2,
                    prefixIcon: buildCircleIcon(),
                  ),
                  style: buildThemeData().textTheme.headline2,
                ),
                TextField(
                    controller: controller.material,
                    decoration: InputDecoration(
                      labelText: AppStrings.Material,
                      labelStyle: buildThemeData().textTheme.headline2,
                      prefixIcon: buildCircleIcon(),
                    ),
                    style: buildThemeData().textTheme.headline2),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: TextField(
                      controller: controller.size,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: AppStrings.Size,
                        labelStyle: buildThemeData().textTheme.headline2,
                        prefixIcon: buildCircleIcon(),
                      ),
                      style: buildThemeData().textTheme.headline2),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: TextField(
                      controller: controller.price,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: AppStrings.Price,
                        labelStyle: buildThemeData().textTheme.headline2,
                        prefixIcon: buildCircleIcon(),
                      ),
                      style: buildThemeData().textTheme.headline2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          controller.clearControllers();
                        },
                        child: Text(
                          AppStrings.overthrow,
                          style: buildThemeData().textTheme.headline1,
                        ).paddingOnly(top: 30, left: 20)),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          AppStrings.apply,
                          style: buildThemeData().textTheme.headline1,
                        ).paddingOnly(right: 15, top: 30, left: 20))
                  ],
                ),
              ],
            ),
          )),
        );
      });
}
