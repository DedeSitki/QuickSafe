import 'package:flutter/material.dart';

class ExtPageText {
  static TxtStyle(FontWeight font_weight, double font_size, Color color) {
    return TextStyle(
        fontWeight: font_weight, fontSize: font_size, color: color);
  }

  static TxtStyleWithFontFamily(FontWeight font_weight, double font_size,
      Color color, String font_family) {
    return TextStyle(
      fontWeight: font_weight,
      fontSize: font_size,
      color: color,
      fontFamily: font_family,
    );
  }
}
