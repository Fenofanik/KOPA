import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kopamain/core/constant/colors.dart';



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
    )
  );
}

Widget buildDivider() {
  return const Divider(
    thickness: 1,
    height: 1,
    color: borderColorLog,
  );
}

Widget buildCircleIcon (){
  return  const Icon(
     Icons.circle,
    size: 9,
    color: forButtons,
  );
}

Widget buildBackIosButton (){
  return const Icon(Icons.arrow_back_ios);
}

void showWebColoredToast(String msg,
    {String bgrColor = "#E60023", Color textColor = whiteThings}) {
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







