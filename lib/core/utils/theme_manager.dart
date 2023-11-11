import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primary,
      elevation: 1.h,
      shadowColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.h),
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.primary),
      trackColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
    ),
  );
}
