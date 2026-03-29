import 'package:evently_app/models/onboarding_model.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingItem extends StatelessWidget {
  const BoardingItem({
    super.key,
    required this.onboardingModel,
    required this.isFirst,
    required this.isLast,
    required this.boardingController,
  });

  final OnboardingModel onboardingModel;
  final bool isFirst;
  final bool isLast;
  final PageController boardingController;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(fit: BoxFit.fill, onboardingModel.image),
        Text(onboardingModel.title, style: AppStyles.bold20PrimaryLight),
        Text(
          onboardingModel.subTitle,
          style: themeProvider.appTheme == ThemeMode.light
              ? AppStyles.medium16
              : AppStyles.medium16.copyWith(color: AppColors.offWhiteColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isFirst
                ? SizedBox(width: 64)
                : CustomIconButton(
              icon: Icons.arrow_back,
              onPressed: () {
                boardingController.previousPage(
                  duration: Duration(milliseconds: 750),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SmoothPageIndicator(
              controller: boardingController,
              count: OnboardingModel.getOnboardingList(context).length,
              effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColorLight,
                dotColor: AppColors.blackColor,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            CustomIconButton(
              icon: Icons.arrow_forward,
              onPressed: () {
                boardingController.nextPage(
                  duration: Duration(milliseconds: 750),
                  curve: Curves.easeInOut,
                );
                if (isLast) {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}