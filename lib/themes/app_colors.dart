import 'dart:ui';

/// A utility class that holds the color constants used in the application.
///
/// The [AppColors] class provides a centralized place for all the colors used
/// in the application, making it easier to manage and update them.
class AppColors {
  static const primary = "#42C8C1";
  static const primaryLight = "#E0FFFA";
  static const lightGrey = "#D9D9D9";
  static const color242424 = "#242424";
  static const color585A5A = "#585A5A";
  static const color6F7978 = "#6F7978";
  static const colorF7FAF8 = "#F7FAF8";
  static const colorB7B7B7 = "#B7B7B7";
  static const colorBA1A1A = "#BA1A1A";
}

/// An extension on [String] to convert hex color strings to [Color] objects.
extension ColorsExtension on String {
  /// Converts a hex color string to a [Color] object.
  ///
  /// The hex color string can be in the format 'RRGGBB' or 'AARRGGBB'.
  /// If the string is in 'RRGGBB' format, it assumes full opacity.
  Color toColor() {
    var hexColor = replaceAll('#', '');

    // Add 'FF' for full opacity if only 'RRGGBB' format is provided
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    // Return the color by parsing the hex string
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    // Default case, if the input is not correctly formatted
    throw const FormatException("Invalid hex color format");
  }
}
