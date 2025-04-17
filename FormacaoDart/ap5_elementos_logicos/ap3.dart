import 'dart:math';

int somaParesAte(int numero) {
  return List.generate(
    numero + 1,
    (i) => i,
  ).where((n) => n % 2 == 0).fold(0, (soma, n) => soma + n);
}

void main() {
  final random = Random();
  int numero = random.nextInt(1000);

  int resultado = somaParesAte(numero);

  print("A soma dos numeros pares entre 0 e $numero é $resultado");
}
