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

class MockRepoTest extends Mock implements IMovimentRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Database database;
  late CreateMovimentUsecase createMovimentUsecase;
  late MockRepoTest repository;

  setUpAll(() {
    database = Database();
    repository = MockRepoTest();
    createMovimentUsecase = CreateMovimentUsecase(repository: repository);
  });

  tearDown(() async {
    await database.close();
  });

  test("SHOULD RETURN NULL WHEN ALL FIELDS OF MOVIMENT IS EMPTY", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "", 
      amount: 0, 
      type: false, 
      category:  "", 
      repeat: false, 
      repeatMonths: 0, 
      monthYearString: "", 
      lastMonthYearString: ""
    );

    when(() => repository.addMoviment(moviment)).thenAnswer((_) async => false);
    bool result = await createMovimentUsecase.createNewMoviment(moviment);
    expect(result, false);
  });

  test("SHOULD RETURN FALSE WHEN MOVIMENT TITLE IS EMPTY", () async {
    MovimentEntity moviment2 = MovimentEntity(
      title: "",
      amount: 1.0,
      createdAt: DateTime.now(),
      type: true,
      category: "Outros",
      repeat: false,
      repeatMonths: 0,
      monthYearString: "",
      lastMonthYearString: ""
    );

    bool result = await createMovimentUsecase.createNewMoviment(moviment2);
    expect(result, false);
  });

  test("SHOULD RETURN FALSE WHEN MOVIMENT VALUE(AMOUNT) IS ZERO", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "Teste",
      amount: 0,
      createdAt: DateTime.now(),
      type: true,
      category: "Outros",
      repeat: false,
      repeatMonths: 0,
      monthYearString: "",
      lastMonthYearString: ""
    );

    bool result = await createMovimentUsecase.createNewMoviment(moviment);
    expect(result, false);
  });

  test("SHOULD RETURN FALSE WHEN MOVIMENT VALUE(AMOUNT) IS LESS THAN ZERO", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "Teste",
      amount: -1,
      createdAt: DateTime.now(),
      type: true,
      category: "Outros",
      repeat: false,
      repeatMonths: 0,
      monthYearString: "",
      lastMonthYearString: ""
    );

    bool result = await createMovimentUsecase.createNewMoviment(moviment);
    expect(result, false);
  });

  test("SHOULD RETURN TRUE WHEN MOVIMENT VALUE(AMOUNT) IS GREATHER THAN ZERO", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "Teste",
      amount: 10,
      createdAt: DateTime.now(),
      type: true,
      category: "Outros",
      repeat: false,
      repeatMonths: 0,
      monthYearString: "",
      lastMonthYearString: ""
    );

    when(() => repository.addMoviment(moviment)).thenAnswer((_) async => true);
    bool result = await createMovimentUsecase.createNewMoviment(moviment);
    expect(result, true);
  });

  test("SHOULD RETURN DEFAULT CATEGORY WHEN USER DONT SELECT A CATEGORY FOR THE MOVIMENT", () async {
    
  });
  
  test("SHOULD CREATE A NEW EXPANSE MOVIMENT WHIT OUT REPEAT", () async {
    MovimentEntity moviment = MovimentEntity(
      title: "teste", 
      amount: 10, 
      type: false, 
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