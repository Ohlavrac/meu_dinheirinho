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
}