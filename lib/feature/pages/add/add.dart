import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/router.dart';
import '../../shared/todate_cubit.dart';
import '../../../domain/models/todate.dart';
import '../../shared/user_config_cubit.dart';

import '../../../l10n/app_localizations.dart';

class NewDatePage extends StatefulWidget {
  const NewDatePage({super.key});

  @override
  State<NewDatePage> createState() => _NewDatePageState();
}

class _NewDatePageState extends State<NewDatePage> {
  DateTime firstDate = DateTime.now().subtract(Duration(days:3)); 
  //DateTime firstDate = DateTime.now().add(Duration(days:1)); // Available date is tomorrow and after.
  DateTime selectedDate = DateTime.now().add(Duration(days:1)); // Initial value
  DateTime lastDate = DateTime(2200); // Max date
  String selectedDateString = '';

  final textController = TextEditingController();
  String title = '';

  final memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(_setLatestTitleValue);
  }

  @override
  void dispose() {
    textController.dispose();
    memoController.dispose();
    super.dispose();
  }

  void _setLatestTitleValue() {
    setState(() {
      title = textController.text;
    });
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    print(picked); //DEV

    if (picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
        selectedDateString =_getDateString(context, selectedDate);
        //selectedDateString = AppLocalizations.of(context)!.dateWeekStringShort(selectedDate.toLocal());
      });
      print('selectedDateString = $selectedDateString'); // DEV
    }
  }

  void _onSave(BuildContext context) {
    // Add to list
    String? memo = memoController.text;
    context.read<TodateCubit>().addTodate(
      Todate(
        date: selectedDate,
        title: title,
        memo: memo,
      )
    );
    context.go(AppRoutes.home);
  }
  
  String _getDateString(BuildContext context, DateTime date) {
    Locale? currentLocale = context.read<UserConfigCubit>().state.locale;
    if(currentLocale == null) {
      final platformDispatcher = WidgetsBinding.instance.platformDispatcher;
      print("platformDispatcher.locale.toString(): ${platformDispatcher.locale.toString()}");
      print("canoncalized platformDispatcher.locale.toString(): ${Intl.canonicalizedLocale(platformDispatcher.locale.toString())}");
      return DateFormat.yMEd(platformDispatcher.locale.toString()).format(date);
    }

    final String localeName = Intl.canonicalizedLocale(currentLocale.toString());
    print("locale.toString(): ${currentLocale.toString()}");
    print("canonicalized locale: $localeName");
    return DateFormat.yMEd(localeName).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              child: Text(
                AppLocalizations.of(context)!.addHeader,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
              child: TextField(
                maxLength: 40,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.addTitleLabel,
                  hintText: AppLocalizations.of(context)!.addTitleHint,
                  alignLabelWithHint: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                controller: textController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.date_range),
                    label: Text(AppLocalizations.of(context)!.addDateLabel),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0), 
                    child: Text(
                      selectedDateString.isEmpty ? AppLocalizations.of(context)!.addDateEmpty : selectedDateString,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),      
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: TextField(
                maxLength: 2000,
                maxLines: 10,
                minLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppLocalizations.of(context)!.addMemoHint,
                  labelText: AppLocalizations.of(context)!.addMemoLabel,
                  alignLabelWithHint: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                controller: memoController,
              ),
            ),

            // Save button
            FilledButton(
              onPressed: (selectedDateString.isEmpty || title.isEmpty) ? null : () {_onSave(context);},
              child: Text(AppLocalizations.of(context)!.addSaveButton),
            )
          ],
        ),
      ),
    );
  }
}