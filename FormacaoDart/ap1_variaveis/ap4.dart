import 'dart:math';

void main() {
  // Gera dois números inteiros aleatórios entre 1 e 100
  final Random random = Random();
  final int valor1 = random.nextInt(100);
  final int valor2 = random.nextInt(100);

  // Imprime os valores gerados.
  print("Valor 1: $valor1");
  print("Valor 2: $valor2");

  // Realiza a divisão de valor1 por valor2 e armazena o resultado em 'resultado'.
  final double resultado = valor1 / valor2;

  // Extrai a parte inteira do resultado usando 'toInt()'.
  final int parteInteira = resultado.toInt();

  // Extrai a parte decimal do resultado subtraindo a parte inteira do resultado original.
  final double parteDecimal = resultado - parteInteira;

  // Imprime todas as variáveis do programa.
  print("Resultado da divisão: $resultado");
  print("Parte inteira do resultado: $parteInteira");
  print("Parte decimal do resultado: $parteDecimal");
}
