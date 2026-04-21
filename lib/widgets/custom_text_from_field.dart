import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    this.maxLines = 1,
  });

  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      obscureText: obscureText!,
      obscuringCharacter: "*",
      style: TextStyle(
        color: themeProvider.appTheme == ThemeMode.light
            ? AppColors.greyColor
            : AppColors.offWhiteColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.medium16.copyWith(
          color: themeProvider.appTheme == ThemeMode.light
              ? AppColors.greyColor
              : AppColors.offWhiteColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).focusColor, width: 2),
        ),
      ),
    );
  }
}
