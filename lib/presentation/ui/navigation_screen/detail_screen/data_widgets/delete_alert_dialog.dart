import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/container_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import '../detail_screen_controller.dart';

void getAlertDeleteDialog(DetailScreenController controller) {
  Get.dialog(AlertDialog(
    shape: dialogsBorders,
    backgroundColor: containerColor,
    content: SingleChildScrollView(
      child: RichText(
          text: TextSpan(
              text: 'Are you sure to delete this product',
              style: buildThemeData().textTheme.headline6,
              children: <TextSpan>[
                TextSpan(
                  text: ' ?',
                  style: buildThemeData().textTheme.headline6,
                )
              ])),
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: dialogsBorders,
                padding: const EdgeInsets.only(left: 40, right: 45),
                primary: forButtons,
              ),
              child: Text(AppStrings.No,
                  style: buildThemeData().textTheme.headline5),
              onPressed: () {
                Get.back();
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: dialogsBorders,
                padding: const EdgeInsets.only(left: 45, right: 40),
                primary: forButtons,
              ),
              child: Text(AppStrings.Yes,
                  style: buildThemeData().textTheme.headline5),
              onPressed: () async {
                await controller
                    .deleteUserProduct(
                    controller
                        .detailSneaker);
              }),
        ],
      )
    ],
  ));
}