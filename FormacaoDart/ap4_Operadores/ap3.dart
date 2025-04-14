List<T> removerElemento<T>(List<T>? lista, T? elemento) {
  // Se a lista for nula, retorna uma lista vazia
  List<T> listaModificada = lista?.toList() ?? [];

  // Se o elemento for nulo, retorna a lista original (ou vazia, se a lista era nula)
  if (elemento == null) {
    return listaModificada;
  }

  // Remove todas as ocorrências do elemento da lista
  listaModificada.removeWhere((item) => item == elemento);

  return listaModificada;
}

void main() {
  List<int>? numeros = [1, 2, 3, 4, 3, 5];
  int? elementoRemover = 3;

  List<int> resultado = removerElemento(numeros, elementoRemover);
  print(resultado);
}
