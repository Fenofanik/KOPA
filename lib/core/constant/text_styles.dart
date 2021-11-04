import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'colors.dart';


final TextStyle patientInfo = GoogleFonts.roboto(
  fontSize: 13,
  color: blackThings,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle appBarTitle = GoogleFonts.roboto(
  fontSize: 16,
  color: whiteThings,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle appBarText = GoogleFonts.roboto(
  fontSize: 16,
  color: whiteThings,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w900,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle buttonAdd = GoogleFonts.roboto(
    fontSize: 14,
    color: whiteThings,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle buttonCLose = GoogleFonts.roboto(
    fontSize: 14,
    color: whiteThings,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle labelTextForTextField = GoogleFonts.roboto(
    fontSize: 14,
    // color: colorBlue,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontFeatures: const [FontFeature.proportionalFigures()]
);
final TextStyle hintTextForTextField = GoogleFonts.roboto(
    fontSize: 12,
    // color: colorGrey,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontFeatures: const [FontFeature.proportionalFigures()]
);

final oldStyleTextField =  TextStyle(
    fontSize: (14), color: whiteThings);

final detailStyle = TextStyle(
    fontSize: 10,
    color: whiteThings,
    fontWeight: FontWeight.w100);

final detailStyle2 = TextStyle(
    fontSize: 14,
    color: whiteThings,
    fontWeight: FontWeight.w100);

final detailScreen3 = TextStyle(
    fontSize: 22,
    color: ThemeManager
        .textSize,
    fontWeight:
    FontWeight.w100);


