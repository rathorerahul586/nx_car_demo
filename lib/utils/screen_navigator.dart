import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nx_car_demo/screens/landing_screen/landing_screen.dart';
import 'package:nx_car_demo/screens/login_screen/login_screen.dart';
import 'package:nx_car_demo/screens/otp_screen/otp_screen.dart';

/// A utility class for navigating between screens.
///
/// The [ScreenNavigator] class provides methods to easily navigate between different screens
/// using the GetX navigation library.
class ScreenNavigator {
  /// Navigates back to the previous screen.
  void moveToBack() {
    Get.back();
  }

  /// Navigates to the login screen.
  void moveToLoginScreen() {
    Get.to(const LoginScreen(), transition: Transition.rightToLeft);
  }

  /// Navigates to the OTP screen with the provided phone number.
  /// - [phoneNumber]: The phone number to pass to the OTP screen.
  void moveToOtpScreen(String phoneNumber) {
    Get.to(OTPScreen(phoneNumber: phoneNumber),
        transition: Transition.rightToLeft);
  }

  /// Navigates to the landing screen.
  void moveToLandingScreen() {
    Get.offAll(const LandingScreen());
  }
}
