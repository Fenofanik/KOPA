import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/theme_data.dart';

import 'colors.dart';

final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(200));

final buttonStyle = ElevatedButton.styleFrom(
    shape: shape,
    textStyle:buildThemeData().textTheme.button
);

final buttonStyle2 = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle:buildThemeData().textTheme.button
);
final buttonStyleClose = ElevatedButton.styleFrom(
  primary: whiteThings,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle:buildThemeData().textTheme.caption
);

// // ElevatedButton.styleFrom(
//                       //   shape: shape,
//                       //   minimumSize: Size(290, 40),
//                       //   padding: const EdgeInsets.only(left: 35, right: 35),
//                       //   primary: ThemeManager.forButtons,
//                       // ),