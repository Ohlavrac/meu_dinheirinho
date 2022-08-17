
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:meu_dinheirinho/data/entities/moviment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// precisa desse cara aq antes de por o comando (flutter pub run build_runner build)
part 'database.g.dart';

@DriftDatabase(
  tables: [Moviment],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Stream<List<MovimentData>> getMoviments() => select(moviment).watch();

  Future addMoviment(Insertable<MovimentData> movimentValue) => into(moviment).insert(movimentValue);

  Stream<List<MovimentData>> getPositiveValues() {
    var positive = (select(moviment)..where((tbl) => tbl.type.equals(true))).watch();

    return positive;
  }

  Stream<List<MovimentData>> getNegativeValues() {
    var negativeValue = (select(moviment)..where((tbl) => tbl.type.equals(false))).watch();

    return negativeValue;
  }

  Stream<double?> getTotalAmount() {
    var total = moviment.amount.sum();

    final query = selectOnly(moviment)
    ..addColumns([total]);

    return query.map((row) => row.read(total)).watchSingle();
  }

  Future reset() {
    return delete(moviment).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}