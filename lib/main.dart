import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/screens/home/create_event_screen.dart';
import 'package:evently_app/screens/home/home_screen.dart';
import 'package:evently_app/screens/introduction_screen.dart';
import 'package:evently_app/screens/login_screen.dart';
import 'package:evently_app/screens/onboarding_screen.dart';
import 'package:evently_app/screens/home/register/register_screen.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // use this line to save data local
  // await FirebaseFirestore.instance.disableNetwork();
  FlutterError.onError = (errorDetails) {
  // Non-async exceptions
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);

  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Text(
          "حصلت مشكلة بسيطة، بنحلها وهنرجعلك !",
          style: AppStyles.medium16,
        ),
      ),
    );
  };
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
      ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
      ChangeNotifierProvider(create: (context) => UserProvider(),),
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
    var authProvider = Provider.of<UserProvider>(context);
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
        CreateEventScreen.routeName : (context) => CreateEventScreen(),
      },
      initialRoute:authProvider.currentUser != null ? HomeScreen.routeName : IntroductionScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
    );
  }
}

