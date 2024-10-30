import 'package:flutter/material.dart';

class TextFWidget {
  TextFWidget._();

  static TextFormField fromCus(Color bColor, String hint, Color textC,TextEditingController textec) {
    return TextFormField(
      controller: textec,
      style: TextStyle(color: textC),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: bColor, width: 0.8)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: bColor, width: 0.8)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: bColor, width: 0.8)),
        hintText: hint,
        hintStyle: TextStyle(color: textC),
      ),
    );
  }
}
