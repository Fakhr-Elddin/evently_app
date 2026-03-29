import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorLight,
        padding: EdgeInsets.symmetric(vertical: 14,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
      ),
      onPressed: onPressed,
      child: Text(
        AppLocalizations.of(context)!.lets_start,
        style: AppStyles.medium20White,
        textAlign: TextAlign.center,
      ),
    );
  }
}