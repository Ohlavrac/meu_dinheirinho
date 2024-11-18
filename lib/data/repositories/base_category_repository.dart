import 'package:meu_dinheirinho/data/data_source/data_source_base_category.dart';
import 'package:meu_dinheirinho/data/dtos/base_category_model.dart';
import 'package:meu_dinheirinho/domain/repository/repository.dart';

class BaseCategoryRepository extends Repository<BaseCategoryModel> {
  BaseCategoryRepository() : super(local: DataSourceBaseCategory());
}