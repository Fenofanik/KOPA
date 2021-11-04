import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/colors.dart';


Widget getProgress({bool wrap = false, bool background = false}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(boxPriceColor),
    ),
  );
}

Widget buildDivider() {
  return const Divider(
    thickness: 1,
    height: 1,
    color: borderColorLog,
  );
}





