import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.light;

  void changeAppTheme(ThemeMode newAppTheme){
    if(appTheme != newAppTheme){
      appTheme = newAppTheme;
      notifyListeners();
    }
  }
}