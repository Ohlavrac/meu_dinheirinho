abstract class DataSourceLocal<T> {
  List<T> getAll();
  List<String> getKeys();
  T getKey(String nameKey);
}