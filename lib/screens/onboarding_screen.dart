import 'package:evently_app/models/onboarding_model.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/boarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "onboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController boardingController = PageController();
  bool isFirst = true;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AssetsManager.appBarLogo),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PageView.builder(
          controller: boardingController,
          itemCount: OnboardingModel.getOnboardingList(context).length,
          onPageChanged: (index) {
            if (index == 0) {
              isFirst = true;
            } else {
              isFirst = false;
            }
            if (index ==
                OnboardingModel.getOnboardingList(context).length - 1) {
              isLast = true;
            } else {
              isLast = false;
            }
            setState(() {});
          },
          itemBuilder: (context, index) => BoardingItem(
            onboardingModel: OnboardingModel.getOnboardingList(context)[index],
            isFirst: isFirst,
            isLast: isLast,
            boardingController: boardingController,
          ),
        ),
      ),
    );
  }
}


