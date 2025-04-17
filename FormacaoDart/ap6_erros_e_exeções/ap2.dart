void verNumPar(String valor) {
  try {
    int numero = int.parse(valor);
    if (numero % 2 != 0) {
      throw Exception('Entrada invalida. Insira apenas numeros pares.');
    }
    print('Entrada correta, você inseriu um numero par.');
  } catch (e) {
    print(e);
  }
}

void main() {
  verNumPar('4');
  verNumPar('7');
  verNumPar('abc');
}
