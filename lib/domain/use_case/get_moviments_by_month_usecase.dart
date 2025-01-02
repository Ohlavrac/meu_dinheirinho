import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';

class GetMovimentsByMonthUsecase {
    final IMovimentRepository repository;

    GetMovimentsByMonthUsecase({required this.repository});

    Stream<List<MovimentEntity>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault) async * {
        yield* repository.getMovimentsByMonth(monthAndYear, monthAndYearDefault);
    }
}