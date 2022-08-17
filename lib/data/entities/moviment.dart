import 'package:drift/drift.dart';

class Moviment extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  BoolColumn get type => boolean()(); // se type == true é lucro se type != true é gasto
  TextColumn get category => text()();
  BoolColumn get repeat => boolean()();
  IntColumn get repeatMoths => integer()();
}