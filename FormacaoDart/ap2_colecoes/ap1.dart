import 'dart:math';

void main() {
  List<int> lista = [];
  // Cria uma instância da classe Random para gerar números aleatórios
  final random = Random();
  for (int i = 0; i < 10; i++) {
    int numeroAleatorio = random.nextInt(
      101,
    ); // cria numeros aleatorios de 0 a 100
    lista.add(numeroAleatorio);
  }
  //imprime a posição e valor de cada elemento da lista
  for (int i = 0; i < lista.length; i++) {
    print("Posição: $i, valor: ${lista[i]}  ");
  }
}
