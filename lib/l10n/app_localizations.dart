import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// Title on AppBar in Toplist page
  ///
  /// In en, this message translates to:
  /// **'Upcoming dates'**
  String get bottomNavbarHomeTitle;

  /// Title on AppBar in History page
  ///
  /// In en, this message translates to:
  /// **'Past dates'**
  String get bottomNavbarHistoryTitle;

  /// No description provided for @routerHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get routerHome;

  /// No description provided for @routerHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get routerHistory;

  /// No description provided for @toplistListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add your first date by pressing [+].'**
  String get toplistListEmpty;

  /// No description provided for @historyListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No history yet.'**
  String get historyListEmpty;

  /// No description provided for @addHeader.
  ///
  /// In en, this message translates to:
  /// **'Add your important day!'**
  String get addHeader;

  /// No description provided for @addTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get addTitleLabel;

  /// No description provided for @addTitleHint.
  ///
  /// In en, this message translates to:
  /// **'What day?'**
  String get addTitleHint;

  /// No description provided for @addDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get addDateLabel;

  /// No description provided for @addDateEmpty.
  ///
  /// In en, this message translates to:
  /// **'Not selected yet'**
  String get addDateEmpty;

  /// No description provided for @addMemoHint.
  ///
  /// In en, this message translates to:
  /// **'Add some notes (optional)'**
  String get addMemoHint;

  /// No description provided for @addMemoLabel.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get addMemoLabel;

  /// No description provided for @addSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get addSaveButton;

  /// No description provided for @detailMemoTitle.
  ///
  /// In en, this message translates to:
  /// **'Memo'**
  String get detailMemoTitle;

  /// No description provided for @settingsSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System locale'**
  String get settingsSystemDefault;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
