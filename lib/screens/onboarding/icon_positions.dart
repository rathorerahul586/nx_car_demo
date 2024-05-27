import 'package:flutter/cupertino.dart';

/// Enum representing different positions for icons displayed on the onboarding screen.
///
/// Each position is associated with a specific [Alignment] value.
enum IconPositions {
  topLeft(Alignment(-1, -0.7)),
  topRight(Alignment.topRight),
  center(Alignment.center),
  bottomLeft(Alignment(-1, 0.7)),
  bottomRight(Alignment.bottomRight);

  final Alignment position;

  const IconPositions(this.position);
}
