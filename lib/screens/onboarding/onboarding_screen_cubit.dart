import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../constants/app_strings.dart';
import '../../utils/screen_navigator.dart';
import 'icon_positions.dart';

/// Cubit responsible for managing the state of the onboarding screen.
///
/// The [OnboardingScreenCubit] manages the state of the onboarding screen,
/// including the current step in the onboarding process and the alignment of
/// the icons displayed on the screen.
class OnboardingScreenCubit extends Cubit<OnboardingScreenCubitState> {
  OnboardingScreenCubit() : super(const OnboardingScreenCubitState());

  /// Alignments for the five icons displayed on the onboarding screen.
  ///
  /// Each icon has a specific alignment position defined in the [IconPositions] class.
  Alignment firstIconAlignment = IconPositions.topRight.position;
  Alignment secondIconAlignment = IconPositions.topLeft.position;
  Alignment thirdIconAlignment = IconPositions.center.position;
  Alignment fourthIconAlignment = IconPositions.bottomLeft.position;
  Alignment fifthIconAlignment = IconPositions.bottomRight.position;

  /// Rotates the images displayed on the onboarding screen.
  ///
  /// This method cycles through different alignments for the icons,
  /// creating a rotating effect on the screen.
  void circulateImages() {
    var step = state.iconsStep == 4 ? 0 : state.iconsStep + 1;

    switch (step) {
      case 0:
        firstIconAlignment = IconPositions.topRight.position;
        secondIconAlignment = IconPositions.topLeft.position;
        thirdIconAlignment = IconPositions.center.position;
        fourthIconAlignment = IconPositions.bottomLeft.position;
        fifthIconAlignment = IconPositions.bottomRight.position;
      case 1:
        firstIconAlignment = IconPositions.topRight.position;
        secondIconAlignment = IconPositions.center.position;
        thirdIconAlignment = IconPositions.topLeft.position;
        fourthIconAlignment = IconPositions.bottomLeft.position;
        fifthIconAlignment = IconPositions.bottomRight.position;
      case 2:
        firstIconAlignment = IconPositions.topRight.position;
        secondIconAlignment = IconPositions.bottomLeft.position;
        thirdIconAlignment = IconPositions.topLeft.position;
        fourthIconAlignment = IconPositions.center.position;
        fifthIconAlignment = IconPositions.bottomRight.position;
      case 3:
        firstIconAlignment = IconPositions.topRight.position;
        secondIconAlignment = IconPositions.bottomRight.position;
        thirdIconAlignment = IconPositions.topLeft.position;
        fourthIconAlignment = IconPositions.bottomLeft.position;
        fifthIconAlignment = IconPositions.center.position;
      case 4:
        firstIconAlignment = IconPositions.topLeft.position;
        secondIconAlignment = IconPositions.topRight.position;
        thirdIconAlignment = IconPositions.bottomLeft.position;
        fourthIconAlignment = IconPositions.bottomRight.position;
        fifthIconAlignment = IconPositions.center.position;
    }
    emit(state.copyWith(iconsStep: step));

    // Delay execution for steps 3 and 4 to create a rotating effect
    if (step == 2 || step == 3) {
      Future.delayed(const Duration(seconds: 1), () {
        circulateImages();
      });
    }
  }

  /// Handles the tap event on the "Next" button.
  ///
  /// If the current step is the last step (Step 3), navigates to the login screen.
  /// Otherwise, rotates the images and moves to the next step.
  void onNextButtonTap() {
    if (state.currentStep == 2) {
      emit(state.copyWith(currentStep: 0, iconsStep: 0));
      Get.find<ScreenNavigator>().moveToLoginScreen();
    } else {
      circulateImages();
      _moveToNextStep();
    }
  }

  /// Moves to the next step in the onboarding process.
  void _moveToNextStep() {
    var step = state.currentStep + 1;
    emit(state.copyWith(currentStep: step));
  }

  /// Retrieves the text corresponding to the current step.
  ///
  /// Returns the appropriate string based on the current step in the onboarding process.
  String aboutStringText() {
    String text = AppStrings.buyAPreOwnedCarWithConfidence;
    switch (state.currentStep) {
      case 0:
        text = AppStrings.buyAPreOwnedCarWithConfidence;
        break;
      case 1:
        text = AppStrings.revUpYourDreamsWithOurUsedCarLoans;
        break;
      case 2:
        text = AppStrings.simplifiedUsedCarFinancingWithNxcar;
        break;
    }
    return text;
  }
}

class OnboardingScreenCubitState extends Equatable {
  /// Indicate the current onboarding step
  final int currentStep;

  /// Indicate the current icons step
  final int iconsStep;

  const OnboardingScreenCubitState({this.currentStep = 0, this.iconsStep = 0});

  @override
  List<Object?> get props => [currentStep, iconsStep];

  OnboardingScreenCubitState copyWith({int? currentStep, int? iconsStep}) {
    return OnboardingScreenCubitState(
      currentStep: currentStep ?? this.currentStep,
      iconsStep: iconsStep ?? this.iconsStep,
    );
  }
}
