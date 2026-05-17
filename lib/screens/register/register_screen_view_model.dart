import 'package:evently_app/firebase/firebase_manager.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:evently_app/screens/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreenViewModel extends ChangeNotifier{
  /// hold data - handle logic
  late RegisterNavigator navigator;

  void register({
    required String name,
    required String email,
    required String password,
  })async{
    try {
      navigator.onLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await FirebaseManager.addUser(userModel);
      navigator.onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        navigator.onError(e.message!);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        navigator.onError(e.message!);
      }
    } catch (e) {
      print(e);
      navigator.onError("Something Went Wrong");
    }
  }

}