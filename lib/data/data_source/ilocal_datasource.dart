import 'package:drift/drift.dart';

import '../dtos/moviments_dto.dart';

abstract class ILocalDatasource {
    Future<void> addMoviment(MovimentsDto moviment);
    Stream<List<MovimentsDto>> getMoviments();
    Stream<List<MovimentsDto>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault);
    Stream<List<MovimentsDto>> getPositiveValues();
    Stream<List<MovimentsDto>> getNegativeValues();
    Stream<double?> getTotalAmountInWallet();
    Future<MovimentsDto> getMovimentById(int movimentID);
    Future deleteItem(int movimentID);
    Future updateItem(Insertable<MovimentsDto> newmoviment);
    Future stopMovementContinue(Insertable<MovimentsDto> updatemoviment);
}