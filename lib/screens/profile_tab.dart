import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  static const String routeName = "profileTab";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: AppStyles.bold20Black,
            ),
            Container(
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
                    AppLocalizations.of(context)!.arabic,
                    style: AppStyles.bold20PrimaryLight,
                  ),
                  ImageIcon(
                    color: AppColors.primaryColorLight,
                    AssetImage(AssetsManager.arrowDownIcon),
                  ),
                ],
              ),
            ),
            Text(
              'Theme',
              style: AppStyles.bold20Black,
            ),
            Container(
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
                    'Light',
                    style: AppStyles.bold20PrimaryLight,
                  ),
                  ImageIcon(
                    color: AppColors.primaryColorLight,
                    AssetImage(AssetsManager.arrowDownIcon),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
