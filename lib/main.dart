import 'dart:async';

import 'package:flutter/material.dart';

import 'application/nx_car_app.dart';

void main() {
  runZonedGuarded(() => runApp(const NxCarApp()), (error, stack) {
    debugPrint('runZonedGuarded Error: $error | stack: $stack');
  });
}
