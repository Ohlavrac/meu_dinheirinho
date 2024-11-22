
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:meu_dinheirinho/data/db/moviments_table.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// precisa desse cara aq antes de por o comando (dart run build_runner build)
part 'database.g.dart';

@DriftDatabase(
  tables: [Moviment],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
      },

      onUpgrade: (Migrator migrator, int from, int to) async {
        if (from < 2) {
          //await migrator.addColumn(tasks, tasks.);
        }
      },

      beforeOpen: (details) async {
        if (kDebugMode) {
          //await validateDatabaseSchema();
        }
      }
    );
  }

  //Stream<List<MovimentEntity>> getMoviments() => select(moviment).watch();

  Stream<List<MovimentEntity>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault) {
    print(monthAndYearDefault);
    return (select(moviment)..where((tbl) => tbl.monthYearString.equals(monthAndYear) | tbl.repeat.equals(true) & tbl.lastMonthYear.isBiggerOrEqualValue(monthAndYearDefault) & tbl.createdAt.isSmallerOrEqualValue(monthAndYearDefault))).watch();
  }

  Future addMoviment(Insertable<MovimentEntity> movimentValue) => into(moviment).insert(movimentValue);

  Stream<List<MovimentEntity>> getPositiveValues() {
    var positive = (select(moviment)..where((tbl) => tbl.type.equals(true))).watch();

    return positive;
  }

  Stream<List<MovimentEntity>> getNegativeValues() {
    var negativeValue = (select(moviment)..where((tbl) => tbl.type.equals(false))).watch();

    return negativeValue;
  }

  Stream<double?> getTotalAmount() {
    var total = moviment.amount.sum();

    final query = selectOnly(moviment)
    ..addColumns([total]);

    return query.map((row) => row.read(total)).watchSingle();
  }

  Future<List<MovimentEntity>> getMovimentById(int movimentID) {
    return (select(moviment)..where((tbl) => tbl.id.equals(movimentID))).get();
  }

  Future reset() {
    return delete(moviment).go();
  }

  Future deleteItem(int movimentID) async {
    return await (delete(moviment)..where((tbl) => tbl.id.equals(movimentID))).go();
  }

  Future updateItem(Insertable<MovimentEntity> newmoviment) async {
    return await update(moviment).replace(newmoviment);
  }

  Future stopMovementContinue(Insertable<MovimentEntity> updatemoviment) async {
    return await update(moviment).replace(updatemoviment);
  }
}

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db2.sqlite'));
      return NativeDatabase(file);
  });
}