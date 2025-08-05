
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision/src/core/constants/extensions.dart';

import '../constants/color_manager.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
    this.hintText, {
    super.key,
    this.controller,
    this.title,
    this.keyboardType = TextInputType.text,
    this.hintStyle,
    this.isPassword = false,
    this.onChanged,
    this.focusNode,
    this.border,
    this.validator,
    this.textStyle,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.onPressed,
    this.initialValue,
    this.suffixColor,
    this.fillColor,
    this.textInputAction,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.contentPadding,
    this.colorFilter,
    this.maxLength,
    this.showMaxLength,
    this.hintTextDirection,
    this.textSize,
    this.cursorColor = ColorManager.black,
    this.textColor = ColorManager.black,
    this.isTappedOutside = true,
    this.minLines,
    this.onSubmitted,
    this.label,
    this.suffixIconConstraints,
    this.onEditingComplete,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final TextDirection? hintTextDirection;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? title;
  final Color? prefixColor;
  final Color? fillColor;
  final FocusNode? focusNode;
  final bool isPassword;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final Color? suffixColor;
  final VoidCallback? onPressed;
  final Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final ColorFilter? colorFilter;
  final Color cursorColor;
  final Color textColor;
  final int? maxLength;
  final bool? showMaxLength;
  final double? textSize;
  final bool isTappedOutside;
  final void Function(String)? onSubmitted;
  final dynamic label;
  final BoxConstraints? suffixIconConstraints;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: isTappedOutside == true
          ? (_) {
              FocusScope.of(context).unfocus();
            }
          : null,
      initialValue: initialValue,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: isPassword,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines ?? 1,
      textInputAction: textInputAction,
      cursorColor: cursorColor,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required bool isFocused,
        required int? maxLength,
      }) {
        return showMaxLength == null
            ? null
            : Text(
                '$currentLength/$maxLength',
                style: context.bodyMedium.w500.colorExt(
                    ColorManager.white),
              );
      },
      maxLength: maxLength,
      style: context.bodyMedium
          .copyWith(color: textColor, fontWeight: FontWeight.w500)
          .size(textSize ?? 14),
      onFieldSubmitted: onSubmitted,
      textDirection: hintTextDirection,
      decoration: InputDecoration(
          label: label,
          hintTextDirection: hintTextDirection,
          contentPadding: contentPadding ??
              context.paddingSymmetric(horizontal: 20, vertical: 5),
          hintText: hintText ?? "",
          hintStyle: hintStyle ??
              context.bodyLarge.colorExt(
                ColorManager.white.withValues(alpha: 0.6),
              ),
          counterStyle:
              context.bodyMedium.colorExt(ColorManager.white),
          filled: true,
          fillColor: fillColor ?? ColorManager.transparent,
          prefixIcon: (prefixIcon != null)
              ? (prefixIcon is IconData)
                  ? Icon(
                      prefixIcon,
                      size: 10.h,
                      color: prefixColor ?? ColorManager.white,
                    )
                  : (prefixIcon is String)
                      ? SizedBox()
                      : prefixIcon
              : null,
          suffixIconConstraints: suffixIconConstraints,
          suffixIcon: (suffixIcon != null)
              ? IconButton(
                  onPressed: onPressed,
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(),
                  icon: (suffixIcon is IconData)
                      ? Icon(
                          suffixIcon,
                          size: 20.h,
                          color: suffixColor ?? ColorManager.white,
                        )
                      : (suffixIcon is String)
                          ? SizedBox()
                          : suffixIcon,
                )
              : null,
          border: border,
          enabledBorder: enabledBorder,
          /* ??
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: 10.radius,
        ),*/
          focusedBorder: focusedBorder,
          /*??
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: 10.radius,
        ),*/
          errorBorder: errorBorder,
          /*??
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: 10.radius,
        ),*/
          focusedErrorBorder:
              focusedErrorBorder /* ??
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: 10.radius,
        ),*/
          ),
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
