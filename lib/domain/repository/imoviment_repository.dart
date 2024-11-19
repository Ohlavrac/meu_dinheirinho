import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';

abstract class IMovimentRepository {
  Stream<List<MovimentEntity>> getMoviments();
  Future<void> addMoviment(MovimentEntity moviment);
}