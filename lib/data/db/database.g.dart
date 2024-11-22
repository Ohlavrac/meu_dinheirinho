// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MovimentTable extends Moviment
    with TableInfo<$MovimentTable, MovimentEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovimentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<bool> type = GeneratedColumn<bool>(
      'type', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("type" IN (0, 1))'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<bool> repeat = GeneratedColumn<bool>(
      'repeat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("repeat" IN (0, 1))'));
  static const VerificationMeta _repeatMonthsMeta =
      const VerificationMeta('repeatMonths');
  @override
  late final GeneratedColumn<int> repeatMonths = GeneratedColumn<int>(
      'repeat_months', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _monthYearStringMeta =
      const VerificationMeta('monthYearString');
  @override
  late final GeneratedColumn<String> monthYearString = GeneratedColumn<String>(
      'month_year_string', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastMonthYearStringMeta =
      const VerificationMeta('lastMonthYearString');
  @override
  late final GeneratedColumn<String> lastMonthYearString =
      GeneratedColumn<String>('last_month_year_string', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastMonthYearMeta =
      const VerificationMeta('lastMonthYear');
  @override
  late final GeneratedColumn<DateTime> lastMonthYear =
      GeneratedColumn<DateTime>('last_month_year', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        amount,
        createdAt,
        type,
        category,
        repeat,
        repeatMonths,
        monthYearString,
        lastMonthYearString,
        lastMonthYear
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moviment';
  @override
  VerificationContext validateIntegrity(Insertable<MovimentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('repeat')) {
      context.handle(_repeatMeta,
          repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta));
    } else if (isInserting) {
      context.missing(_repeatMeta);
    }
    if (data.containsKey('repeat_months')) {
      context.handle(
          _repeatMonthsMeta,
          repeatMonths.isAcceptableOrUnknown(
              data['repeat_months']!, _repeatMonthsMeta));
    } else if (isInserting) {
      context.missing(_repeatMonthsMeta);
    }
    if (data.containsKey('month_year_string')) {
      context.handle(
          _monthYearStringMeta,
          monthYearString.isAcceptableOrUnknown(
              data['month_year_string']!, _monthYearStringMeta));
    }
    if (data.containsKey('last_month_year_string')) {
      context.handle(
          _lastMonthYearStringMeta,
          lastMonthYearString.isAcceptableOrUnknown(
              data['last_month_year_string']!, _lastMonthYearStringMeta));
    }
    if (data.containsKey('last_month_year')) {
      context.handle(
          _lastMonthYearMeta,
          lastMonthYear.isAcceptableOrUnknown(
              data['last_month_year']!, _lastMonthYearMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovimentEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovimentEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}type'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      repeat: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}repeat'])!,
      repeatMonths: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repeat_months'])!,
      monthYearString: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}month_year_string'])!,
      lastMonthYearString: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}last_month_year_string'])!,
      lastMonthYear: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_month_year']),
    );
  }

  @override
  $MovimentTable createAlias(String alias) {
    return $MovimentTable(attachedDatabase, alias);
  }
}

class MovimentCompanion extends UpdateCompanion<MovimentEntity> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> amount;
  final Value<DateTime?> createdAt;
  final Value<bool> type;
  final Value<String> category;
  final Value<bool> repeat;
  final Value<int> repeatMonths;
  final Value<String?> monthYearString;
  final Value<String?> lastMonthYearString;
  final Value<DateTime?> lastMonthYear;
  const MovimentCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.repeat = const Value.absent(),
    this.repeatMonths = const Value.absent(),
    this.monthYearString = const Value.absent(),
    this.lastMonthYearString = const Value.absent(),
    this.lastMonthYear = const Value.absent(),
  });
  MovimentCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double amount,
    this.createdAt = const Value.absent(),
    required bool type,
    required String category,
    required bool repeat,
    required int repeatMonths,
    this.monthYearString = const Value.absent(),
    this.lastMonthYearString = const Value.absent(),
    this.lastMonthYear = const Value.absent(),
  })  : title = Value(title),
        amount = Value(amount),
        type = Value(type),
        category = Value(category),
        repeat = Value(repeat),
        repeatMonths = Value(repeatMonths);
  static Insertable<MovimentEntity> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<bool>? type,
    Expression<String>? category,
    Expression<bool>? repeat,
    Expression<int>? repeatMonths,
    Expression<String>? monthYearString,
    Expression<String>? lastMonthYearString,
    Expression<DateTime>? lastMonthYear,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (repeat != null) 'repeat': repeat,
      if (repeatMonths != null) 'repeat_months': repeatMonths,
      if (monthYearString != null) 'month_year_string': monthYearString,
      if (lastMonthYearString != null)
        'last_month_year_string': lastMonthYearString,
      if (lastMonthYear != null) 'last_month_year': lastMonthYear,
    });
  }

  MovimentCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? amount,
      Value<DateTime?>? createdAt,
      Value<bool>? type,
      Value<String>? category,
      Value<bool>? repeat,
      Value<int>? repeatMonths,
      Value<String?>? monthYearString,
      Value<String?>? lastMonthYearString,
      Value<DateTime?>? lastMonthYear}) {
    return MovimentCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      category: category ?? this.category,
      repeat: repeat ?? this.repeat,
      repeatMonths: repeatMonths ?? this.repeatMonths,
      monthYearString: monthYearString ?? this.monthYearString,
      lastMonthYearString: lastMonthYearString ?? this.lastMonthYearString,
      lastMonthYear: lastMonthYear ?? this.lastMonthYear,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (type.present) {
      map['type'] = Variable<bool>(type.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<bool>(repeat.value);
    }
    if (repeatMonths.present) {
      map['repeat_months'] = Variable<int>(repeatMonths.value);
    }
    if (monthYearString.present) {
      map['month_year_string'] = Variable<String>(monthYearString.value);
    }
    if (lastMonthYearString.present) {
      map['last_month_year_string'] =
          Variable<String>(lastMonthYearString.value);
    }
    if (lastMonthYear.present) {
      map['last_month_year'] = Variable<DateTime>(lastMonthYear.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovimentCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('repeat: $repeat, ')
          ..write('repeatMonths: $repeatMonths, ')
          ..write('monthYearString: $monthYearString, ')
          ..write('lastMonthYearString: $lastMonthYearString, ')
          ..write('lastMonthYear: $lastMonthYear')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $MovimentTable moviment = $MovimentTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moviment];
}

typedef $$MovimentTableCreateCompanionBuilder = MovimentCompanion Function({
  Value<int> id,
  required String title,
  required double amount,
  Value<DateTime?> createdAt,
  required bool type,
  required String category,
  required bool repeat,
  required int repeatMonths,
  Value<String?> monthYearString,
  Value<String?> lastMonthYearString,
  Value<DateTime?> lastMonthYear,
});
typedef $$MovimentTableUpdateCompanionBuilder = MovimentCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<double> amount,
  Value<DateTime?> createdAt,
  Value<bool> type,
  Value<String> category,
  Value<bool> repeat,
  Value<int> repeatMonths,
  Value<String?> monthYearString,
  Value<String?> lastMonthYearString,
  Value<DateTime?> lastMonthYear,
});

