import 'package:flutter/material.dart';

class XTypo {
  // UTIL: TYPOGRAPHY
  static TextStyle h6({Color? color}) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: color,
      );

  static TextStyle h7({Color? color}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: color,
      );

  static TextStyle overline({Color? color}) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle body2({Color? color}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: color,
      );

  static TextStyle caption({Color? color}) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: color,
      );
}
