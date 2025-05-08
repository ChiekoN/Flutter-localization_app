import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'data_todate.g.dart';

class TodateDb extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text()();
  TextColumn get memo => text().nullable()();
}

@DriftDatabase(tables: [TodateDb])
class AppDatabase extends _$AppDatabase {

  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // Get all entries
  Future<List<TodateDbData>> getAllItems() => select(todateDb).get();

  // Add
  Future<int> createItem(TodateDbCompanion entry) => into(todateDb).insert(entry);

  // Update
  Future<int> updateItem(TodateDbCompanion entry) => into(todateDb).insert(entry);

  // Delete
  Future<int> deleteItem(int id) => 
    (delete(todateDb)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'test2_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}