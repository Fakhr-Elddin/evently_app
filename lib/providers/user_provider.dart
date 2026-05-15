import 'package:evently_app/firebase/firebase_manager.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  UserModel? userModel;
  User? currentUser;
  UserProvider(){
    currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
      initUser();
    }
  }

  Future<void> initUser() async{
    //currentUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.readUserData(currentUser!.uid);
    notifyListeners();
  }
}