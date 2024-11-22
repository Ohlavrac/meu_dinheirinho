import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';

class GetMovimentsUsecase {
  final IMovimentRepository repository;

  GetMovimentsUsecase({required this.repository});

  Stream<List<MovimentEntity>> getMoviments() async* {
    yield* repository.getMoviments();
  }
}