import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SettingsSelectionField extends StatelessWidget {
  const SettingsSelectionField({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: AppColors.primaryColorLight,
            width: 2,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppStyles.bold20PrimaryLight,
          ),
          ImageIcon(
            color: AppColors.primaryColorLight,
            AssetImage(AssetsManager.arrowDownIcon),
          ),
        ],
      ),
    );
  }
}