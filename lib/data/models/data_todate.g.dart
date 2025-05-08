// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_todate.dart';

// ignore_for_file: type=lint
class $TodateDbTable extends TodateDb
    with TableInfo<$TodateDbTable, TodateDbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodateDbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, title, memo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todate_db';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodateDbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodateDbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodateDbData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
    );
  }

  @override
  $TodateDbTable createAlias(String alias) {
    return $TodateDbTable(attachedDatabase, alias);
  }
}

class TodateDbData extends DataClass implements Insertable<TodateDbData> {
  final int id;
  final DateTime date;
  final String title;
  final String? memo;
  const TodateDbData({
    required this.id,
    required this.date,
    required this.title,
    this.memo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    return map;
  }

  TodateDbCompanion toCompanion(bool nullToAbsent) {
    return TodateDbCompanion(
      id: Value(id),
      date: Value(date),
      title: Value(title),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
    );
  }

  factory TodateDbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodateDbData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      memo: serializer.fromJson<String?>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'memo': serializer.toJson<String?>(memo),
    };
  }

  TodateDbData copyWith({
    int? id,
    DateTime? date,
    String? title,
    Value<String?> memo = const Value.absent(),
  }) => TodateDbData(
    id: id ?? this.id,
    date: date ?? this.date,
    title: title ?? this.title,
    memo: memo.present ? memo.value : this.memo,
  );
  TodateDbData copyWithCompanion(TodateDbCompanion data) {
    return TodateDbData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      title: data.title.present ? data.title.value : this.title,
      memo: data.memo.present ? data.memo.value : this.memo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodateDbData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, title, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodateDbData &&
          other.id == this.id &&
          other.date == this.date &&
          other.title == this.title &&
          other.memo == this.memo);
}

class TodateDbCompanion extends UpdateCompanion<TodateDbData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<String?> memo;
  const TodateDbCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.memo = const Value.absent(),
  });
  TodateDbCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String title,
    this.memo = const Value.absent(),
  }) : date = Value(date),
       title = Value(title);
  static Insertable<TodateDbData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? title,
    Expression<String>? memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (memo != null) 'memo': memo,
    });
  }

  TodateDbCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String>? title,
    Value<String?>? memo,
  }) {
    return TodateDbCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodateDbCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodateDbTable todateDb = $TodateDbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todateDb];
}

typedef $$TodateDbTableCreateCompanionBuilder =
    TodateDbCompanion Function({
      Value<int> id,
      required DateTime date,
      required String title,
      Value<String?> memo,
    });
typedef $$TodateDbTableUpdateCompanionBuilder =
    TodateDbCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String> title,
      Value<String?> memo,
    });

class $$TodateDbTableFilterComposer
    extends Composer<_$AppDatabase, $TodateDbTable> {
  $$TodateDbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodateDbTableOrderingComposer
    extends Composer<_$AppDatabase, $TodateDbTable> {
  $$TodateDbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodateDbTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodateDbTable> {
  $$TodateDbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);
}

class $$TodateDbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodateDbTable,
          TodateDbData,
          $$TodateDbTableFilterComposer,
          $$TodateDbTableOrderingComposer,
          $$TodateDbTableAnnotationComposer,
          $$TodateDbTableCreateCompanionBuilder,
          $$TodateDbTableUpdateCompanionBuilder,
          (
            TodateDbData,
            BaseReferences<_$AppDatabase, $TodateDbTable, TodateDbData>,
          ),
          TodateDbData,
          PrefetchHooks Function()
        > {
  $$TodateDbTableTableManager(_$AppDatabase db, $TodateDbTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TodateDbTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TodateDbTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TodateDbTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> memo = const Value.absent(),
              }) => TodateDbCompanion(
                id: id,
                date: date,
                title: title,
                memo: memo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                required String title,
                Value<String?> memo = const Value.absent(),
              }) => TodateDbCompanion.insert(
                id: id,
                date: date,
                title: title,
                memo: memo,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodateDbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodateDbTable,
      TodateDbData,
      $$TodateDbTableFilterComposer,
      $$TodateDbTableOrderingComposer,
      $$TodateDbTableAnnotationComposer,
      $$TodateDbTableCreateCompanionBuilder,
      $$TodateDbTableUpdateCompanionBuilder,
      (
        TodateDbData,
        BaseReferences<_$AppDatabase, $TodateDbTable, TodateDbData>,
      ),
      TodateDbData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodateDbTableTableManager get todateDb =>
      $$TodateDbTableTableManager(_db, _db.todateDb);
}
