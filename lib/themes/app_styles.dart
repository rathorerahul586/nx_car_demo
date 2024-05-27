import 'package:flutter/material.dart';

/// A utility class that holds the text styles used in the application.
///
/// The [AppStyles] class provides a centralized place for defining and
/// managing text styles, making it easier to maintain a consistent look
/// and feel throughout the application.
class AppStyles {
  AppStyles._();

  // Font family names
  static const _interFont = 'Inter';
  static const _natoSansFont = 'NotoSans';

  /// Returns a [TextStyle] with the Inter font family, weight 600.
  static TextStyle getInter600Style({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      fontFamily: _interFont,
    );
  }

  /// Returns a [TextStyle] with the Noto Sans font family, weight 500.
  static TextStyle getNoto500Style({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      fontFamily: _natoSansFont,
    );
  }

  /// Returns a [TextStyle] with the Noto Sans font family, weight 400.
  static TextStyle getNoto400Style({
    Color color = Colors.black,
    double fontSize = 14,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontFamily: _natoSansFont,
    );
  }
}
