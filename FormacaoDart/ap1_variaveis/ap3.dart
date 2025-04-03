import 'dart:math';

void main() {
  int numero1 = Random().nextInt(100);
  int numero2 = Random().nextInt(100);

  // Imprime os valores iniciais gerados no console.
  print("O primeiro numero aleatório é: $numero1");
  print("O segundo numero aleatório é: $numero2");

  int temp = numero1;
  numero1 = numero2;
  numero2 = temp;

  print("\nValores invertidos:\n");

  // Imprime os valores invertidos no console.
  print("O primeiro numero agora é: $numero1");
  print("O segundo numero agora é: $numero2");
}

//A variável temp atua como um espaço de armazenamento temporário para garantir que o valor original de valor1 não seja perdido durante a troca de valores.
