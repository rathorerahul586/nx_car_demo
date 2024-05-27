import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nx_car_demo/constants/app_assets_name.dart';
import 'package:nx_car_demo/themes/app_colors.dart';

import '../../themes/app_styles.dart';
import 'onboarding_screen_cubit.dart';

/// A screen for onboarding new users to the application.
///
/// The [OnboardingScreen] displays a series of screens introducing the user
/// to the features and benefits of the application.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingScreenCubit _cubit = OnboardingScreenCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: BlocBuilder<OnboardingScreenCubit, OnboardingScreenCubitState>(
          bloc: _cubit,
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 24),
                    child: SvgPicture.asset(AppAssetsName.appIcon),
                  ),
                  mainBody(),
                  Padding(
                    padding: const EdgeInsets.only(top: 46, bottom: 8),
                    child: aboutScreenText(),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 27),
                      child: dotsAndNextButton()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds the text describing the current step in the onboarding process.
  Widget aboutScreenText() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        _cubit.aboutStringText(),
        key: ValueKey<int>(_cubit.state.currentStep),
        textAlign: TextAlign.center,
        style: AppStyles.getInter600Style(
            color: AppColors.color242424.toColor(), fontSize: 28),
      ),
    );
  }

  /// Builds the stepper dots and next button.
  Widget dotsAndNextButton() {
    return Row(
      children: [
        stepper(),
        const Spacer(),
        GestureDetector(
            onTap: () => _cubit.onNextButtonTap(),
            child: SvgPicture.asset(height: 64, AppAssetsName.circleNextButton))
      ],
    );
  }

  /// Builds the stepper dots indicating the progress of the onboarding process.
  Widget stepper() {
    final currentStep = _cubit.state.currentStep;
    double selectorPos = 0;
    double firstDotPos = 68;
    double secondDotPos = 0;
    switch (currentStep) {
      case 0:
        selectorPos = 40;
        firstDotPos = 20;
        secondDotPos = 0;

      case 1:
        selectorPos = 20;
        firstDotPos = 68;
        secondDotPos = 0;

      case 2:
        selectorPos = 0;
        firstDotPos = 68;
        secondDotPos = 48;
    }
    return SizedBox(
      width: 80,
      height: 12,
      child: Stack(
        children: [
          stepDot(firstDotPos, false),
          stepDot(secondDotPos, false),
          stepDot(selectorPos, true),
        ],
      ),
    );
  }

  /// Builds a single stepper dot.
  Widget stepDot(double pos, bool isSelectorIndicator) {
    return AnimatedPositioned(
        right: pos,
        width: isSelectorIndicator ? 40 : 12,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
        child: Container(
          height: 12,
          width: isSelectorIndicator ? 40 : 12,
          decoration: BoxDecoration(
            color: isSelectorIndicator
                ? AppColors.primary.toColor()
                : AppColors.lightGrey.toColor(),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ));
  }

  /// Builds the main body of the onboarding screen, including background images.
  Widget mainBody() {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(AppAssetsName.onboardBg),
          ),
          alignedSvg(_cubit.firstIconAlignment, AppAssetsName.onboard1),
          alignedSvg(_cubit.secondIconAlignment, AppAssetsName.onboard2),
          alignedSvg(_cubit.thirdIconAlignment, AppAssetsName.onboard3),
          alignedSvg(_cubit.fourthIconAlignment, AppAssetsName.onboard4),
          alignedSvg(_cubit.fifthIconAlignment, AppAssetsName.onboard5),
        ],
      ),
    );
  }

  /// Aligns an SVG image within the stack based on provided alignment.
  Widget alignedSvg(Alignment align, String svgName) {
    return AnimatedAlign(
        alignment: align,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
        child: SvgPicture.asset(svgName));
  }
}
