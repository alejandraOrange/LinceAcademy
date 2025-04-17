import 'dart:math';

abstract class Calculadora {
  static int dobro(int numero) {
    return numero * 2;
  }
}

void main() {
  final random = Random();
  int numeroAleatorio = random.nextInt(1000);

  int resultado = Calculadora.dobro(numeroAleatorio);

  print("O dobro do número $numeroAleatorio é: $resultado");
}