class $$MovimentTableFilterComposer
    extends Composer<_$Database, $MovimentTable> {
  $$MovimentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repeatMonths => $composableBuilder(
      column: $table.repeatMonths, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get monthYearString => $composableBuilder(
      column: $table.monthYearString,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastMonthYearString => $composableBuilder(
      column: $table.lastMonthYearString,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastMonthYear => $composableBuilder(
      column: $table.lastMonthYear, builder: (column) => ColumnFilters(column));
}

class $$MovimentTableOrderingComposer
    extends Composer<_$Database, $MovimentTable> {
  $$MovimentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repeatMonths => $composableBuilder(
      column: $table.repeatMonths,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get monthYearString => $composableBuilder(
      column: $table.monthYearString,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastMonthYearString => $composableBuilder(
      column: $table.lastMonthYearString,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastMonthYear => $composableBuilder(
      column: $table.lastMonthYear,
      builder: (column) => ColumnOrderings(column));
}

class $$MovimentTableAnnotationComposer
    extends Composer<_$Database, $MovimentTable> {
  $$MovimentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumn<int> get repeatMonths => $composableBuilder(
      column: $table.repeatMonths, builder: (column) => column);

  GeneratedColumn<String> get monthYearString => $composableBuilder(
      column: $table.monthYearString, builder: (column) => column);

  GeneratedColumn<String> get lastMonthYearString => $composableBuilder(
      column: $table.lastMonthYearString, builder: (column) => column);

  GeneratedColumn<DateTime> get lastMonthYear => $composableBuilder(
      column: $table.lastMonthYear, builder: (column) => column);
}

class $$MovimentTableTableManager extends RootTableManager<
    _$Database,
    $MovimentTable,
    MovimentEntity,
    $$MovimentTableFilterComposer,
    $$MovimentTableOrderingComposer,
    $$MovimentTableAnnotationComposer,
    $$MovimentTableCreateCompanionBuilder,
    $$MovimentTableUpdateCompanionBuilder,
    (
      MovimentEntity,
      BaseReferences<_$Database, $MovimentTable, MovimentEntity>
    ),
    MovimentEntity,
    PrefetchHooks Function()> {
  $$MovimentTableTableManager(_$Database db, $MovimentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovimentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovimentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovimentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<bool> type = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> repeat = const Value.absent(),
            Value<int> repeatMonths = const Value.absent(),
            Value<String?> monthYearString = const Value.absent(),
            Value<String?> lastMonthYearString = const Value.absent(),
            Value<DateTime?> lastMonthYear = const Value.absent(),
          }) =>
              MovimentCompanion(
            id: id,
            title: title,
            amount: amount,
            createdAt: createdAt,
            type: type,
            category: category,
            repeat: repeat,
            repeatMonths: repeatMonths,
            monthYearString: monthYearString,
            lastMonthYearString: lastMonthYearString,
            lastMonthYear: lastMonthYear,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double amount,
            Value<DateTime?> createdAt = const Value.absent(),
            required bool type,
            required String category,
            required bool repeat,
            required int repeatMonths,
            Value<String?> monthYearString = const Value.absent(),
            Value<String?> lastMonthYearString = const Value.absent(),
            Value<DateTime?> lastMonthYear = const Value.absent(),
          }) =>
              MovimentCompanion.insert(
            id: id,
            title: title,
            amount: amount,
            createdAt: createdAt,
            type: type,
            category: category,
            repeat: repeat,
            repeatMonths: repeatMonths,
            monthYearString: monthYearString,
            lastMonthYearString: lastMonthYearString,
            lastMonthYear: lastMonthYear,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MovimentTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MovimentTable,
    MovimentEntity,
    $$MovimentTableFilterComposer,
    $$MovimentTableOrderingComposer,
    $$MovimentTableAnnotationComposer,
    $$MovimentTableCreateCompanionBuilder,
    $$MovimentTableUpdateCompanionBuilder,
    (
      MovimentEntity,
      BaseReferences<_$Database, $MovimentTable, MovimentEntity>
    ),
    MovimentEntity,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$MovimentTableTableManager get moviment =>
      $$MovimentTableTableManager(_db, _db.moviment);
}
