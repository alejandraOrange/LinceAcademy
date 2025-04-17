void convertPInt(String entrada) {
  try {
    int numero = int.parse(entrada);
    print('Numero digitado: $numero');
  } catch (e) {
    print('Entrada invalida. Digite apenas numeros inteiros.');
  }
}

void main() {
  convertPInt('9999');
  convertPInt('abc');
}
