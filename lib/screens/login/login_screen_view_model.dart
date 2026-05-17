import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/screens/login/login_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends ChangeNotifier{
  /// hold data - handle logic

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late LoginValidator validator;

  void login()async{
    if(formKey.currentState?.validate() ?? false){
      try {
        validator.onLoading();
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        UserProvider provider = UserProvider();
        await provider.initUser();
        validator.onSuccess();
      } on FirebaseAuthException catch (e) {
        validator.onError("Email Or Password Is Not Valid");
      }
    }else{
      autoValidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }
}