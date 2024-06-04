import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx_car_demo/constants/app_strings.dart';
import 'package:nx_car_demo/screens/login_screen/models/signup_request_model.dart';
import 'package:nx_car_demo/themes/app_colors.dart';
import 'package:nx_car_demo/themes/app_styles.dart';

import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_toolbar.dart';
import 'otp_screen_cubit.dart';

/// The [OTPScreen] class is a StatefulWidget representing the screen for entering OTP during
/// the login process.
class OTPScreen extends StatefulWidget {
  /// The phone number to which the OTP was sent.
  final SignupRequestModel requestModel;
  final int otp;

  const OTPScreen({
    super.key,
    required this.requestModel,
    required this.otp,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final OTPScreenCubit _cubit = OTPScreenCubit(
    widget.requestModel,
    widget.otp,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppToolbar(),
            Expanded(
              child: SingleChildScrollView(
                child: _mainBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the main body of the OTP screen.
  Widget _mainBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: BlocBuilder<OTPScreenCubit, OTPScreenCubitState>(
          bloc: _cubit,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _screenHeader(),
                const SizedBox(height: 24),
                _buildOTPFields(),
                GestureDetector(
                  onTap: () => state.isInvalidOtp ? null : _cubit.resendOtp(),
                  child: Text(
                    state.isInvalidOtp
                        ? AppStrings.invalidOtp
                        : AppStrings.resend,
                    style: AppStyles.getNoto400Style(
                        color: state.isInvalidOtp
                            ? AppColors.colorBA1A1A.toColor()
                            : AppColors.primary.toColor(),
                        fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),
                AppButton(
                  text:
                      state.isInvalidOtp ? AppStrings.resend : AppStrings.next,
                  onTap: () => state.isInvalidOtp
                      ? _cubit.resendOtp()
                      : _cubit.validateOtp(),
                  showLoader: state.showButtonLoader,
                ),
                // todo remove after api implementation
                const SizedBox(height: 16),
                Text(
                  '*For testing purpose valid OTP is ${_cubit.otp}',
                  style: AppStyles.getNoto500Style(
                      color: AppColors.color585A5A.toColor(), fontSize: 12),
                )
              ],
            );
          }),
    );
  }

  /// Builds the header section of the OTP screen.
  Widget _screenHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.enterYourOTP,
          style: AppStyles.getNoto500Style(
              color: AppColors.color585A5A.toColor(), fontSize: 24),
        ),
        Text(
          _cubit.secureMiddleNumbers(widget.requestModel.mobile ?? ''),
          style: AppStyles.getNoto500Style(
              color: AppColors.color585A5A.toColor(), fontSize: 16),
        ),
      ],
    );
  }

  /// Builds the OTP input fields.
  Widget _buildOTPFields() {
    return Row(
      children: [
        _buildOTPTextField(true, false, _cubit.controller1),
        const SizedBox(width: 16),
        _buildOTPTextField(false, false, _cubit.controller2),
        const SizedBox(width: 16),
        _buildOTPTextField(false, false, _cubit.controller3),
        const SizedBox(width: 16),
        _buildOTPTextField(false, true, _cubit.controller4),
      ],
    );
  }

  /// Builds a single OTP input text field.
  Widget _buildOTPTextField(
      bool first, bool last, TextEditingController textController) {
    return SizedBox(
      width: 48,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: textController,
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: AppStyles.getNoto500Style(fontSize: 28),
        decoration: InputDecoration(
          counter: const Offstage(),
          contentPadding: EdgeInsets.zero,
          focusColor: AppColors.primary.toColor(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary.toColor()),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
        ),
      ),
    );
  }
}
