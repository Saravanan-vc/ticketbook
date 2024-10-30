import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidgets {
  ButtonWidgets._();
  static GestureDetector buttonCus(dynamic W, String text, int hor, int ver,
      Color textC, int fs, FontWeight fw, VoidCallback action,Color backcolor) {
    return GestureDetector(
      onTap: action,
      child: Container(
        
        padding: EdgeInsets.symmetric(horizontal: hor.w, vertical: ver.w),
        width: W,
        decoration: BoxDecoration(
          color:backcolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textC, fontSize: fs.sp, fontWeight: fw),
          ),
        ),
      ),
    );
  }
}
