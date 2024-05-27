import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nx_car_demo/constants/app_assets_name.dart';
import 'package:nx_car_demo/constants/app_strings.dart';
import 'package:nx_car_demo/themes/app_colors.dart';
import 'package:nx_car_demo/themes/app_styles.dart';

import '../../common/widgets/app_toolbar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppToolbar(),
            _mainBody(),
          ],
        ),
      ),
    );
  }

  Widget _mainBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          SvgPicture.asset(AppAssetsName.loginSuccess),
          const SizedBox(height: 48),
          Text(
            AppStrings.youreSuccessfullyLoggedIn,
            style: AppStyles.getNoto500Style(
                color: AppColors.color585A5A.toColor(), fontSize: 24),
          ),
        ],
      ),
    );
  }
}
