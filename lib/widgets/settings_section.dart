import 'package:country_flags/country_flags.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:evently_app/widgets/custom_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: AppStyles.medium20PrimaryLight,
            ),
            CustomToggleSwitch(
              customWidgets: [
                CountryFlag.fromCountryCode(
                  'us',
                  theme: ImageTheme(
                    width: 26,
                    height: 26,
                    shape: Circle(),
                  ),
                ),
                CountryFlag.fromCountryCode(
                  'eg',
                  theme: ImageTheme(
                    width: 26,
                    height: 26,
                    shape: Circle(),
                  ),
                ),
              ],
              initialLabelIndex: languageProvider.appLanguage == 'en' ? 0 : 1,
              onToggle: (index){
                if(index == 0){
                  languageProvider.changeAppLanguage('en');
                } else {
                  languageProvider.changeAppLanguage('ar');
                }
              },
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.theme,
              style: AppStyles.medium20PrimaryLight,
            ),
            CustomToggleSwitch(
              customWidgets: [
                FaIcon(FontAwesomeIcons.solidSun),
                FaIcon(FontAwesomeIcons.solidMoon),
              ],
              initialLabelIndex: themeProvider.appTheme == ThemeMode.light ? 0 : 1,
              onToggle: (index){
                if(index == 0){
                  themeProvider.changeAppTheme(ThemeMode.light);
                } else {
                  themeProvider.changeAppTheme(ThemeMode.dark);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
