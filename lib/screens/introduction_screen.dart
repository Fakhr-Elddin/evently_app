import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/onboarding_screen.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/introduction_settings_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});
  static const String routeName = 'introductionScreen';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              AssetsManager.introductionImage,
            ),
            Text(
              AppLocalizations.of(context)!.introduction_title,
              style: AppStyles.bold20PrimaryLight,
            ),
            Text(
              AppLocalizations.of(context)!.introduction_subtitle,
              style: themeProvider.appTheme == ThemeMode.light
                ? AppStyles.medium16
                : AppStyles.medium16.copyWith(color: AppColors.offWhiteColor,),
            ),
            IntroductionSettingsSection(),
            CustomElevatedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}



