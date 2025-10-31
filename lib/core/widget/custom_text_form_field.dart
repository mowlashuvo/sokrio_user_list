import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnChanged<T> = void Function(T value);
typedef GetField<S, T> = T Function(S state);

class CustomBlocTextField<B extends BlocBase<S>, S, T> extends StatelessWidget {
  final String? labelText;
  final OnChanged<T> onChanged;
  final GetField<S, T> getField;
  final bool obscureText;
  final bool isRequired;
  final TextInputType keyboardType;
  final int? maxLines;
  final AutovalidateMode autoValidateMode;
  final String? Function(T?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomBlocTextField({
    super.key,
    required this.onChanged,
    required this.getField,
    this.labelText,
    this.obscureText = false,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        final fieldValue = getField(state);

        return TextFormField(
          initialValue: fieldValue?.toString() ?? '',
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          autovalidateMode: autoValidateMode,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          validator: (value) {
            if (isRequired) {
              return (value == '' || value == null || value.trim().isEmpty)
                  ? '$labelText is required'
                  : null;
            }
            if (validator != null) {
              return validator!(value as T);
            }
            return null;
          },
          onChanged: (value) => onChanged(value as T),
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText = '',
    this.labelText = '',
    this.helperText,
    this.controller,
    this.onChanged,
    this.error = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.maxLines = 1,
    this.floatingLabelBehavior,
    this.autoValidateMode,
    this.validator,
    this.initialValue,
    this.onTap,
  });

  final String labelText;
  final String hintText;
  final String? helperText;
  final String? initialValue;
  final bool error;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool? readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int maxLines;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return Colors.red; // Color when there's an error
            } else if (states.contains(WidgetState.focused)) {
              return Colors.green;
            }
            return Colors.grey; // Default color
          }),
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) {
              return Colors.red; // Color when there's an error
            }
            return Colors.grey.shade700; // Default color
          }),
        ),
      ),
      child: TextFormField(
        initialValue: initialValue,
        cursorColor: Colors.black,
        textInputAction: textInputAction,
        focusNode: focusNode,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        maxLines: maxLines,
        minLines: maxLines == 1 ? 1 : 3,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        autovalidateMode: autoValidateMode,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 15.0.w),
          isDense: false,
          labelText: labelText,
          floatingLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Colors.green,
          ),
          floatingLabelBehavior: floatingLabelBehavior,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error ? Colors.red : Colors.green,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error ? Colors.red : Colors.green,
              width: 1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0.r),
            ),
          ),
          focusColor: Colors.green,
          fillColor: Colors.transparent,
          filled: true,
          hoverColor: Colors.white,
          hintText: hintText,
          helperText: helperText,
          helperMaxLines: 3,
          //helperStyle: theme.bodyTextStyle,
          prefixIcon: prefixIcon,
          suffix: suffixIcon,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.green,
          ),
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.green),
        ),
        // style: theme.bodyLargeTextStyle,
      ),
    );
  }
}

InputDecoration customInputDecoration({
  String? labelText,
  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.auto,
  String? hintText,
  String? helperText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool filled = false,
  Color fillColor = const Color(0x1E767680),
  Color focusColor = const Color(0x1E767680),
  Color hoverColor = Colors.white,
  BorderSide borderSide = const BorderSide(
    color: Colors.black,
    width: 1.0,
  ),
  BorderSide errorBorderSide = const BorderSide(
    color: Colors.red,
    width: 1.0,
  ),
  double borderRadius = 8.0,
  double verticalPadding = 16.0,
  double horizontalPadding = 16.0,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: verticalPadding.h,
      horizontal: horizontalPadding.w,
    ),
    isDense: false,
    labelText: labelText,
    floatingLabelBehavior: floatingLabelBehavior,
    border: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius.r),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius.r),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: borderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius.r),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: errorBorderSide,
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius.r),
      ),
    ),
    focusColor: focusColor,
    fillColor: fillColor,
    filled: filled,
    hoverColor: hoverColor,
    hintText: hintText,
    helperText: helperText,
    helperMaxLines: 3,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}

class CustomTextView extends StatelessWidget {
  const CustomTextView({
    super.key,
    required this.text,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.maxLines,
    this.onTap,
  });

  final String text;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final FloatingLabelBehavior floatingLabelBehavior;
  final int? maxLines;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final node = focusNode ?? FocusNode();

    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
        if (!node.hasFocus) {
          node.requestFocus();
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Focus(
        focusNode: node,
        child: Builder(
          builder: (ctx) {
            final hasFocus = Focus.of(ctx).hasFocus;
            return InputDecorator(
              isFocused: hasFocus,
              isEmpty: text.isEmpty,
              decoration: customInputDecoration(
                labelText: labelText,
                hintText: hintText,
                helperText: helperText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                floatingLabelBehavior: floatingLabelBehavior,
                filled: true,
                fillColor: Colors.transparent,
              ),
              child: Text(
                text.isEmpty ? (hintText ?? '') : text,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: text.isEmpty ? Colors.grey : Colors.black,
                ),
                maxLines: maxLines ?? 3,
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
        ),
      ),
    );
  }
}
