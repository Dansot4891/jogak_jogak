import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogak_jogak/core/style/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool expands;
  final int? maxLines;
  final double borderRadius;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? borderColor;
  final EdgeInsets? contentPadding;
  final bool filled;
  final bool isDense;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  const CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.onTap,
    this.borderRadius = 16,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.readOnly = false,
    this.obsecure = false,
    this.expands = false,
    this.isDense = false,
    this.maxLines,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.inputFormatters,
    this.style,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.contentPadding,
    this.filled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines,
      expands: expands,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      readOnly: readOnly,
      enabled: enabled,
      obscureText: obsecure,
      textAlign: textAlign,
      validator: validator == null ? null : validator,
      textAlignVertical: TextAlignVertical.top,
      style: AppTextStyle.textField,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        isDense: isDense,
        fillColor: fillColor ?? Colors.white,
        filled: filled,
        errorStyle: AppTextStyle.textField.copyWith(color: Colors.red),
        counterText: '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.red)),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyle.textField,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Colors.black,
          ),
        ),
        focusColor: Colors.black,
      ),
    );
  }
}