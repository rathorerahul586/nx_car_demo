import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nx_car_demo/constants/app_assets_name.dart';

import '../../utils/screen_navigator.dart';

/// A custom toolbar widget that displays a back button.
///
/// The [AppToolbar] widget includes a back button that navigates to the previous screen when tapped.
class AppToolbar extends StatefulWidget {
  const AppToolbar({super.key});

  @override
  State<AppToolbar> createState() => _AppToolbarState();
}

class _AppToolbarState extends State<AppToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.find<ScreenNavigator>().moveToBack(),
            child: SvgPicture.asset(AppAssetsName.icBackButton),
          )
        ],
      ),
    );
  }
}
