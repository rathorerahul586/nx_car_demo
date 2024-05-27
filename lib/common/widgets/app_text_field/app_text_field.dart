import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nx_car_demo/common/widgets/app_text_field/app_text_field_cubit.dart';
import 'package:nx_car_demo/themes/app_colors.dart';
import 'package:nx_car_demo/themes/app_styles.dart';

/// A custom text field widget with additional features such as input formatters,
/// custom keyboard types, and validation error messages.
class AppTextField extends StatefulWidget {
  /// The label text for the text field.
  final String? labelText;

  /// Determines whether to show an asterisk (*) with [labelText] to indicate required field. Default is `true`.
  final bool isRequired;

  /// Sets the keyboard type for the text field. Default value is [TextInputType.text].
  final TextInputType textInputType;

  /// List of [TextInputFormatter] to handle and modify user inputs.
  final List<TextInputFormatter> textInputFormatter;

  /// Sets the action button on the keyboard.  Default value is [TextInputAction.done]
  final TextInputAction inputAction;

  const AppTextField({
    super.key,
    this.labelText,
    this.isRequired = true,
    this.textInputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.textInputFormatter = const [],
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final AppTextFieldCubit _cubit =
      BlocProvider.of<AppTextFieldCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTextFieldCubit, AppTextFieldCubitState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextField(
            focusNode: _cubit.focusNode,
            cursorColor: AppColors.primary.toColor(),
            controller: _cubit.controller,
            keyboardType: widget.textInputType,
            textCapitalization: TextCapitalization.words,
            inputFormatters: widget.textInputFormatter,
            textInputAction: widget.inputAction,
            decoration: InputDecoration(
              label: getLabelText(),
              labelStyle: AppStyles.getNoto500Style(
                  color: AppColors.color585A5A.toColor(), fontSize: 16),
              filled: true,
              fillColor: state.isFocused
                  ? AppColors.primaryLight.toColor()
                  : AppColors.colorF7FAF8.toColor(),
              isCollapsed: true,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryLight.toColor(), width: 0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.color6F7978.toColor(), width: 0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          errorTextView()
        ]);
      },
    );
  }

  /// Returns a widget to show the field error message to the user.
  Widget errorTextView() {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      child: _cubit.state.errorText.isEmpty
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 4),
                Text(
                  _cubit.state.errorText,
                  style: AppStyles.getNoto400Style(
                      color: AppColors.colorBA1A1A.toColor(), fontSize: 12),
                )
              ],
            ),
    );
  }

  /// Returns a [RichText] widget to show an asterisk (*) for mandatory text fields.
  RichText getLabelText() {
    return RichText(
      text: TextSpan(
        text: widget.labelText,
        style: AppStyles.getNoto500Style(
            color: AppColors.color6F7978.toColor(), fontSize: 16),
        children: [
          if (widget.isRequired) ...[
            const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ],
      ),
    );
  }
}
