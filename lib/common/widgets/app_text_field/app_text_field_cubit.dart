import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit class to manage the state of the AppTextField widget.
///
/// The AppTextFieldCubit handles the focus state and the error text of the text field.
class AppTextFieldCubit extends Cubit<AppTextFieldCubitState> {
  AppTextFieldCubit() : super(const AppTextFieldCubitState()) {
    /// Listener to update the state when the focus changes.
    focusNode.addListener(() {
      emit(state.copyWith(isFocused: focusNode.hasFocus));
    });

    /// Listener to remove error text when the text field's content changes.
    controller.addListener(() {
      setErrorText();
    });
  }

  /// The [FocusNode] for the text field.
  final FocusNode focusNode = FocusNode();

  /// The [TextEditingController] for the text field.
  final TextEditingController controller = TextEditingController();

  /// Sets the error text for the text field and updates the state.
  ///
  /// [errorText] is the error message to be displayed.
  void setErrorText({String errorText = ''}) {
    emit(state.copyWith(errorText: errorText));
  }

  /// Returns the current text in the text field.
  String get text => controller.text;
}

class AppTextFieldCubitState extends Equatable {
  /// Indicates whether the text field is focused.
  final bool isFocused;

  /// The error text to be displayed.
  final String errorText;

  const AppTextFieldCubitState({this.isFocused = false, this.errorText = ''});

  @override
  List<Object?> get props => [errorText, isFocused];

  /// Returns a copy of the current state with updated values.
  AppTextFieldCubitState copyWith({bool? isFocused, String? errorText}) {
    return AppTextFieldCubitState(
      errorText: errorText ?? this.errorText,
      isFocused: isFocused ?? this.isFocused,
    );
  }
}
