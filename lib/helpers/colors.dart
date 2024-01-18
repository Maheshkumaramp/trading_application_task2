import 'package:flutter/material.dart';
import 'package:trading_app_task2/helpers/config.dart';

class COLORS{
  static Color backgroundColor() {
    if (Config.brightness ==Brightness.light) {
      return Color(0xffFBFDF9);
    } else {
      return Color(0xff000000);
    }
  }
  static Color cardColor() {
    if (Config.brightness ==Brightness.light) {
      return Color(0xffFFFFFF);
    } else {
      return Color(0xff252A30);
    }
  }

  static Color textColor() {
    if (Config.brightness ==Brightness.light) {
      return Color(0xff000000);
    } else {
      return Color(0xffBAC2CC);
    }
  }
  static const Color black = Color(0xff000000);
  static const Color blackLight = Color(0xff333333);
  static const Color blackExtraLight = Color(0xff5D6166);
  static const Color blackDark = Color(0xff282C33);
  static const Color blueDark = Color(0xff252A30);
  static const Color blackExtraDark = Color(0xff17181A);
  static const Color whiteBorder = Color(0xffEEEEEE);
  static const Color white = Color(0xffFFFFFF);
  static const Color blue = Color(0xff0575E6);
  static const Color blueLight = Color(0xff4597FF);
  static const Color greenLight = Color(0xff39A798);
  static const Color whiteLight = Color(0xffBAC2CC);
  static const Color redLight = Color(0xffE96D6D);
  static const Color blueSecondary = Color(0xffD1E5FF);
  static const Color blueExtraLight= Color(0xffF0F6FD);
}