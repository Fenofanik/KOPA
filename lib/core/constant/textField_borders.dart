import 'package:flutter/material.dart';
import 'package:kopamain/AppColors/Colors_app.dart';
import 'package:kopamain/core/constant/text_styles.dart';

import 'colors.dart';
import 'constant.dart';

final radius = BorderRadius.all(Radius.circular(3));
final radius2 = BorderRadius.circular(3);
final radius3 = BorderRadius.all(Radius.circular(4));
final radius4 = BorderRadius.circular(4);
final radius5 = BorderRadius.all(Radius.circular(16));
final borders = BorderSide(width: 1, color: borderColorLog);
final searchBorder = BorderSide.none;
final focusBorders = BorderSide(width: 2, color: forButtons);
final errorBorders = BorderSide(width: 1, color: redThings);


final styleForBorder =
OutlineInputBorder(borderSide: borders, borderRadius: radius);

final styleForBorder2 =
OutlineInputBorder(borderSide: borders, borderRadius: radius);

final styleFocus =
OutlineInputBorder(borderSide: focusBorders, borderRadius: radius);

final styleError =
OutlineInputBorder(borderSide: errorBorders, borderRadius: radius);


final textFieldDecoration = InputDecoration(
    counterText: AppStrings.EmptyString,
    labelText: AppStrings.DocExternalID,
    labelStyle: labelTextForTextField,
    hintText: AppStrings.DocExternalID,
    hintStyle: hintTextForTextField,
    enabledBorder: styleForBorder,
    focusedBorder: styleFocus,
    errorBorder: styleError,
    focusedErrorBorder: styleError);


// Widget buildOtpTextField(controller){
//   return
// }

final otpBorderRadius = BorderRadius.all(
    Radius.circular(30));
final otpBorderSide = BorderSide(
    width: 2, color: ThemeManager.redThings);
final otpBorderSide2 = BorderSide(
    width: 2, color: ThemeManager.borderColorLog);

final otpError = OutlineInputBorder(borderRadius:otpBorderRadius,borderSide: otpBorderSide );
final otpFocusedError = OutlineInputBorder(
    borderSide: BorderSide(
        width: 2, color: ThemeManager.redThings),
    borderRadius: BorderRadius.all(
        Radius.circular(30)));
final otpEnabled = OutlineInputBorder(
    borderSide: BorderSide(
        width: 2, color: ThemeManager.borderColorLog),
    borderRadius: BorderRadius.all(
        Radius.circular(30)));
final otpFocused = OutlineInputBorder(
    borderSide: BorderSide(
        width: 2, color: ThemeManager.borderColorLog),
    borderRadius: BorderRadius.all(
        Radius.circular(30)));

final oldStyle = InputDecoration(
  errorStyle: TextStyle(fontSize: 7),
  contentPadding: const EdgeInsets.all(10),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          width: 2, color: ThemeManager.borderColorLog),
      borderRadius: BorderRadius.all(
          Radius.circular(30))),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          width: 2, color: ThemeManager.borderColorLog),
      borderRadius: BorderRadius.all(
          Radius.circular(30))),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          width: 2, color: ThemeManager.redThings),
      borderRadius: BorderRadius.all(
          Radius.circular(30))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          width: 2, color: ThemeManager.redThings),
      borderRadius: BorderRadius.all(
          Radius.circular(30))),
);




