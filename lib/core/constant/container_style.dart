import 'package:flutter/material.dart';

import 'colors.dart';
import 'container_borders.dart';

final containerDecoration1 = BoxDecoration(
  color: whiteThings,
  border: styleBorder2,
  boxShadow: [
    BoxShadow(
      color: borderColorLog.withOpacity(0.5),
      spreadRadius: 0.2,
      blurRadius: 1.5,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
);
final containerDecoration2 =
BoxDecoration(border: styleBorder,
  color: whiteThings,
  boxShadow: [
    BoxShadow(
      color: borderColorLog.withOpacity(0.5),
      spreadRadius: 0.1,
      blurRadius: 1.5,
      offset: Offset(
          0, 2), // changes position of shadow
    ),
  ],
);
