import 'package:flutter/material.dart';
import 'package:nx_car_demo/themes/app_colors.dart';
import 'package:nx_car_demo/themes/app_styles.dart';

/// A custom button widget that displays a text label and an optional loader.
///
/// The [AppButton] widget can show a loading indicator when [showLoader] is true,
/// and it will disable the onTap callback in this case.
class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool showLoader;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.showLoader = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.showLoader == false ? widget.onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
              color: widget.showLoader
                  ? AppColors.primary.toColor().withOpacity(0.5)
                  : AppColors.primary.toColor(),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.showLoader) ...[
                const SizedBox(
                  height: 12,
                  width: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8)
              ],
              Text(
                widget.text,
                style: AppStyles.getNoto400Style(
                    color: Colors.white, fontSize: 16),
              ),
            ],
          )),
    );
  }
}
