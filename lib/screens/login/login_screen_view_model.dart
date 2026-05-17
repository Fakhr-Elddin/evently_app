import 'package:evently_app/base.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/screens/login/login_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends BaseViewModel<LoginValidator>{
  /// hold data - handle logic

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void login({required UserProvider userProvider})async{
    if(formKey.currentState?.validate() ?? false){
      try {
        validator!.onLoading();
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );

        await userProvider.initUser();
        validator!.onSuccess();
      } on FirebaseAuthException catch (e) {
        validator!.onError("Email Or Password Is Not Valid");
      }
    }else{
      autoValidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }
}