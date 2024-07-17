import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorManager {
  static Color primary = Color(0xFF486AD7);
  static Color lightPrimary =
      const Color.fromRGBO(72, 106, 215, 0.5098039215686274);
  static Color amber = const Color.fromRGBO(221, 193, 19, 1.0);
  static Color darkBlue = const Color.fromRGBO(26, 64, 100, 1.0);
  static Color black = const Color.fromRGBO(1, 1, 1, 1.0);
  static Color commonTextColor = const Color.fromRGBO(47, 60, 78, 1.0);
  static Color gray = const Color.fromRGBO(172, 179, 194, 1.0);
  static Color darkGray = const Color.fromRGBO(80, 80, 80, 1.0);
  static Color shadowColor =
      const Color.fromRGBO(136, 134, 134, 0.25098039215686274);
  static Color cardColor = const Color.fromRGBO(248, 248, 248, 1.0);
  static Color white = const Color.fromRGBO(255, 255, 255, 1.0);
  //dark mode
  static Color darkPrimary = const Color.fromRGBO(28, 31, 36, 1.0);
}

BoxDecoration gradientBoxDecoration() {
  return Get.isDarkMode
      ? const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              Color.fromRGBO(72, 106, 215, 1.0),
              Color.fromRGBO(72, 106, 215, 0.5098039215686274),
            ]))
      : const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              Color.fromRGBO(21, 228, 231, 1.0),
              Color.fromRGBO(156, 185, 189, 1.0),
              Color.fromRGBO(199, 193, 208, 1.0),
              Color.fromRGBO(21, 228, 231, 1.0),
              Color.fromRGBO(199, 193, 208, 1.0),
              Color.fromRGBO(156, 185, 189, 1.0),
              Color.fromRGBO(21, 228, 231, 1.0),
            ]));
}
