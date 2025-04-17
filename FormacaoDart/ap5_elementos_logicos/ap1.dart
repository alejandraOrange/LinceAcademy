List<int> numerosImparesAte(int limite) {
  return List.generate(limite, (i) => i).where((n) => n % 2 != 0).toList();
}

void main() {
  int valorFinal = 10; // pode alterar esse valor
  List<int> impares = numerosImparesAte(valorFinal);

  for (var numero in impares) {
    print("Impar: $numero");
  }
}
