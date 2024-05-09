import 'package:ask2movie/src/cache/cache_model.dart';

abstract class CacheManager {
  CacheManager({required this.path});

  Future<void> init({required List<CacheModel> items});
  void remove();

  final String? path;
}
