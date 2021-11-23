import 'package:flutter/material.dart';
import 'colors.dart';

final radius = const BorderRadius.all(const Radius.circular(3));
final radius3 = const BorderRadius.all(const Radius.circular(4));
final radius5 = const BorderRadius.all(const Radius.circular(16));
final borders = const BorderSide(width: 1, color: borderColorLog);
final focusBorders = const BorderSide(width: 2, color: forButtons);
final errorBorders = const BorderSide(width: 1, color: redThings);

final styleForBorder =
    OutlineInputBorder(borderSide: borders, borderRadius: radius);

final styleForBorder2 =
    OutlineInputBorder(borderSide: borders, borderRadius: radius);

final styleFocus =
    OutlineInputBorder(borderSide: focusBorders, borderRadius: radius);

final styleError =
    OutlineInputBorder(borderSide: errorBorders, borderRadius: radius);

final otpBorderRadius = const BorderRadius.all(const Radius.circular(30));
final otpBorderSide = const BorderSide(width: 2, color: redThings);
final otpBorderSide2 = const BorderSide(width: 2, color: borderColorLog);

final otpError = OutlineInputBorder(
    borderRadius: otpBorderRadius, borderSide: otpBorderSide);
final otpFocusedError = const OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: redThings),
    borderRadius: const BorderRadius.all(const Radius.circular(30)));
final otpEnabled = const OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: borderColorLog),
    borderRadius: const BorderRadius.all(const Radius.circular(30)));
final otpFocused = const OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: borderColorLog),
    borderRadius: const BorderRadius.all(const Radius.circular(30)));

final oldStyle = InputDecoration(
  errorStyle: const TextStyle(fontSize: 7),
  contentPadding: const EdgeInsets.all(10),
  enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: borderColorLog),
      borderRadius: const BorderRadius.all(const Radius.circular(30))),
  focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: borderColorLog),
      borderRadius: const BorderRadius.all(const Radius.circular(30))),
  errorBorder: const OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: redThings),
      borderRadius: const BorderRadius.all(const Radius.circular(30))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 2, color: redThings),
      borderRadius: const BorderRadius.all(const Radius.circular(30))),
);
