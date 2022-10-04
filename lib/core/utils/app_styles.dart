import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'size_config.dart';

class AppStyles {
  AppStyles._();
  static final TextStyle w500TextStyle = TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.w500, fontSize: SizeConfig.defaultSize! * 2);
  static final TextStyle w600TextStyleBlack = TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: SizeConfig.defaultSize! * 1.8);
  static const TextStyle whiteBoldTextStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  static const InputDecoration inputDecorationUnderlinedMainColored = InputDecoration(
      border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.mainColor)),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.mainColor)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.mainColor)),
      disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.mainColor)));
  static InputDecoration inputDecorationUnderlinedMainColoredWithSuffixIcon = inputDecorationUnderlinedMainColored.copyWith(
      suffixIcon: Icon(
    Icons.keyboard_arrow_down_rounded,
    size: SizeConfig.defaultSize! * 4.2,
    color: AppColors.mainColor,
  ));
  static const BoxDecoration topLeftBottomRightRadiusBoxDecoration =
      BoxDecoration(color: Color.fromARGB(255, 32, 28, 28), borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15)));
}
