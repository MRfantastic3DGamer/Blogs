import 'package:blogs/Styles/ColorStyles.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blogTitle({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w900,
    Color color = ColorStyles.textColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle subSpace({
    double fontSize = 40,
    FontWeight fontWeight = FontWeight.normal,
    Color color = ColorStyles.textColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}