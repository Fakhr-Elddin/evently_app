import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/widgets/selected_and_unselected_language_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              languageProvider.changeAppLanguage('en');
            },
            child: languageProvider.appLanguage == 'en'
                ? SelectedLanguageWidget(
              text: AppLocalizations.of(context)!.english,
            )
                : UnSelectedLanguageWidget(
              text: AppLocalizations.of(context)!.english,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: (){
              languageProvider.changeAppLanguage('ar');
            },
            child: languageProvider.appLanguage == 'ar'
                ? SelectedLanguageWidget(
              text: AppLocalizations.of(context)!.arabic,
            )
                : UnSelectedLanguageWidget(
              text: AppLocalizations.of(context)!.arabic,
            ),
          ),
        ],
      ),
    );
  }
}





