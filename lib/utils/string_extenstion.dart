/// An extension on [String]
extension StringExtension on String? {
  /// Validate phone number. Return 'true' if phone number is valid.
  /// This function validate only indian phone numbers
  ///
  /// Valid formats are [+919999999999, 9999999999, 919999999999]
  bool get isValidPhoneNumber {
    return RegExp(
            r'^(?:\s+|)((0|(\+|)91)(?:\s|-)*(?:\d(?:\s|-)*\d{9}|\d{2}(?:\s|-)*\d{8}|\d{3}(?:\s|-)*\d{7})|\d{10})(?:\s+|)$')
        .hasMatch(this ?? '');
  }

  /// Validate indian vehicle numbers.
  ///
  /// Valid formats are [AB12CD3456, AB1CD1234, AB12C1234]
  bool get isValidVehicleNumber {
    return RegExp(r'^[A-Z]{2}[0-9]{1,2}[A-Z]?(?:[A-Z]*)?[0-9]{4}$')
        .hasMatch(this ?? '');
  }

  /// Validate name.
  /// - allowing Alphabets, Dots, Spaces
  /// - DOT never comes at the start of the name
  /// - unicode are not allowed
  /// Valid formats are [Rahul, Rahul Kumar, Mr. Rahul Kumar etc]
  bool get isValidName {
    return RegExp(r'^[A-Za-z\s]+[.]?[A-Za-z\s]*$')
        .hasMatch(this ?? '');
  }
}
