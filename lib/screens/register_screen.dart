import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/custom_text_from_field.dart';
import 'package:evently_app/widgets/primary_text_button.dart';import 'package:evently_app/widgets/secondary_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.primaryColorLight,
        ),
        centerTitle: true,
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Image.asset(AssetsManager.logoImage),
              SizedBox(
                height: 24,
              ),
              CustomTextFromField(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: ImageIcon(
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                  AssetImage(AssetsManager.nameIcon),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: ImageIcon(
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                  AssetImage(AssetsManager.emailIcon),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
                prefixIcon: ImageIcon(
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                  AssetImage(AssetsManager.passwordIcon),
                ),
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(
                  Icons.visibility_off,
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                controller: resetPasswordController,
                obscureText: true,
                hintText: 'Re Password',
                prefixIcon: ImageIcon(
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                  AssetImage(AssetsManager.passwordIcon),
                ),
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(
                  Icons.visibility_off,
                  color: themeProvider.appTheme == ThemeMode.light
                      ? AppColors.greyColor
                      : AppColors.offWhiteColor,
                ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              PrimaryTextButton(
                text: 'Create Account',
                onPressed: (){},
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ?",
                    style: AppStyles.medium16.copyWith(
                      color: themeProvider.appTheme == ThemeMode.light
                          ? AppColors.blackColor
                          : AppColors.offWhiteColor,
                    ),
                  ),
                  SecondaryTextButton(
                    text: 'Login',
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
}
