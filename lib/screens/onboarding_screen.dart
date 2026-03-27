import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = 'onboardingScreen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AssetsManager.appBarLogo),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Image.asset(
                fit: BoxFit.fill,
                AssetsManager.onboarding1,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.onboarding1_title,
              style: AppStyles.bold20PrimaryLight,
            ),
            Text(
              AppLocalizations.of(context)!.onboarding1_subtitle,
              style: themeProvider.appTheme == ThemeMode.light
                ? AppStyles.medium16Black
                : AppStyles.medium16Black.copyWith(color: AppColors.offWhiteColor,),
            ),
            SettingsSection(),
            CustomElevatedButton(
              onPressed: (){},
            ),
            SizedBox(
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}



