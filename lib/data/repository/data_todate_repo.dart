import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../../domain/models/todate.dart';
import '../../domain/repository/todate_repo.dart';
import '../models/data_todate.dart';

class TodateRepoData implements TodateRepo {

  final AppDatabase _database = AppDatabase();

  @override
  Future<List<Todate>> getTodates() async {

    List<TodateDbData> todatesDb = await _database.getAllItems();
    List<Todate> todates = todatesDb.map(
      (entry) => Todate(
        id: entry.id.toString(),
        date: entry.date,
        title: entry.title,
        memo: entry.memo,
      )).toList();
    return sortTodates(todates);
  }

  @override
  Future<void> addTodate(Todate newTodate) async {
    newTodate.date = newTodate.dateOnly; // Set the Time in DateTime to 00:00:00 forcibly.
    
    await _database.createItem(
      TodateDbCompanion.insert(
        date: newTodate.date,
        title: newTodate.title,
        memo: Value(newTodate.memo),
      )
    );
  }

  @override
  Future<void> updateTodate(Todate todate) async {
    todate.date = todate.dateOnly; // Set the Time in DateTime to 00:00:00 forcibly.

    await _database.updateItem(
      TodateDbCompanion(
        id: Value(int.parse(todate.id!)),
        date: Value(todate.date),
        title: Value(todate.title),
        memo: Value(todate.memo),
        )
    );
  }

  @override
  Future<void> deleteTodate(Todate todate) async {
    await _database.deleteItem(int.parse(todate.id!));
  }

  List<Todate> sortTodates(List<Todate> todates) {
    todates.sort(todateComparison);
    return(todates);
  }

  int todateComparison(Todate a, Todate b) {
    int result = a.date.compareTo(b.date);

    if(result == 0) { // If they are the same date, sort by id.
      result = int.parse(a.id!).compareTo(int.parse(b.id!));
    }
    return result;
  }
} 