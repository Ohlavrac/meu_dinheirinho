import 'package:meu_dinheirinho/data/dtos/moviments_dto.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';

class MovimentMapper {

  static MovimentsDto toDto(MovimentEntity moviment) {
    return MovimentsDto(
      title: moviment.title, 
      amount: moviment.amount, 
      type: moviment.type,
      createdAt: moviment.createdAt,
      category: moviment.category, 
      repeat: moviment.repeat, 
      repeatMonths: moviment.repeatMonths, 
      monthYearString: moviment.monthYearString, 
      lastMonthYearString: moviment.lastMonthYearString
    );
  }

  static Stream<List<MovimentsDto>> entiyStreamToDtoStream (Stream<List<MovimentEntity>> movimentsEntity) {
    return movimentsEntity.map((movimentsEntity) => movimentsEntity.map((moviment) => MovimentsDto(
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
}