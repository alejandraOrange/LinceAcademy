String getNomeMes(int mes) {
  switch (mes) {
    case 1: return 'Janeiro';
    case 2: return 'Fevereiro';
    case 3: return 'Março';
    case 4: return 'Abril';
    case 5: return 'Maio';
    case 6: return 'Junho';
    case 7: return 'Julho';
    case 8: return 'Agosto';
    case 9: return 'Setembro';
    case 10: return 'Outubro';
    case 11: return 'Novembro';
    case 12: return 'Dezembro';
    default: return 'Mês Inválido';
  }
}

Map<K, List<T>> groupBy<T, K>(List<T> list, K Function(T) key) {
  return list.fold({}, (Map<K, List<T>> map, T element) {
    final k = key(element);
    map.putIfAbsent(k, () => []).add(element);
    return map;
  });
}