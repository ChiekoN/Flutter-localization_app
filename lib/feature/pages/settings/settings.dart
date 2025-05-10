import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import '../../../l10n/app_localizations.dart';
import '../../shared/user_config_cubit.dart';
import '../../../domain/models/user_config.dart';

typedef LangEntry = DropdownMenuEntry<Locale?>;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  String _localeName(Locale? locale, BuildContext context) {
    if(locale == null) {
      return AppLocalizations.of(context)!.settingsSystemDefault;
    } else {
      return LocaleNames.of(context)!.nameOf(locale.toString()) ?? locale.toString();
    }
  }
  
  @override
  Widget build(BuildContext context) {

    // When MaterialApp.locale is set to null, it uses system locale (system default in the menu).
    Locale? nullLocale;
    final List<Locale?> entries = [nullLocale] + AppLocalizations.supportedLocales ;

    return BlocBuilder<UserConfigCubit, UserConfig>(
      builder: (context, configState) {

        // Create controller for language dropdown menu.
        // This controller is necessary to show the selected item in the seleted language
        //  right after the language is selected. 
        final TextEditingController menuController = TextEditingController(
          text: _localeName(configState.locale, context)
        );
        
        return Column(
          children: [
            AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    });
                }
              ),
              title: Text(
                AppLocalizations.of(context)!.settingsTitle
              ),
            ),

            //SizedBox(height: 16, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.settingsLanguage,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Expanded(
                      child: DropdownMenu<Locale?>(
                        initialSelection: configState.locale,
                        dropdownMenuEntries: UnmodifiableListView<LangEntry>(
                          entries.map<LangEntry>(
                            (Locale? loc) => LangEntry(
                              value: loc,
                              label: _localeName(loc, context),
                            )
                          )
                        ),
                        controller: menuController,
                        onSelected: (Locale? loc) {
                          print("loc: $loc");
                          context.read<UserConfigCubit>().updateLocale(loc);
                          menuController.text = _localeName(loc, context);
                        },
                      ),
                    ),
                  ],
              ),
            ),
            /*
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
            */
          ],
        );
      }
    );
  }
}