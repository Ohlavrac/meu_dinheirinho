import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/use_case/create_moviment_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviment_by_id_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviments_by_month_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviments_usecase.dart';

class MovimentProvider extends ChangeNotifier {
  final CreateMovimentUsecase createMovimentUsecase;
  final GetMovimentsUsecase getMovimentsUsecase;
  final GetMovimentsByMonthUsecase getMovimentsByMonthUsecase;
  final GetMovimentByIdUsecase getMovimentByIdUsecase;

  MovimentProvider({
    required this.createMovimentUsecase,
    required this.getMovimentsUsecase,
    required this.getMovimentsByMonthUsecase,
    required this.getMovimentByIdUsecase,
  });

  Future<bool> createNewMoviment(MovimentEntity moviment) async {
    final result = await createMovimentUsecase.createNewMoviment(moviment); 
    return result;
  }

  Stream<List<MovimentEntity>> getMoviments() async* {
    yield* getMovimentsUsecase.getMoviments();
  }

  Stream<List<MovimentEntity>> getMovimentsByMonth(String monthAndYear, DateTime monthAndYearDefault) async* {
    yield* getMovimentsByMonthUsecase.getMovimentsByMonth(monthAndYear, monthAndYearDefault);
  }

  Future<MovimentEntity> getMovimentById(int movimentID) async {
    return await getMovimentByIdUsecase.getMovimentById(movimentID);
  }
}