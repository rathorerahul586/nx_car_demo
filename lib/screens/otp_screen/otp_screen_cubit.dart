import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nx_car_demo/screens/login_screen/models/signup_request_model.dart';
import 'package:nx_car_demo/screens/otp_screen/models/otp_verification_request_model.dart';

import '../../utils/screen_navigator.dart';
import '../login_screen/login_repository.dart';

/// Cubit class to manage the state of the [OTPScreen].
class OTPScreenCubit extends Cubit<OTPScreenCubitState> {
  /// Default OTP value for testing purposes.
  final SignupRequestModel _requestModel;
  int? otp;

  OTPScreenCubit(
    this._requestModel,
    this.otp,
  ) : super(const OTPScreenCubitState());

  /// Text editing controllers for the OTP input fields.
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  /// Resends OTP.
  Future<void> resendOtp() async {
    emit(state.copyWith(showButtonLoader: true));
    // Hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    var response = await LoginRepository.getInstance.signUp(_requestModel);

    debugPrint('response - ${response?.data}');
    if (response?.data != null) {
      otp = response?.data?.otp;
      debugPrint('otp - $otp');
      if (otp != null) {
        controller1.clear();
        controller2.clear();
        controller3.clear();
        controller4.clear();
      } else {
        Get.snackbar('Server Error', 'Failed to send OTP');
      }
    } else {
      Get.snackbar('Server Error', response?.error ?? '');
    }

    emit(state.copyWith(isInvalidOtp: false, showButtonLoader: false));
  }

  /// Validates OTP entered by the user.
  Future<void> validateOtp() async {
    var otp =
        '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';

    emit(state.copyWith(showButtonLoader: true));
    // Hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    var response = await LoginRepository.getInstance
        .otpVerification(OTPVerificationRequestModel(
      mobile: _requestModel.mobile,
      otp: otp,
    ));

    if (response?.data != null) {
      emit(state.copyWith(isInvalidOtp: false, showButtonLoader: false));
      Get.find<ScreenNavigator>().moveToLandingScreen();
    } else {
      Get.snackbar('Signup Failed', response?.error ?? '');
    }
    emit(state.copyWith(isInvalidOtp: true, showButtonLoader: false));
  }

  /// Replaces middle numbers of the phone number with asterisks for privacy.
  String secureMiddleNumbers(String phoneNumber) {
    if (phoneNumber.length > 10) {
      return phoneNumber.replaceRange(5, 11, '*' * 6);
    }
    return phoneNumber.replaceRange(2, 8, '*' * 6);
  }
}

class OTPScreenCubitState extends Equatable {
  /// Indicates whether Invalid OTP related components need to show.
  final bool isInvalidOtp;

  /// Show a loading indicator when [showButtonLoader] is true,
  final bool showButtonLoader;

  const OTPScreenCubitState(
      {this.isInvalidOtp = false, this.showButtonLoader = false});

  @override
  List<Object?> get props => [isInvalidOtp, showButtonLoader];

  OTPScreenCubitState copyWith({bool? isInvalidOtp, bool? showButtonLoader}) {
    return OTPScreenCubitState(
      isInvalidOtp: isInvalidOtp ?? this.isInvalidOtp,
      showButtonLoader: showButtonLoader ?? this.showButtonLoader,
    );
  }
}
