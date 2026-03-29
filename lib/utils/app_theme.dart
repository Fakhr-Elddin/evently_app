import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparentColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColorLight,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.backgroundColorLight,
      unselectedItemColor: AppColors.backgroundColorLight,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorDark,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColorDark,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.offWhiteColor,
      unselectedItemColor: AppColors.offWhiteColor,
    ),
  );
}