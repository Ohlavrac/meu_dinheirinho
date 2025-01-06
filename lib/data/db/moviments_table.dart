import 'package:drift/drift.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';

@UseRowClass(MovimentEntity)
class Moviment extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  BoolColumn get type => boolean()(); // se type == true é lucro se type != true é gasto
  TextColumn get category => text()();
  BoolColumn get repeat => boolean()();
  IntColumn get repeatMonths => integer().nullable()();
  TextColumn get monthYearString => text().nullable()();
  TextColumn get lastMonthYearString => text().nullable()();
  DateTimeColumn get lastMonthYear => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}