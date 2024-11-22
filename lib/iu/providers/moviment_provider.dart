import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/use_case/create_moviment_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviments_usecase.dart';

class MovimentProvider extends ChangeNotifier {
  final CreateMovimentUsecase createMovimentUsecase;
  final GetMovimentsUsecase getMovimentsUsecase;

  MovimentProvider({
    required this.createMovimentUsecase,
    required this.getMovimentsUsecase
  });

  Future<void> createNewMoviment(MovimentEntity moviment) async {
    await createMovimentUsecase.createNewMoviment(moviment);
    notifyListeners();
  }

  Stream<List<MovimentEntity>> getMoviments() async* {
    yield* getMovimentsUsecase.getMoviments();
  }
}