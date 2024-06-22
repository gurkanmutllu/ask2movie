import 'package:ask2movie/product/cache/model/movie_cache_model.dart';
import 'package:ask2movie/product/cache/model/user_cache_model.dart';
import 'package:core/core.dart';

final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  ProductCache._init(this._cacheManager);
  static final ProductCache _instance = ProductCache._init(HiveCacheManager());
  static ProductCache get instance => _instance;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
        MovieCacheModel.empty(),
      ],
    );
  }

  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();

  late final HiveCacheOperation<MovieCacheModel> movieCacheOperation =
      HiveCacheOperation<MovieCacheModel>();
}
