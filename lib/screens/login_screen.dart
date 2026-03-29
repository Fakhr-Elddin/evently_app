import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/home/home_screen.dart';
import 'package:evently_app/screens/register_screen.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/assets_manager.dart';
import 'package:evently_app/widgets/custom_text_from_field.dart';
import 'package:evently_app/widgets/primary_text_button.dart';
import 'package:evently_app/widgets/secondary_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
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
                controller: emailController,
                hintText: 'Email',
                prefixIcon: AssetsManager.emailIcon,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
                prefixIcon: AssetsManager.passwordIcon,
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
              Align(
                alignment: Alignment.centerRight,
                child: SecondaryTextButton(
                  text: 'Forget Password?',
                  onPressed: (){},
                ),
              ),
              SizedBox(
                height: 24,
              ),
              PrimaryTextButton(
                text: 'Login',
                onPressed: (){
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ? ",
                    style: AppStyles.medium16,
                  ),
                  SecondaryTextButton(
                    text: 'Create Account',
                    onPressed: (){
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      height: 2,
                      color: AppColors.primaryColorLight,
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                          'Or',
                        style: AppStyles.medium16.copyWith(
                          color: AppColors.primaryColorLight,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(
                      height: 2,
                      color: AppColors.primaryColorLight,
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.transparentColor,
                    shadowColor: AppColors.transparentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: AppColors.primaryColorLight,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AssetsManager.googleIcon),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "Login With Google",
                            style: AppStyles.medium20PrimaryLight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
