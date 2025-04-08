import 'dart:math';

void main() {
  List<int> listaOriginal = [];
  final random = Random();

  // Gera 50 números aleatórios entre 0 e 15 e adiciona à lista
  for (int i = 0; i < 50; i++) {
    int numeroAleatorio = random.nextInt(16);
    listaOriginal.add(numeroAleatorio);
  }

  print("Lista original: $listaOriginal");

  // Remove os números pares da lista
  listaOriginal.removeWhere((numero) => numero % 2 == 0);

  print("Lista atualizada: $listaOriginal.");
}
