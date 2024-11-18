import '../dtos/moviments_dto.dart';

abstract class ILocalDatasource {
    Future<void> addMoviment(MovimentsDto moviment);
    Stream<List<MovimentsDto>> getMoviments();
}