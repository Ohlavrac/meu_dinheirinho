import 'package:drift/drift.dart';
import 'package:meu_dinheirinho/data/data_source/ilocal_datasource.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/data/dtos/moviments_dto.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';

class LocalDatasource implements ILocalDatasource {
  final _myDb = Database();

  @override
  Stream<List<MovimentsDto>> getMoviments() async* {
    Stream<List<MovimentEntity>> moviments = _myDb.select(_myDb.moviment).watch();

    yield* moviments.map((movimentsEntity) => movimentsEntity.map((moviment) => MovimentsDto(
      title: moviment.title,
      amount: moviment.amount,
      createdAt: moviment.createdAt,
      type: moviment.type,
      category: moviment.category,
      repeat: moviment.repeat,
      repeatMonths: moviment.repeatMonths!,
      monthYearString: moviment.monthYearString,
      lastMonthYearString: moviment.lastMonthYearString, 
      lastMonthYear: moviment.LastMonthYear
    )).toList());
  }
  
  @override
  Future<void> addMoviment(MovimentsDto moviment) async {
    MovimentCompanion movimentCompanion = MovimentCompanion(
      title: Value(moviment.title),
      amount: Value(moviment.amount),
      createdAt: Value(moviment.createdAt),
      type: Value(moviment.type),
      category: Value(moviment.category),
      repeat: Value(moviment.repeat),
      repeatMoths: Value(moviment.repeatMonths),
      monthYearString: Value(moviment.monthYearString),
      lastMonthYearString: Value(moviment.lastMonthYearString),
      lastMonth: Value(moviment.lastMonthYear)
    );

    await _myDb.into(_myDb.moviment).insert(movimentCompanion);
  }

}