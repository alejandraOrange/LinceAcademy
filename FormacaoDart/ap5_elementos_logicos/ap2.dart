import 'dart:math';

String numParaLetra(int numero) {
  if (numero < 1 || numero > 26) return '?'; //fora do intervalo
  return String.fromCharCode(64 + numero);
}

void main() {
  final random = Random();

  for (int i = 0; i < 5; i++) {
    int numero = random.nextInt(26);
    String letra = numParaLetra(numero);
    print("Numero $numero -> letra $letra");
  }
}
