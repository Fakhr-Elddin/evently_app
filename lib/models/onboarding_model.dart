import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
  static List<OnboardingModel> getOnboardingList(BuildContext context){
    return [
      OnboardingModel(
        title: AppLocalizations.of(context)!.onboarding1_title,
        subTitle: AppLocalizations.of(context)!.onboarding1_subtitle,
        image: AssetsManager.onboarding1Image,
      ),
      OnboardingModel(
        title: AppLocalizations.of(context)!.onboarding2_title,
        subTitle: AppLocalizations.of(context)!.onboarding2_subtitle,
        image: AssetsManager.onboarding2Image,
      ),
      OnboardingModel(
        title: AppLocalizations.of(context)!.onboarding3_title,
        subTitle: AppLocalizations.of(context)!.onboarding3_subtitle,
        image: AssetsManager.onboarding3Image,
      ),
    ];
  }
}
