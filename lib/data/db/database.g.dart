// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovimentData extends DataClass implements Insertable<MovimentData> {
  final int id;
  final String title;
  final double amount;
  final DateTime? createdAt;
  final bool type;
  final String category;
  final bool repeat;
  final int repeatMoths;
  final String? monthYearString;
  const MovimentData(
      {required this.id,
      required this.title,
      required this.amount,
      this.createdAt,
      required this.type,
      required this.category,
      required this.repeat,
      required this.repeatMoths,
      this.monthYearString});

  get content => null;
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    map['type'] = Variable<bool>(type);
    map['category'] = Variable<String>(category);
    map['repeat'] = Variable<bool>(repeat);
    map['repeat_moths'] = Variable<int>(repeatMoths);
    if (!nullToAbsent || monthYearString != null) {
      map['month_year_string'] = Variable<String>(monthYearString);
    }
    return map;
  }

  MovimentCompanion toCompanion(bool nullToAbsent) {
    return MovimentCompanion(
      id: Value(id),
      title: Value(title),
      amount: Value(amount),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      type: Value(type),
      category: Value(category),
      repeat: Value(repeat),
      repeatMoths: Value(repeatMoths),
      monthYearString: monthYearString == null && nullToAbsent
          ? const Value.absent()
          : Value(monthYearString),
    );
  }

  factory MovimentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovimentData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<double>(json['amount']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      type: serializer.fromJson<bool>(json['type']),
      category: serializer.fromJson<String>(json['category']),
      repeat: serializer.fromJson<bool>(json['repeat']),
      repeatMoths: serializer.fromJson<int>(json['repeatMoths']),
      monthYearString: serializer.fromJson<String?>(json['monthYearString']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<double>(amount),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'type': serializer.toJson<bool>(type),
      'category': serializer.toJson<String>(category),
      'repeat': serializer.toJson<bool>(repeat),
      'repeatMoths': serializer.toJson<int>(repeatMoths),
      'monthYearString': serializer.toJson<String?>(monthYearString),
    };
  }

  MovimentData copyWith(
          {int? id,
          String? title,
          double? amount,
          Value<DateTime?> createdAt = const Value.absent(),
          bool? type,
          String? category,
          bool? repeat,
          int? repeatMoths,
          Value<String?> monthYearString = const Value.absent()}) =>
      MovimentData(
        id: id ?? this.id,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        type: type ?? this.type,
        category: category ?? this.category,
        repeat: repeat ?? this.repeat,
        repeatMoths: repeatMoths ?? this.repeatMoths,
        monthYearString: monthYearString.present
            ? monthYearString.value
            : this.monthYearString,
      );
  @override
  String toString() {
    return (StringBuffer('MovimentData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('type: $type, ')
          ..write('category: $category, ')
          ..write('repeat: $repeat, ')
          ..write('repeatMoths: $repeatMoths, ')
          ..write('monthYearString: $monthYearString')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, amount, createdAt, type, category,
      repeat, repeatMoths, monthYearString);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovimentData &&
          other.id == this.id &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.type == this.type &&
          other.category == this.category &&
          other.repeat == this.repeat &&
          other.repeatMoths == this.repeatMoths &&
          other.monthYearString == this.monthYearString);
}

class MovimentCompanion extends UpdateCompanion<MovimentData> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> amount;
  final Value<DateTime?> createdAt;
  final Value<bool> type;
  final Value<String> category;
  final Value<bool> repeat;
  final Value<int> repeatMoths;
  final Value<String?> monthYearString;
  const MovimentCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.type = const Value.absent(),
    this.category = const Value.absent(),
    this.repeat = const Value.absent(),
    this.repeatMoths = const Value.absent(),
    this.monthYearString = const Value.absent(),
  });
  MovimentCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double amount,
    this.createdAt = const Value.absent(),
    required bool type,
    required String category,
    required bool repeat,
    required int repeatMoths,
    this.monthYearString = const Value.absent(),
  })  : title = Value(title),
        amount = Value(amount),
        type = Value(type),
        category = Value(category),
        repeat = Value(repeat),
        repeatMoths = Value(repeatMoths);
  static Insertable<MovimentData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<DateTime>? createdAt,
    Expression<bool>? type,
    Expression<String>? category,
    Expression<bool>? repeat,
    Expression<int>? repeatMoths,
    Expression<String>? monthYearString,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (repeat != null) 'repeat': repeat,
      if (repeatMoths != null) 'repeat_moths': repeatMoths,
      if (monthYearString != null) 'month_year_string': monthYearString,
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
      Value<int>? repeatMoths,
      Value<String?>? monthYearString}) {
    return MovimentCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
      category: category ?? this.category,
      repeat: repeat ?? this.repeat,
      repeatMoths: repeatMoths ?? this.repeatMoths,
      monthYearString: monthYearString ?? this.monthYearString,
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
    if (repeatMoths.present) {
      map['repeat_moths'] = Variable<int>(repeatMoths.value);
    }
    if (monthYearString.present) {
      map['month_year_string'] = Variable<String>(monthYearString.value);
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
          ..write('repeatMoths: $repeatMoths, ')
          ..write('monthYearString: $monthYearString')
          ..write(')'))
        .toString();
  }
}

class $MovimentTable extends Moviment
    with TableInfo<$MovimentTable, MovimentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovimentTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<bool> type = GeneratedColumn<bool>(
      'type', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (type IN (0, 1))');
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<bool> repeat = GeneratedColumn<bool>(
      'repeat', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (repeat IN (0, 1))');
  final VerificationMeta _repeatMothsMeta =
      const VerificationMeta('repeatMoths');
  @override
  late final GeneratedColumn<int> repeatMoths = GeneratedColumn<int>(
      'repeat_moths', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _monthYearStringMeta =
      const VerificationMeta('monthYearString');
  @override
  late final GeneratedColumn<String> monthYearString = GeneratedColumn<String>(
      'month_year_string', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        amount,
        createdAt,
        type,
        category,
        repeat,
        repeatMoths,
        monthYearString
      ];
  @override
  String get aliasedName => _alias ?? 'moviment';
  @override
  String get actualTableName => 'moviment';
  @override
  VerificationContext validateIntegrity(Insertable<MovimentData> instance,
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
    if (data.containsKey('repeat_moths')) {
      context.handle(
          _repeatMothsMeta,
          repeatMoths.isAcceptableOrUnknown(
              data['repeat_moths']!, _repeatMothsMeta));
    } else if (isInserting) {
      context.missing(_repeatMothsMeta);
    }
    if (data.containsKey('month_year_string')) {
      context.handle(
          _monthYearStringMeta,
          monthYearString.isAcceptableOrUnknown(
              data['month_year_string']!, _monthYearStringMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovimentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovimentData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      type: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}type'])!,
      category: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      repeat: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}repeat'])!,
      repeatMoths: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}repeat_moths'])!,
      monthYearString: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}month_year_string']),
    );
  }

  @override
  $MovimentTable createAlias(String alias) {
    return $MovimentTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $MovimentTable moviment = $MovimentTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moviment];
}
