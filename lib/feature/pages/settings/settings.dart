import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import '../../../l10n/app_localizations.dart';

typedef LangEntry = DropdownMenuEntry<Locale?>;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  String _localeName(Locale? locale, BuildContext context) {
    if(locale == null) {
      return "System default";
    } else {
      return LocaleNames.of(context)!.nameOf(locale.toString()) ?? locale.toString();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    Locale? nullLocale;
    final List<Locale?> entries = [nullLocale] + AppLocalizations.supportedLocales ;

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
            title: Text('Settings'),
          ),

          //SizedBox(height: 16, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      'Language',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Expanded(
                    child: DropdownMenu<Locale?>(
                      initialSelection: Locale('en'),
                      dropdownMenuEntries: UnmodifiableListView<LangEntry>(
                        entries.map<LangEntry>(
                          (Locale? loc) => LangEntry(
                            value: loc,
                            label: _localeName(loc, context),
                          )
                        )
                      ),
                    //onSelected: (){},
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
}