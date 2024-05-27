import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nx_car_demo/common/widgets/app_text_field/app_text_field_cubit.dart';
import 'package:nx_car_demo/constants/app_strings.dart';
import 'package:nx_car_demo/screens/login_screen/login_screen.dart';
import 'package:nx_car_demo/utils/string_extenstion.dart';

import '../../utils/screen_navigator.dart';

/// The [LoginScreenCubit] class extends [Cubit] and manages the state and business logic
/// for the [LoginScreen].
class LoginScreenCubit extends Cubit<LoginScreenCubitState> {
  final numberTextFieldCubit = AppTextFieldCubit();
  final nameTextFieldCubit = AppTextFieldCubit();
  final emailTextFieldCubit = AppTextFieldCubit();
  final vehicleNumberTextFieldCubit = AppTextFieldCubit();

  LoginScreenCubit() : super(const LoginScreenCubitState());

  /// Validates the input fields in the login form and triggers the login process.
  void validateForm() {
    if (numberTextFieldCubit.text.isValidPhoneNumber) {
      numberTextFieldCubit.setErrorText();
    } else {
      numberTextFieldCubit.setErrorText(
          errorText: AppStrings.pleaseEnterValidNumber);
      return;
    }

    if (nameTextFieldCubit.text.isNotEmpty) {
      nameTextFieldCubit.setErrorText();
    } else {
      nameTextFieldCubit.setErrorText(
          errorText: AppStrings.pleaseEnterValidName);
      return;
    }

    if (emailTextFieldCubit.text.isEmail) {
      emailTextFieldCubit.setErrorText();
    } else {
      emailTextFieldCubit.setErrorText(
          errorText: AppStrings.pleaseEnterValidEmail);
      return;
    }

    if (vehicleNumberTextFieldCubit.text.isValidVehicleNumber) {
      vehicleNumberTextFieldCubit.setErrorText();
    } else {
      vehicleNumberTextFieldCubit.setErrorText(
          errorText: AppStrings.pleaseEnterValidVehicleNo);
      return;
    }

    // Perform login after successful validation
    performLogin();
  }

  /// Simulates the login process and navigates to the OTP screen.
  Future<void> performLogin() async {
    emit(state.copyWith(showButtonLoader: true));
    // Hide keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    await Future.delayed(const Duration(seconds: 2));
    // Navigate to OTP screen
    Get.find<ScreenNavigator>().moveToOtpScreen(numberTextFieldCubit.text);
    emit(state.copyWith(showButtonLoader: false));
  }
}

/// The [LoginScreenCubitState] class represents the state of the [LoginScreenCubit].
class LoginScreenCubitState extends Equatable {
  /// The error text to be displayed for invalid input fields.
  final String errorText;

  /// A flag indicating whether to show a loader on the login button.
  final bool showButtonLoader;

  const LoginScreenCubitState(
      {this.errorText = '', this.showButtonLoader = false});

  @override
  List<Object?> get props => [errorText, showButtonLoader];

  /// Creates a copy of the current state with optional new values.
  LoginScreenCubitState copyWith({String? errorText, bool? showButtonLoader}) {
    return LoginScreenCubitState(
      errorText: errorText ?? this.errorText,
      showButtonLoader: showButtonLoader ?? this.showButtonLoader,
    );
  }
}
