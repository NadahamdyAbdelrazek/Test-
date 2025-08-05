
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:revision/src/core/constants/extensions.dart';

import '../color_manager.dart';

class LightTheme {
  static final ThemeData theme = ThemeData(
    fontFamily: "NotoSans",
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: ColorManager.white,
      secondary: ColorManager.white,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.black,
      surfaceTintColor: ColorManager.transparent,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: ColorManager.black,
        fontFamily: 'NotoSans',
        fontFamilyFallback: const ['SegoeUI', 'sans-serif'],
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: ColorManager.black,
        fontFamily: 'NotoSans',
        fontFamilyFallback: const ['SegoeUI', 'sans-serif'],
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: ColorManager.black,
        fontFamily: 'NotoSans',
        fontFamilyFallback: const ['SegoeUI', 'sans-serif'],
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: ColorManager.black.withValues(alpha: 0.60),
        fontFamily: 'NotoSans',
        fontFamilyFallback: const ['SegoeUI', 'sans-serif'],
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.withValues(alpha: 0.7),
      enabledBorder: OutlineInputBorder(
        borderRadius: 30.radius,
        borderSide: const BorderSide(
          width: 1.5,
          color: ColorManager.transparent,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: 30.radius,
        borderSide: const BorderSide(
          width: 1.5,
          color: ColorManager.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: 30.radius,
        borderSide: BorderSide(
          width: 1.5,
          color:  Colors.grey.withValues(alpha: 0.7),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: 30.radius,
        borderSide: const BorderSide(
          color: ColorManager.white,
          width: 1.5,
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color:  Colors.grey,
      thickness: 1.0,
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide.none,
      fillColor: const WidgetStatePropertyAll( Colors.grey),
      checkColor: const WidgetStatePropertyAll(
        ColorManager.black,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: 10.5.radius,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
