import 'package:meu_dinheirinho/data/data_source/ilocal_datasource.dart';
import 'package:meu_dinheirinho/data/dtos/moviments_dto.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';
import 'package:meu_dinheirinho/mappers/moviment_mapper.dart';

class MovimentRepository implements IMovimentRepository {
  final ILocalDatasource local;

  MovimentRepository({required this.local});

  @override
  Future<void> addMoviment(MovimentEntity moviment) async {
    return await local.addMoviment(MovimentMapper.toDto(moviment));
  }

  @override
  Stream<List<MovimentEntity>> getMoviments() async* {
    Stream<List<MovimentsDto>> movimentsDto = local.getMoviments();

    yield* movimentsDto.map((movimentsEntity) => movimentsEntity.map((moviment) => MovimentEntity(
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
  Stream<List<MovimentEntity>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault) async* {
    Stream<List<MovimentsDto>> movimentsDto = local.getMovimentsByMonth(monthAndYear, monthAndYearDefault);

    yield* MovimentMapper.dtoStreamToEntityStream(movimentsDto);
  }
  
  @override
  Future<MovimentEntity> getMovimentById(int movimentID) async {
    MovimentsDto movimentDto = await local.getMovimentById(movimentID);

    return MovimentMapper.toEntity(movimentDto);
  }

}