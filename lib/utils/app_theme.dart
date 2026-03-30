import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColorLight,
    focusColor: AppColors.greyColor,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparentColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(75),
        side: BorderSide(
          color: AppColors.backgroundColorLight,
          width: 4,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColorLight,
      selectedLabelStyle: AppStyles.bold12Light,
      unselectedLabelStyle: AppStyles.bold12Light,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.backgroundColorLight,
      unselectedItemColor: AppColors.backgroundColorLight,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundColorLight,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColorLight,
    focusColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorDark,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.backgroundColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(75),
        side: BorderSide(
          color: AppColors.offWhiteColor,
          width: 4,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColorDark,
      selectedLabelStyle: AppStyles.bold12dark,
      unselectedLabelStyle: AppStyles.bold12dark,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.offWhiteColor,
      unselectedItemColor: AppColors.offWhiteColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundColorDark,
    ),
  );
}