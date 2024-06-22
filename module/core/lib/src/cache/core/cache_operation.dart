import 'package:core/src/cache/core/cache_model.dart';

abstract class CacheOperation<T extends CacheModel> {
  bool add(T item);
  void addAll(List<T> items);
  bool remove(String id);

  void clear();
  List<T> getAll();
  T? get(String id);
}
