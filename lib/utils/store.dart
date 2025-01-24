import 'dart:async';

class CacheClient {
  // Private 생성자 - 외부에서 인스턴스 생성 불가
  CacheClient._();

  // Static 멤버 변수
  static final Map<String, Object> _cache = <String, Object>{};
  static final _cacheUpdatesController =
      StreamController<Map<String, Object>>.broadcast();

  /// Stream of cache updates, emitted whenever the cache is modified.
  static Stream<Map<String, Object>> get cacheUpdates =>
      _cacheUpdatesController.stream;

  /// Writes the provided [key], [value] pair to the in-memory cache.
  static void write<T extends Object>({required String key, required T value}) {
    if (_cache[key] == value) {
      return;
    }

    _cache[key] = value;
    _cacheUpdatesController.add(Map.unmodifiable(_cache));
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  static T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;

    return null;
  }

  /// Returns all entries in the cache as an unmodifiable map.
  static Map<String, Object> readAll() {
    return Map.unmodifiable(_cache);
  }

  /// Clears all entries in the cache.
  static void clear() {
    _cache.clear();
    _cacheUpdatesController
        .add(Map.unmodifiable(_cache)); // Notify listeners of the change
  }

  /// Dispose the internal stream controller
  static void dispose() {
    _cacheUpdatesController.close();
  }
}
