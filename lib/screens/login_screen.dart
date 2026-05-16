import 'package:evently_app/firebase/firebase_manager.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/screens/home/home_screen.dart';
import 'package:evently_app/screens/home/register/register_screen.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                Image.asset(AssetsManager.logoImage),
                SizedBox(
                  height: 24,
                ),
                CustomTextFromField(
                  controller: emailController,
                  hintText: 'Email',
                  validator: (value) {
                    if(value?.isEmpty ?? true){
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if(value?.isEmpty ?? true){
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
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
                    if(formKey.currentState?.validate() ?? false){
                      FirebaseManager.loginUser(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: ()async{
                          Navigator.pop(context);
                          await authProvider.initUser();
                          Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false,);
                        },
                        onError: (errorMessage){
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Something Went Wrong",
                              ),
                              content: Text(
                                errorMessage,
                              ),
                              actions: [
                                PrimaryTextButton(
                                  text: "OK",
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        onLoading: (){
                          showDialog(
                            context: context,
                            builder: (context) => Center(child: CircularProgressIndicator(color: AppColors.primaryColorLight,),),);
                        },
                      );
                    }else{
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
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
      ),
    );
  }
}
