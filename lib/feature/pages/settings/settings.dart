import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import '../../../l10n/app_localizations.dart';

typedef langEntry = DropdownMenuEntry<Locale>;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
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
                    child: DropdownMenu<Locale>(
                      initialSelection: Locale('en'),
                      dropdownMenuEntries: UnmodifiableListView<langEntry>(
                        AppLocalizations.supportedLocales.map<langEntry>(
                          (Locale loc) => langEntry(
                            value: loc,
                            label: LocaleNames.of(context)!.nameOf(loc.toString()) ?? loc.toString(),
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