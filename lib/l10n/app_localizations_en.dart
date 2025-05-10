// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get bottomNavbarHomeTitle => 'Upcoming dates';

  @override
  String get bottomNavbarHistoryTitle => 'Past dates';

  @override
  String get routerHome => 'Home';

  @override
  String get routerHistory => 'History';

  @override
  String get toplistListEmpty => 'Add your first date by pressing [+].';

  @override
  String get historyListEmpty => 'No history yet.';

  @override
  String get addHeader => 'Add your important day!';

  @override
  String get addTitleLabel => 'Title';

  @override
  String get addTitleHint => 'What day?';

  @override
  String get addDateLabel => 'Select Date';

  @override
  String get addDateEmpty => 'Not selected yet';

  @override
  String get addMemoHint => 'Add some notes (optional)';

  @override
  String get addMemoLabel => 'Memo';

  @override
  String get addSaveButton => 'Save';

  @override
  String get detailMemoTitle => 'Memo';

  @override
  String get settingsSystemDefault => 'System locale';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';
}
