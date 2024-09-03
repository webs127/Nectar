import 'package:flutter/material.dart';

TextStyle _textStyle(String fontFamily, double fontSize, Color color,
        FontWeight fontWeight, FontStyle fontStyle) =>
    TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );

TextStyle regularTextStyle(
        {String fontFamily = "Gilroy",
        required double fontSize,
        Color color = Colors.black,
        FontStyle fontStyle = FontStyle.normal,
        FontWeight fontWeight = FontWeight.w400}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle mediumTextStyle(
        {String fontFamily = "Gilroy-Medium",
        required double fontSize,
        Color color = Colors.black,
        FontStyle fontStyle = FontStyle.normal,
        FontWeight fontWeight = FontWeight.w400}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle blackTextStyle({
  String fontFamily = "Gilroy-ExtraBold",
  required double fontSize,
  Color color = Colors.black,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w900,
}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

TextStyle semiBoldTextStyle(
        {String fontFamily = "Gilroy-SemiBold",
        FontStyle fontStyle = FontStyle.normal,
        required double fontSize,
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.w800}) =>
    _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);

// TextStyle boldTextStyle(
//         {String fontFamily = "Gilroy-SemiBold",
//         FontStyle fontStyle = FontStyle.normal,
//         required double fontSize,
//         Color color = Colors.black,
//         FontWeight fontWeight = FontWeight.w800}) =>
//     _textStyle(fontFamily, fontSize, color, fontWeight, fontStyle);