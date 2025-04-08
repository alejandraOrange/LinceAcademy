import 'dart:math';

void main() {
  List<int> listaOriginal = [];
  final random = Random();

  // Gera 50 números aleatórios entre 10 e 21 e adiciona à lista
  for (int i = 0; i < 50; i++) {
    int numeroAleatorio = random.nextInt(12) + 10; // Gera números entre 10 e 21
    listaOriginal.add(numeroAleatorio);
  }

  print("Lista original: ${listaOriginal.join(" ; ")}");

  // Obtém os valores únicos da lista
  Set<int> listaUnicos = listaOriginal.toSet();

  print("Itens únicos: ${listaUnicos.join(" ; ")}");
}
