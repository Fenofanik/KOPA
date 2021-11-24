import 'package:flutter/material.dart';
import 'colors.dart';

final searchFieldContainer = const BorderRadius.all(Radius.circular(16));
final tabBordersDecoration = BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(25.0,),
    border: Border.all(color: myAddBorder));

final tabIndicatorDecoration = BoxDecoration(
  borderRadius:  BorderRadius.circular(25.0),
  color: forButtons,
);

final styleBorder = const Border(
    bottom: const BorderSide(
  color: borderColorLog,
  width: 0.2,
));
final styleBorder1 = const Border(
    bottom: const BorderSide(
  color: forButtons,
  // colorGrey,
  width: 1,
));
final styleBorder2 = const Border(
    bottom: const BorderSide(
      color: borderColorLog,
      width: 0.2,
    ),
    top: const BorderSide(
      color: borderColorLog,
      width: 0.2,
    ),
    left: const BorderSide(
      color: borderColorLog,
      width: 0.2,
    ),
    right: const BorderSide(
      color: borderColorLog,
      width: 0.2,
    ));
final styleBorder3 = const Border(
    bottom: const BorderSide(
  color: borderColorLog,
  width: 0.3,
));
final styleBorder4 =  Border.all(
  color: transparent,
);

final listSneakerBorder =
 RoundedRectangleBorder(borderRadius:  BorderRadius.circular(44));

final dialogsBorders =  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

final listSneakerBorder2 =  BorderRadius.circular(22);

final listSneakerBorder3 =  BorderRadius.circular(44);

final forSoldContainer = BorderRadius.circular(14);

final forUserCreateBottom =  const BoxDecoration(
    border: const  Border(bottom: const BorderSide(width: 1, color: myAddBorder),
    ));

final forUserCreateRight = const BoxDecoration(border: const Border(
  right: const BorderSide(width: 1, color: myAddBorder),
));

final allPadding = const EdgeInsets.only(
    top: 20, bottom: 15, right: 13, left: 10);

final allPadding2 = const EdgeInsets.all(5.0);

final allPadding3 = const EdgeInsets.all(8.0);

final paddingForCreateScreenTextFields =  const EdgeInsets.only(bottom: 13, left: 5);