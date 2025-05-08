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
}