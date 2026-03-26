import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SelectedSettingWidget extends StatelessWidget {
  const SelectedSettingWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.bold20PrimaryLight,
        ),
        Icon(
          Icons.check,
          color: AppColors.primaryColorLight,
          size: 30,
        ),
      ],
    );
  }
}

class UnSelectedSettingWidget extends StatelessWidget {
  const UnSelectedSettingWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.bold20Black,
    );
  }
}