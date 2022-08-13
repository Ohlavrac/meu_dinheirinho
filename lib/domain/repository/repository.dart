import 'package:meu_dinheirinho/domain/data_source/data_source_local.dart';

abstract class Repository<T> {
  late DataSourceLocal local;

  Repository({required this.local});

  List<T> all() => local.getAll() as List<T>;
}