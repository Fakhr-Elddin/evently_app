import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/widgets/language_bottom_sheet.dart';
import 'package:evently_app/widgets/settings_selection_field.dart';
import 'package:evently_app/widgets/theme_bottom_sheet.dart';
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
    var themeProvider = Provider.of<AppThemeProvider>(context);
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
              style: themeProvider.appTheme == ThemeMode.light
                  ? AppStyles.bold20
                  : AppStyles.bold20.copyWith(
                color: AppColors.offWhiteColor,
              ) ,
            ),
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: SettingsSelectionField(
                text: languageProvider.appLanguage == 'en'
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: themeProvider.appTheme == ThemeMode.light
                  ? AppStyles.bold20
                  : AppStyles.bold20.copyWith(
                color: AppColors.offWhiteColor,
              ) ,
            ),
            InkWell(
              onTap: (){
                showThemeBottomSheet();
              },
              child: SettingsSelectionField(
                text: themeProvider.appTheme == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}

