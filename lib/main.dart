import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/screens/home_screen.dart';
import 'package:evently_app/screens/introduction_screen.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:evently_app/screens/onboarding_screen.dart';
import 'package:evently_app/screens/profile_tab.dart';
import 'package:evently_app/screens/register_screen.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      routes: {
        IntroductionScreen.routeName : (context) => IntroductionScreen(),
        OnboardingScreen.routeName : (context) => OnboardingScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        ProfileTab.routeName : (context) => ProfileTab(),
      },
      initialRoute: IntroductionScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
    );
  }
}

