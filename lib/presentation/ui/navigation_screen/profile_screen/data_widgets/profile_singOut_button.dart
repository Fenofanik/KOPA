import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/theme_data.dart';

import '../profile_controller.dart';

Widget profileSignOutButton(ProfileController pc) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Center(
        widthFactor: Get.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.only(left: 120, right: 120),
              primary: forButtons,
            ),
            child: Text(AppStrings.Out, style: buildThemeData().textTheme.headline5),
            onPressed: () async {
              await pc.signOut();
            })),
  );
}