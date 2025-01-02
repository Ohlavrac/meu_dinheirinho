import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';

class GetMovimentByIdUsecase {
  final IMovimentRepository repository;

  GetMovimentByIdUsecase({required this.repository});

  Future<MovimentEntity> getMovimentById(int movimentID) async {
    return await repository.getMovimentById(movimentID);
  }
}