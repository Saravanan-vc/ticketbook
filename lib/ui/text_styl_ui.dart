import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticketbook/ui/color.dart';

class TextStylUi {
  TextStylUi._();
  static TextStyle normalBold() {
    return TextStyle(
        color: ColorClass.palBlack,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,);
  }
   static TextStyle simple01() {
    return TextStyle(
        color: ColorClass.palBlack,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,);
  }
  static TextStyle simple01W() {
    return TextStyle(
        color: ColorClass.palWhite,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,);
  }
   static TextStyle normalBold01() {
    return TextStyle(
        color: ColorClass.palBlack,
        fontSize: 25.sp,
        fontWeight: FontWeight.w600);
  }
}
