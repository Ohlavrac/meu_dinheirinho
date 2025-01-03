import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';

class CreateMovimentUsecase {
  final IMovimentRepository repository;

  CreateMovimentUsecase({required this.repository});

  Future<bool> createNewMoviment(MovimentEntity moviment) async {
    return await repository.addMoviment(moviment);
  }
}