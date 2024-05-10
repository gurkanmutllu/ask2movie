import 'package:ask2movie/product/cache/model/movie_cache_model.dart';
import 'package:core/core.dart';

final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        MovieCacheModel.empty(),
      ],
    );
  }

  late final HiveCacheOperation<MovieCacheModel> movieCacheOperation =
      HiveCacheOperation<MovieCacheModel>();
}
