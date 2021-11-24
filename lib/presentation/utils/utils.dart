import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/container_borders.dart';
import 'package:kopamain/core/constant/theme_data.dart';
import 'package:kopamain/presentation/ui/navigation_screen/detail_screen/detail_screen_controller.dart';
import 'package:kopamain/presentation/ui/navigation_screen/user_create_screen/user_create_screen_controller.dart';

Widget getProgress({bool wrap = false, bool background = false}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: const AlwaysStoppedAnimation<Color>(boxPriceColor),
    ),
  );
}

Widget getLinearProgress({bool wrap = false, bool background = false}) {
  return Center(
      child: LinearProgressIndicator(
    valueColor: const AlwaysStoppedAnimation<Color>(boxPriceColor),
    minHeight: 3,
  ));
}

Widget buildDivider() {
  return const Divider(
    thickness: 1,
    height: 1,
    color: borderColorLog,
  );
}

Widget buildCircleIcon() {
  return const Icon(
    Icons.circle,
    size: 9,
    color: forButtons,
  );
}

Widget buildBackIosButton() {
  return const Icon(Icons.arrow_back_ios);
}

void showWebColoredToast(String msg,
    {String bgrColor, Color textColor = whiteThings}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    webPosition: "left",
    webBgColor: bgrColor,
    textColor: whiteThings,
    fontSize: 18,
    backgroundColor: blackThings.withOpacity(0.8),
    timeInSecForIosWeb: 5,
  );
}

void messageSnack(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: forButtons,
      colorText: whiteThings,
      snackPosition: SnackPosition.TOP);
}

void errorSnack(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: redThings,
      colorText: blackThings,
      snackPosition: SnackPosition.BOTTOM);
}

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

void getArchiveDialog(DetailScreenController controller) {
  Get.dialog(AlertDialog(
    shape: dialogsBorders,
    backgroundColor: containerColor,
    content: SingleChildScrollView(
      child: RichText(
          text: TextSpan(
              text: 'Move product to archive',
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
               await controller.addProductToArchive(controller.detailSneaker);
              }),
        ],
      )
    ],
  ));
}

void updateProductDialog(UserCreateScreenController controller){
  Get.dialog(AlertDialog(
    shape: dialogsBorders,
    backgroundColor: containerColor,
    content: SingleChildScrollView(
      child: RichText(
          text: TextSpan(
              text: 'Are you want to update this product',
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
                await controller.updateProduct();
              }),
        ],
      )
    ],
  ));
}
