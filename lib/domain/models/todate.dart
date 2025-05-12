import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Todate {
  String? id;
  DateTime date;
  String title;
  String? memo;

  Todate({ 
    required this.date,
    required this.title,
    this.id,
    this.memo,
  }) ;

  // DateTime Object contains time. This getter returns a String which has only date (in the user's timezone)
  String get dateString => '${date.toLocal()}'.split(' ')[0];

  DateTime get dateOnly => DateTime(date.year, date.month, date.day);

  String getDateWeekStringShort(Locale? locale) {
    if (locale == null) { // System default
      final platformDispatcher = WidgetsBinding.instance.platformDispatcher;
      print("system locale = ${platformDispatcher.locale.toString()}");
      return DateFormat.yMEd(platformDispatcher.locale.toString()).format(date);
    }
    
    final String localeName = Intl.canonicalizedLocale(locale.toString());
    print("locale.toString = ${locale.toString()}, canonicalized locale = $localeName");
    return DateFormat.yMEd(localeName).format(date);
  }

  String getDateWeekString(Locale? locale) {
    if (locale == null) { // System default
      final platformDispatcher = WidgetsBinding.instance.platformDispatcher;
      //print("system locale = ${platformDispatcher.locale.toString()}");
      return DateFormat.yMMMEd(platformDispatcher.locale.toString()).format(date);
    }
    
    final String localeName = Intl.canonicalizedLocale(locale.toString());
    //print("locale.toString = ${locale.toString()}, canonicalized locale = $localeName");
    return DateFormat.yMMMEd(localeName).format(date);
  }
}