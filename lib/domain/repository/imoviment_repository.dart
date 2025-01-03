import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';

abstract class IMovimentRepository {
  Stream<List<MovimentEntity>> getMoviments();
  Future<bool> addMoviment(MovimentEntity moviment);
  Stream<List<MovimentEntity>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault);
  Future<MovimentEntity> getMovimentById(int movimentID);
}