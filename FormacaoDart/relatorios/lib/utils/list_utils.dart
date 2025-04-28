// lib/utils/list_utils.dart
Map<K, List<T>> groupBy<T, K>(List<T> list, K Function(T) key) {
  return list.fold({}, (Map<K, List<T>> map, T element) {
    final k = key(element);
    map.putIfAbsent(k, () => []).add(element);
    return map;
  });
}