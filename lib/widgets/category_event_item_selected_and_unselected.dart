import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEventItemSelected extends StatelessWidget {
  const CategoryEventItemSelected({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.5),
      decoration: BoxDecoration(
        color: AppColors.primaryColorLight,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: AppColors.primaryColorLight,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: themeProvider.appTheme == ThemeMode.light
                ? AppColors.backgroundColorLight
                : AppColors.backgroundColorDark,
          ),
          SizedBox(width: 2.5),
          Text(
            text,
            style: AppStyles.medium16.copyWith(
              color: themeProvider.appTheme == ThemeMode.light
                  ? AppColors.backgroundColorLight
                  : AppColors.backgroundColorDark,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryEventItemUnselected extends StatelessWidget {
  const CategoryEventItemUnselected({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.5),
      decoration: BoxDecoration(
        color: AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          color: AppColors.primaryColorLight,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primaryColorLight,
          ),
          SizedBox(width: 2.5),
          Text(
            text,
            style: AppStyles.medium16.copyWith(
              color: AppColors.primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }
}