import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.textCapitalization,
    this.autofocus,
    this.obscureText,
    this.suffix,
    this.prefix,
    this.enabled,
    this.hint,
    this.validator,
    this.filled,
    this.fillColor,
    this.onFieldSubmitted,
    this.errorWidget,
    this.inputFormatters,
    this.textColor,
    required this.onChanged,
    this.hintStyle,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final bool? enabled;
  final String? hint;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool? filled;
  final Color? fillColor;
  final Color? textColor;
  final void Function(String)? onFieldSubmitted;
  final Widget? errorWidget;
  final List<TextInputFormatter>? inputFormatters;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 16.sp,
      ),
      controller: controller,
      textInputAction: textInputAction,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      autofocus: autofocus ?? false,
      enabled: enabled ?? true,
      onFieldSubmitted: onFieldSubmitted,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: filled,
        alignLabelWithHint: true,

        contentPadding: EdgeInsets.only(top: 14.h, bottom: 14.h),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            18.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(
            18.sp,
          ),
        ),

        fillColor: fillColor ?? Colors.grey.shade100,
        iconColor: Colors.grey,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,

        prefixIcon: prefix,

        suffixIcon: suffix,
        // suffix: suffix,
        hintText: hint,

        hintStyle: hintStyle ??
            TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
      ),
    );
  }
}
