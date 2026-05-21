import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';

 class AppTheme {
  static ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.fieldBoarder,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: ColorsManager.secondary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white
      ),
      labelSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
        color: ColorsManager.secondary
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.primary
      )
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.primary,
      secondary: ColorsManager.secondary,
      tertiary: ColorsManager.tertiary,
      onTertiary: ColorsManager.fieldBoarder
    )
  );
}