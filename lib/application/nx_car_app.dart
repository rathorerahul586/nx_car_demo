import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nx_car_demo/application/app_binding.dart';
import 'package:nx_car_demo/themes/app_colors.dart';

import '../screens/onboarding/on_boarding_screen.dart';

/// The main application widget for the NxCarApp.
///
/// This widget is the entry point of the application and sets up the
/// necessary configurations such as orientation, theme, and initial bindings.
class NxCarApp extends StatelessWidget {
  const NxCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the preferred device orientation to portrait mode only.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Specify the initial bindings to be loaded when the app starts.
      initialBinding: AppBinding(),
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primary.toColor(),
              selectionColor: AppColors.primary.toColor(),
              selectionHandleColor: AppColors.primary.toColor())),
      // Set the initial screen of the app to the OnboardingScreen.
      // TODO need to show landing screen if already logged in.
      home: const OnboardingScreen(),
    );
  }
}
