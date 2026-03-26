import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/widgets/selected_and_unselected_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              themeProvider.changeAppTheme(ThemeMode.light);
            },
            child: themeProvider.appTheme == ThemeMode.light
                ? SelectedSettingWidget(text: AppLocalizations.of(context)!.light,)
                : UnSelectedSettingWidget(text: AppLocalizations.of(context)!.light,),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: (){
              themeProvider.changeAppTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme == ThemeMode.dark
                ? SelectedSettingWidget(text: AppLocalizations.of(context)!.dark,)
                : UnSelectedSettingWidget(text: AppLocalizations.of(context)!.dark,),
          ),
        ],
      ),
    );
  }
}
