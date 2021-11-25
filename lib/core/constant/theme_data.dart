import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

ThemeData buildThemeData() {
  return  ThemeData(
    scaffoldBackgroundColor: background,
    // primaryColor: colorBlue,
    // cardColor: colorGrey,
    // accentColor: colorBlue,
    // primaryTextTheme: primaryTextTheme,
    backgroundColor: background,
    appBarTheme: AppBarTheme(
        color: bottomBarBack,
        titleSpacing: 0,
        titleTextStyle:  GoogleFonts.roboto(
          fontSize: 14,
          color: whiteThings,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        )),
    textTheme: GoogleFonts.robotoTextTheme(
      TextTheme(
          headline1: const TextStyle(
              fontSize: 10, color: whiteThings, fontWeight: FontWeight.w100),
          headline2: const TextStyle(
              fontSize: 14,
              color: whiteThings,
              fontWeight: FontWeight.w100),
          headline3: const TextStyle(
              fontSize: 22,
              color: textSize,
              fontWeight: FontWeight.w100),
          headline4: const TextStyle(fontSize: (14), color: whiteThings),
          headline5:
          const TextStyle(fontSize: 16, color: whiteThings),
          headline6:
          const TextStyle(fontSize: 18, color: whiteThings),
          subtitle1:
          const TextStyle(fontSize: 11, color: whiteThings),
          subtitle2: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: textPrice),
          overline: const TextStyle(
              fontSize: 10,
              color: textMaterial,
              fontWeight: FontWeight.w100),
          bodyText1:
          const TextStyle(fontSize: 10, color: textMaterial),
          bodyText2: const TextStyle(
              fontSize: 18,
              color: whiteThings,
              fontWeight: FontWeight.w500),
          button: GoogleFonts.roboto(
              fontSize: 14,
              color: whiteThings,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontFeatures: [FontFeature.proportionalFigures()]),
          caption: GoogleFonts.roboto(
              fontSize: 14,
              color: whiteThings,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontFeatures: [FontFeature.proportionalFigures()])),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: transparent,
          textStyle: GoogleFonts.roboto(
            fontSize: 16,
            color: forButtons,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            textStyle: const TextStyle(color: forButtons)
          ),
        )),
  );
}
