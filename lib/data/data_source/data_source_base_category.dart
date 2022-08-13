import 'package:meu_dinheirinho/data/entities/base_category_model.dart';
import 'package:meu_dinheirinho/domain/data_source/data_source_local.dart';

import '../../core/base_categories.dart';

class DataSourceBaseCategory extends DataSourceLocal<BaseCategoryModel> {
  @override
  List<BaseCategoryModel> getAll() {
    return baseCategory;
  }
  
  @override
  List<String> getKeys() {
    var base = getAll();
    List<String> baseCategoryKey = [];
    for (var c = 0; c < base.length; c++) {
      print(base[c].name);
      baseCategoryKey.add(base[c].name.toString());
    }
    print("AQUI $baseCategoryKey");
    return baseCategoryKey;
  }
}