import 'dart:math';

void main() {
  // Inicializa duas listas com 5 números aleatórios entre 0 e 100
  List<int> lista1 = List.generate(5, (_) => Random().nextInt(101));
  List<int> lista2 = List.generate(5, (_) => Random().nextInt(101));

  // Imprime as listas originais
  imprimirLista(lista1);
  imprimirLista(lista2);

  // Calcula a soma das listas
  List<int> listaSoma = somarListas(lista1, lista2);

  // Imprime as operações realizadas
  if (listaSoma.isNotEmpty) {
    for (int i = 0; i < lista1.length; i++) {
      print('${lista1[i]}+${lista2[i]}');
    }
  }

  // Imprime a lista resultante
  imprimirLista(listaSoma);
}

// Função para imprimir uma lista
void imprimirLista(List<int> lista) {
  if (lista.isEmpty) {
    print('Lista vazia');
  } else {
    print('Lista: ${lista.join(', ')}');
  }
}

// Função para somar duas listas e retornar uma nova lista com a soma dos itens
List<int> somarListas(List<int> lista1, List<int> lista2) {
  if (lista1.length != lista2.length) {
    return []; // Retorna lista vazia se as listas tiverem tamanhos diferentes
  }

  List<int> listaSoma = [];
  for (int i = 0; i < lista1.length; i++) {
    listaSoma.add(lista1[i] + lista2[i]);
  }
  return listaSoma;
}
