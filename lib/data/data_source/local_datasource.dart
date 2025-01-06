import 'package:drift/drift.dart';
import 'package:meu_dinheirinho/data/data_source/ilocal_datasource.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/data/dtos/moviments_dto.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/mappers/moviment_mapper.dart';

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
      repeatMonths: moviment.repeatMonths,
      monthYearString: moviment.monthYearString,
      lastMonthYearString: moviment.lastMonthYearString, 
      lastMonthYear: moviment.lastMonthYear
    )).toList());
  }
  
  @override
  Future<bool> addMoviment(MovimentsDto moviment) async {
    MovimentCompanion movimentCompanion = MovimentCompanion(
      title: Value(moviment.title),
      amount: Value(moviment.amount),
      createdAt: Value(moviment.createdAt),
      type: Value(moviment.type),
      category: Value(moviment.category),
      repeat: Value(moviment.repeat),
      repeatMonths: Value(moviment.repeatMonths),
      monthYearString: Value(moviment.monthYearString),
      lastMonthYearString: Value(moviment.lastMonthYearString),
      lastMonthYear: Value(moviment.lastMonthYear)
    );

    await _myDb.into(_myDb.moviment).insert(movimentCompanion);

    return true;
  }
  
  @override
  Future deleteItem(int movimentID) {
    return (_myDb.delete(_myDb.moviment)..where((moviment) => moviment.id.equals(movimentID))).go();
  }
  
  @override
  Future<MovimentsDto> getMovimentById(int movimentID) async {
    MovimentEntity? movimentEntity = await (_myDb.select(_myDb.moviment)..where((moviment) => moviment.id.equals(movimentID))).getSingleOrNull(); 
    return MovimentMapper.toDto(movimentEntity!);
  }
  
  @override
  Stream<List<MovimentsDto>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault) async* {
    Stream<List<MovimentEntity>> movimentsEntity = (_myDb.select(_myDb.moviment)..where((moviment) => 
      moviment.monthYearString.equals(monthAndYear) | 
      moviment.repeat.equals(true) &
      moviment.lastMonthYear.isBiggerOrEqualValue(monthAndYearDefault) &
      moviment.createdAt.isSmallerOrEqualValue(monthAndYearDefault)
      )).watch();

    yield* MovimentMapper.entiyStreamToDtoStream(movimentsEntity);
  }
  
  @override
  Stream<List<MovimentsDto>> getNegativeValues() async* {
    Stream<List<MovimentEntity>> movimentsEntity = (_myDb.select(_myDb.moviment)..where((moviment) => moviment.type.equals(false))).watch();

    yield* MovimentMapper.entiyStreamToDtoStream(movimentsEntity);
  }
  
  @override
  Stream<List<MovimentsDto>> getPositiveValues() async* {
    Stream<List<MovimentEntity>> movimentsEntity = (_myDb.select(_myDb.moviment)..where((moviment) => moviment.type.equals(true))).watch();

    yield* MovimentMapper.entiyStreamToDtoStream(movimentsEntity);
  }
  
  @override
  Stream<double?> getTotalAmountInWallet() async* {
    // TODO: implement getTotalAmount
    throw UnimplementedError();
  }
  
  @override
  Future stopMovementContinue(Insertable<MovimentsDto> updatemoviment) {
    // TODO: implement stopMovementContinue
    throw UnimplementedError();
  }
  
  @override
  Future updateItem(Insertable<MovimentsDto> newmoviment) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

}