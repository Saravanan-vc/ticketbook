import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextsCusB {
  TextsCusB._();
  static GestureDetector textButton(
      String data, VoidCallback ontap, int fs, Color textC,FontWeight fw) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        data,
        style: TextStyle(fontSize: fs.sp, color: textC,fontWeight:fw ),
      ),
    );
  }
}
