import 'package:flutter/services.dart';

/// A [TextInputFormatter] that formats vehicle numbers.
///
/// The [VehicleNumberFormatter] class capitalizes and removes spaces from the input text.
class VehicleNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove leading and trailing spaces, replace spaces with empty string, and capitalize the text
    final capitalizedText =
        newValue.text.trim().replaceAll(' ', '').toUpperCase();

    // Return the updated text value with the formatted text
    return newValue.copyWith(
      text: capitalizedText,
    );
  }
}
