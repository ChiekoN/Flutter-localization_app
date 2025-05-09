// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get bottomNavbarHomeTitle => '予定の日付一覧';

  @override
  String get bottomNavbarHistoryTitle => '過去の日付一覧';

  @override
  String get routerHome => 'ホーム';

  @override
  String get routerHistory => '履歴';

  @override
  String get toplistListEmpty => '[+]ボタンから日付を登録してください。';

  @override
  String get historyListEmpty => 'まだ履歴はありません。';

  @override
  String get addHeader => '予定を登録する';

  @override
  String get addTitleLabel => '名前';

  @override
  String get addTitleHint => '何の日？';

  @override
  String get addDateLabel => '日付選択';

  @override
  String get addDateEmpty => '日付未選択';

  @override
  String get addMemoHint => 'メモを記入する（オプション）';

  @override
  String get addMemoLabel => 'メモ';

  @override
  String get addSaveButton => '保存';

  @override
  String get detailMemoTitle => 'メモ';
}
