import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_dinheirinho/data/data_source/local_datasource.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/data/repositories/moviment_repository.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/repository/imoviment_repository.dart';
import 'package:meu_dinheirinho/domain/use_case/create_moviment_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockRepoTest extends Mock implements MovimentRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Database database;
  LocalDatasource local = LocalDatasource();
  late MovimentRepository repository;

  setUp(() {
    database = Database();
    repository = MockRepoTest();
  });

  tearDown(() async {
    await database.close();
  });
  
  test("SHOULD CREATE A NEW EXPANSE MOVIMENT WHIT OUT REPEAT", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "teste", 
      amount: 10, 
      type: true, 
      category:  "Pagamento", 
      repeat: false, 
      repeatMonths: 0, 
      monthYearString: "", 
      lastMonthYearString: ""
    );

    CreateMovimentUsecase createMovimentUsecase = CreateMovimentUsecase(repository: repository);

    when(() => repository.addMoviment(moviment)).thenAnswer((_) async => true);

    bool result = await createMovimentUsecase.createNewMoviment(moviment);
    expect(result , true);
  });
}