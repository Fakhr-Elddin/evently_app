import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/screens/home/home_screen.dart';
import 'package:evently_app/screens/register/register_navigator.dart';
import 'package:evently_app/screens/register/register_screen_view_model.dart';
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

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

  @override
  void initState() {
    super.initState();
    // this (عبارة عن بوينتر بيشاور على الكلاس اللى انا واقف فيه)
    // viewModel.navigator = _RegisterScreenState (عشان implements منه) = RegisterNavigator();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var authProvider = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
            child: SingleChildScrollView(
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
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Name',
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
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
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter Your Email";
                        }
                        bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com+")
                            .hasMatch(value);
                        if(!emailValid){
                          return "Please Enter Valid Email";
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
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      hintText: 'Password',
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter Your Password";
                        }
                        if(value.length < 6){
                          return "Password Must Be At Least 6 Characters";
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
                    CustomTextFromField(
                      controller: rePasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please Enter Your Password";
                        }
                        if(value != passwordController.text){
                          return "Password Not Match";
                        }
                        return null;
                      },
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
                      onPressed: (){
                        if(formKey.currentState?.validate() ?? false){
                          viewModel.register(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            userProvider: authProvider,
                          );
                        }else{
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
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
          ),
        ),
      ),
    );
    }


  @override
  void onError(String errorMessage) {
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
  }

  @override
  void onLoading() {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator(color: AppColors.primaryColorLight,)),
    );
  }

  @override
  void onSuccess() {
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false,);
  }
}
