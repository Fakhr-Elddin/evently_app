import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void changeAppLanguage(String newLanguage){
    if(appLanguage != newLanguage){
      appLanguage = newLanguage;
      notifyListeners();
    }
  }
}