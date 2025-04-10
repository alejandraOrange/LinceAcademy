import 'dart:math';

// Função A: Recebe outra função como parâmetro e a executa duas vezes.
int funcaoA(int Function(int) funcao) {
  // Gera dois números aleatórios entre 0 e 100.
  int num1 = Random().nextInt(10);
  int num2 = Random().nextInt(10);

  // Executa a função recebida com os números aleatórios e soma os resultados.
  int resultado1 = funcao(num1);
  int resultado2 = funcao(num2);

  return resultado1 + resultado2;
}

// Função B: Recebe um número e retorna o dobro dele.
int funcaoB(int numero) {
  return numero * 2;
}

// Função C: Recebe um número e retorna o quadrado dele.
int funcaoC(int numero) {
  return numero * numero;
}

void main() {
  // Executa a função A com a função B como parâmetro e imprime o resultado.
  int resultadoAB = funcaoA(funcaoB);
  print('Resultado A(B): $resultadoAB');

  // Executa a função A com a função C como parâmetro e imprime o resultado.
  int resultadoAC = funcaoA(funcaoC);
  print('Resultado A(C): $resultadoAC');
}
