import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/text_styles.dart';

import 'colors.dart';

final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(200));

final buttonStyle = ElevatedButton.styleFrom(
    shape: shape,
    textStyle:buttonAdd
);

final buttonStyle2 = ElevatedButton.styleFrom(
  // primary: secondAppBarBackground,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle:buttonAdd
);
final buttonStyleClose = ElevatedButton.styleFrom(
  primary: whiteThings,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    textStyle:buttonCLose
);

// // ElevatedButton.styleFrom(
//                       //   shape: shape,
//                       //   minimumSize: Size(290, 40),
//                       //   padding: const EdgeInsets.only(left: 35, right: 35),
//                       //   primary: ThemeManager.forButtons,
//                       // ),