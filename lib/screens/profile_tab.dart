import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});
  static const String routeName = "profileTab";

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
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
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Container(
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
                      languageProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20PrimaryLight,
                    ),
                    ImageIcon(
                      color: AppColors.primaryColorLight,
                      AssetImage(AssetsManager.arrowDownIcon),
                    ),
                  ],
                ),
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

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColorLight,
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
