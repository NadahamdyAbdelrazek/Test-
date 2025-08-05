
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision/src/core/constants/extensions.dart';
import 'package:revision/src/core/widgets/text_widget.dart';

import '../constants/color_manager.dart';
import 'loading_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.title = '',
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.borderWidth,
    this.titleColor,
    this.fontSize,
    this.height,
    this.width,
    this.radius,
    this.padding,
    this.paddingButton,
    this.fontWeight,
    this.backgroundColors,
    this.elevation,
    this.beginGradient,
    this.endGradient,
    this.isLoading = false,
    this.isFittedBox = true,
    this.loadingColor,
  });

  final dynamic title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor, shadowColor;
  final double? borderWidth;
  final Color? titleColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final double? radius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingButton;
  final bool isLoading;
  final bool isFittedBox;
  final AlignmentGeometry? beginGradient;
  final AlignmentGeometry? endGradient;
  final List<Color>? backgroundColors;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? 45.h,
      width: width?.w ?? ScreenUtil().screenWidth,
      padding: padding ?? context.paddingZero(),
      decoration: BoxDecoration(
        gradient: backgroundColors != null
            ? LinearGradient(
                colors: backgroundColors!,
                begin: beginGradient ?? Alignment.topLeft,
                end: endGradient ?? Alignment.bottomRight,
              )
            : null,
        borderRadius:
            BorderRadius.circular(radius?.r ?? (ScreenUtil().screenWidth).r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor: ColorManager.transparent,
          padding: paddingButton,
          minimumSize: Size(
            width?.w ?? ScreenUtil().screenWidth,
            height?.h ?? 50.h,
          ),
          maximumSize: Size(
            width?.w ?? ScreenUtil().screenWidth,
            height?.h ?? 50.h,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: borderWidth ?? 1.0,
              color: borderColor ?? ColorManager.transparent,
            ),
            borderRadius: BorderRadius.circular(
                radius?.r ?? (ScreenUtil().screenWidth).r),
          ),
          elevation: elevation ?? 0,
          shadowColor: ColorManager.transparent,
          backgroundColor: backgroundColors != null
              ? Colors.transparent
              : backgroundColor ?? ColorManager.white,
        ),
        onPressed: onPressed,
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: isFittedBox ? BoxFit.contain : BoxFit.none,
          child: isLoading == true
              ? LoadingWidget(color: loadingColor)
              : title is String
                  ? TextWidget(
                      title,
                      style: context.bodyMedium
                          .copyWith(
                            fontSize: fontSize?.sp ?? 16.sp,
                            fontWeight: fontWeight ?? FontWeight.w600,
                          )
                          .colorExt(titleColor ?? ColorManager.white),
                    )
                  : title,
        ),
      ),
    );
  }
}
