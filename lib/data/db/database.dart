
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

  Database.forTesting(super.e);

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
}

  LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db2.sqlite'));
      return NativeDatabase(file);
  });
}