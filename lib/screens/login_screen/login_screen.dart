import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx_car_demo/constants/app_strings.dart';
import 'package:nx_car_demo/screens/login_screen/login_screen_cubit.dart';
import 'package:nx_car_demo/themes/app_colors.dart';
import 'package:nx_car_demo/themes/app_styles.dart';

import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_text_field/app_text_field.dart';
import '../../common/widgets/app_toolbar.dart';
import '../../utils/input_formatters/vehicle_number_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginScreenCubit _cubit = LoginScreenCubit();

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

  /// Builds the main body of the login screen.
  Widget _mainBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _screenHeader(),
          const SizedBox(height: 24),
          numberTextField(),
          const SizedBox(height: 12),
          nameTextField(),
          const SizedBox(height: 12),
          emailTextField(),
          const SizedBox(height: 12),
          vehicleNumberTextField(),
          const SizedBox(height: 24),
          BlocBuilder<LoginScreenCubit, LoginScreenCubitState>(
            bloc: _cubit,
            builder: (context, state) {
              return AppButton(
                text: AppStrings.next,
                onTap: () => _cubit.validateForm(),
                showLoader: state.showButtonLoader,
              );
            },
          )
        ],
      ),
    );
  }

  /// Builds the header section of the login screen.
  Widget _screenHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack,
          style: AppStyles.getNoto400Style(
            color: AppColors.color242424.toColor(),
            fontSize: 24,
          ),
        ),
        Text(
          AppStrings.pleaseFillOutTheDetails,
          style: AppStyles.getNoto500Style(
            color: AppColors.color585A5A.toColor(),
            fontSize: 16,
          ),
        )
      ],
    );
  }

  /// Builds the text field for entering the phone number.
  Widget numberTextField() {
    return BlocProvider.value(
      value: _cubit.numberTextFieldCubit,
      child: const AppTextField(
        labelText: AppStrings.enterYourNumber,
        textInputType: TextInputType.phone,
        inputAction: TextInputAction.next,
      ),
    );
  }

  /// Builds the text field for entering the name.
  Widget nameTextField() {
    return BlocProvider.value(
      value: _cubit.nameTextFieldCubit,
      child: const AppTextField(
        labelText: AppStrings.enterYourName,
        inputAction: TextInputAction.next,
      ),
    );
  }

  /// Builds the text field for entering the email.
  Widget emailTextField() {
    return BlocProvider.value(
      value: _cubit.emailTextFieldCubit,
      child: const AppTextField(
        labelText: AppStrings.enterYourEmail,
        textInputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
      ),
    );
  }

  /// Builds the text field for entering the vehicle number.
  Widget vehicleNumberTextField() {
    return BlocProvider.value(
      value: _cubit.vehicleNumberTextFieldCubit,
      child: AppTextField(
        labelText: AppStrings.enterYourVehicleNumber,
        textInputFormatter: [VehicleNumberFormatter()],
        inputAction: TextInputAction.done,
      ),
    );
  }
}
