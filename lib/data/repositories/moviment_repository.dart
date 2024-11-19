import 'package:meu_dinheirinho/data/data_source/ilocal_datasource.dart';
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
    // TODO: implement getMoviments
    throw UnimplementedError();
  }

}