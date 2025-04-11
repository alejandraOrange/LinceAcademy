import 'dart:math';

/// Converte um número decimal para binário.
String converterB(int numero) {
  return numero.toRadixString(2);
}

/// Converte um número decimal para octal.
String converterO(int numero) {
  return numero.toRadixString(8);
}

/// Converte um número decimal para hexadecimal.
String converterHx(int numero) {
  return numero.toRadixString(16).toUpperCase();
}

/// Imprime a lista de números com suas representações em binário, octal e hexadecimal.
void imprimirConversoes(List<int> lista) {
  lista.sort(); // Ordena a lista em ordem crescente
  for (int numero in lista) {
    String binario = converterB(numero);
    String octal = converterO(numero);
    String hexa = converterHx(numero);
    print(
      "Decimal: $numero, Binário: $binario, Octal: $octal, Hexadecimal: $hexa",
    );
  }
}

void main() {
  // Gera 15 números aleatórios entre 1 e 5000
  List<int> temperaturas = List.generate(15, (_) => Random().nextInt(5000));

  // Imprime os resultados
  imprimirConversoes(temperaturas);
}
