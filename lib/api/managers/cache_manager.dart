abstract class CacheManager<T> {
  final Map<String, T> _cache = {};
  Map<String, T> get cache => _cache;
}