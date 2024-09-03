import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll("#", "");
    if(color.length == 6) {
      color = "FF$color";
    }
    return Color(int.parse(color, radix: 16));
  }
}

class ColorManager {
  static Color black = HexColor.hexString("#000000");
  static Color black1 = HexColor.hexString("#181725");
  static Color white = HexColor.hexString("#FFFFFF");
  static Color appBarWhite = HexColor.hexString("#F6F6F6");
  static Color grey = HexColor.hexString("#FCFCFC");
  static Color grey3 = HexColor.hexString("#F2F3F2");
  static Color grey1 = HexColor.hexString("#828282");
  static Color grey2 = HexColor.hexString("#4C4F4D");
  static Color blue = HexColor.hexString("#5383EC");
  static Color deepBlue = HexColor.hexString("#4A66AC");
  static Color green = HexColor.hexString("#53B175");
  static Color lightYellow = HexColor.hexString("#F8A44C");

}