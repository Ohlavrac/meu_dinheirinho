import 'package:meu_dinheirinho/data/repositories/base_category_repository.dart';
import 'package:meu_dinheirinho/domain/repository/repository.dart';
import 'package:meu_dinheirinho/domain/use_case/use_case.dart';

import '../../entities/BaseCategory.dart';

class GetAllBaseCategory extends UseCase<List<BaseCategory>> {
  late Repository _repository;

  GetAllBaseCategory() : _repository = BaseCategoryRepository();
  
  @override
  List<BaseCategory> call(Parameters p) => _repository.all() as List<BaseCategory>;
}