import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/screens/profile_tab.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        ProfileTab.routeName : (context) => ProfileTab(),
      },
      initialRoute: ProfileTab.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('ar'),
    );
  }
}

