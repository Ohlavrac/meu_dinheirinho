import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';

class CreateMovimentUsecase {
  final IMovimentRepository repository;

  CreateMovimentUsecase({required this.repository});

  Future<void> createNewMoviment(MovimentEntity moviment) {
    return repository.addMoviment(moviment);
  }
}