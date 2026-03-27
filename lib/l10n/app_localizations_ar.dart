// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get theme => 'السمة';

  @override
  String get light => 'نهارى';

  @override
  String get dark => 'ليلى';

  @override
  String get onboarding1_title => 'خصص تجربتك';

  @override
  String get onboarding1_subtitle =>
      'اختر المظهر واللغة المفضلين لديك للبدء بتجربة مريحة ومناسبة لأسلوبك.';

  @override
  String get lets_start => 'لنبدأ';
}
